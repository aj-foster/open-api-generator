defmodule OpenAPI.Processor do
  @moduledoc """
  Phase two of code generation

  The **process** phase begins with a decoded API description from the **read** phase. It may
  represent the contents of one or more files, including one or more root descriptions if
  supplemental files were used.

  This library takes an "operation first" mindset when processing the description. Schemas are
  ignored until they are referenced by an operation (ex. as a response body). It is the job of
  this phase to observe all of the operations and their referenced schemas, process them into
  data structures more relevant to code generation, and prepare the data for rendering.

  ## Customization

  At several points during code generation, it may be useful to customize the behaviour of the
  processor. For this purpose, this module is a Behaviour with most of its critical logic
  implemented as optional callbacks.
  """
  alias OpenAPI.Processor.Format
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Schema.Field
  alias OpenAPI.Processor.State
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @doc """
  Run the processing phase of the code generator

  This functions is used by the main `OpenAPI` module. It is unlikely that you will call this
  function directly, unless you are reimplementing one of the core functions. If this happens,
  please share your use-case with the maintainers; a plugin might be warranted.
  """
  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(state) do
    %State{operations: operations, schemas_by_ref: schemas_by_ref} =
      state
      |> State.new()
      |> collect_operations_and_schemas()
      |> record_schema_output_format()
      |> record_schema_module_and_type()

    %OpenAPI.State{state | operations: operations, schemas: schemas_by_ref}
  end

  #
  # Integration
  #

  defmacro __using__(_opts) do
    quote do
      @behaviour OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate ignore_operation?(state, operation), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate ignore_schema?(state, schema), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_docstring(state, operation_spec, params), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_function_name(state, operation_spec), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_module_names(state, operation_spec), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_request_body(state, operation_spec), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_request_method(state, operation_spec), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate operation_response_body(state, operation_spec), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate schema_format(state, schema), to: OpenAPI.Processor

      @impl OpenAPI.Processor
      defdelegate schema_module_and_type(state, schema), to: OpenAPI.Processor

      defoverridable ignore_operation?: 2,
                     ignore_schema?: 2,
                     operation_docstring: 3,
                     operation_function_name: 2,
                     operation_module_names: 2,
                     operation_request_body: 2,
                     operation_request_method: 2,
                     operation_response_body: 2,
                     schema_format: 2,
                     schema_module_and_type: 2
    end
  end

  #
  # Callbacks
  #

  @optional_callbacks ignore_operation?: 2,
                      ignore_schema?: 2,
                      operation_docstring: 3,
                      operation_function_name: 2,
                      operation_module_names: 2,
                      operation_request_body: 2,
                      operation_request_method: 2,
                      operation_response_body: 2,
                      schema_format: 2,
                      schema_module_and_type: 2

  @doc """
  Whether to render the given operation in the generated code

  If this function returns `true`, the operation will not appear in the generated code.

  See `OpenAPI.Processor.Ignore.ignore_operation?/2` for the default implementation.
  """
  @callback ignore_operation?(state :: State.t(), operation_spec :: OperationSpec.t()) :: boolean

  @doc """
  Whether to render the given schema in the generated code

  If this function returns `true`, the schema will not appear in the generated code (unless it
  returns `false` when presented in another context) and a plain `map` will be used as its type.

  See `OpenAPI.Processor.Ignore.ignore_schema?/2` for the default implementation.
  """
  @callback ignore_schema?(state :: State.t(), schema_spec :: SchemaSpec.t()) :: boolean

  @doc """
  Construct a docstring for the given operation

  This function accepts the operation spec as well as a list of the **processed** query params
  associated with the operation.

  See `OpenAPI.Processor.Operation.docstring/3` for the default implementation.
  """
  @callback operation_docstring(
              state :: State.t(),
              operation_spec :: OperationSpec.t(),
              query_params :: [Param.t()]
            ) :: String.t()

  @doc """
  Choose the name of the client function for the given operation

  This function accepts the operation spec and chooses a name for the client function that will
  be generated. The name must be unique within its module (see `c:operation_module_names/2`).

  See `OpenAPI.Processor.Naming.operation_function/2` for the default implementation.
  """
  @callback operation_function_name(state :: State.t(), operation_spec :: OperationSpec.t()) ::
              atom

  @doc """
  Choose the names of the client function modules for the given operation

  Each operation may have multiple client functions in different modules. This function accepts
  the operation spec and returns a list of all of its operation modules.

  See `OpenAPI.Processor.Naming.operation_modules/2` for the default implementation.
  """
  @callback operation_module_names(state :: State.t(), operation_spec :: OperationSpec.t()) :: [
              module
            ]

  @doc """
  Collect a list of request content types and their associated schemas

  This function accepts the operation spec and returns a list of tuples containing the content
  type (ex. "application/json") and the schema associated with that type.

  See `OpenAPI.Processor.Operation.request_body/2` for the default implementation.
  """
  @callback operation_request_body(state :: State.t(), operation_spec :: OperationSpec.t()) ::
              Operation.request_body_unprocessed()

  @doc """
  Choose and cast the request method for the given operation

  This function accepts the operation spec and must return the (lowercase) atom representing the
  HTTP method.

  See `OpenAPI.Processor.Operation.request_method/2` for the default implementation.
  """
  @callback operation_request_method(state :: State.t(), operation_spec :: OperationSpec.t()) ::
              Operation.method()

  @doc """
  Collect a list of response status codes and their associated schemas

  This function accepts the operation spec and returns a list of tuples containing the status
  codes (ex. `200` or `:default`) and a list of tuples with the possible content types and the
  schema associated with that code and type.

  See `OpenAPI.Processor.Operation.response_body/2` for the default implementation.
  """
  @callback operation_response_body(state :: State.t(), operation_spec :: OperationSpec.t()) ::
              Operation.response_body_unprocessed()

  @doc """
  Choose the output format for the given schema

  Schemas can be output in a number of different ways, the most common of which are structs and
  typed maps. This callback chooses which output format to use for a processed schema. This
  decision may influence the naming (module and type) given to the schema.

  The special value `:unknown` may be returned from this callback to delay / re-enqueue the
  schema for processing. This may appropriate, for example, if the schema's parent has not yet
  been processed. Note that continually returning `:unknown` can cause an infinite loop.

  See `OpenAPI.Processor.Format.schema_format/2` for the default implementation.
  """
  @callback schema_format(state :: State.t(), schema :: Schema.t()) :: Format.format() | :unknown

  @doc """
  Choose the name of the module and type for the given schema

  Each module may contain multiple schemas with distinct types. By convention, the default
  type (used for single-schema modules) is `:t`, as in `MySchema.t()`. Additional schemas in the
  same module may represent variations on the default type, such as a `User.public()` schema
  containing a reduced set of fields from `User.t()`.

  See `OpenAPI.Processor.Naming.schema_module_and_type/2` for the default implementation.
  """
  @callback schema_module_and_type(state :: State.t(), schema :: Schema.t()) :: {module, atom}

  #
  # Default Implementations
  #

  @behaviour __MODULE__

  @doc false
  @impl __MODULE__
  defdelegate ignore_operation?(state, operation_spec), to: OpenAPI.Processor.Ignore

  @doc false
  @impl __MODULE__
  defdelegate ignore_schema?(state, schema_spec), to: OpenAPI.Processor.Ignore

  @doc false
  @impl __MODULE__
  defdelegate operation_docstring(state, operation_spec, params),
    to: OpenAPI.Processor.Operation,
    as: :docstring

  @doc false
  @impl __MODULE__
  defdelegate operation_function_name(state, operation_spec),
    to: OpenAPI.Processor.Naming,
    as: :operation_function

  @doc false
  @impl __MODULE__
  defdelegate operation_module_names(state, operation_spec),
    to: OpenAPI.Processor.Naming,
    as: :operation_modules

  @doc false
  @impl __MODULE__
  defdelegate operation_request_body(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :request_body

  @doc false
  @impl __MODULE__
  defdelegate operation_request_method(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :request_method

  @doc false
  @impl __MODULE__
  defdelegate operation_response_body(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :response_body

  @doc false
  @impl __MODULE__
  defdelegate schema_format(state, schema), to: OpenAPI.Processor.Format

  @doc false
  @impl __MODULE__
  defdelegate schema_module_and_type(state, schema_spec), to: OpenAPI.Processor.Naming

  #
  # Helpers
  #

  @methods [:get, :put, :post, :delete, :options, :head, :patch, :trace]

  @spec collect_operations_and_schemas(State.t()) :: State.t()
  defp collect_operations_and_schemas(state) do
    %State{implementation: implementation, spec: %Spec{paths: paths}} = state

    for {_path, item} <- paths,
        method <- @methods,
        operation_spec = Map.get(item, method),
        not implementation.ignore_operation?(state, operation_spec),
        reduce: state do
      state ->
        process_operation(state, operation_spec)
    end
  end

  @spec process_operation(State.t(), OperationSpec.t()) :: State.t()
  defp process_operation(state, operation_spec) do
    %State{implementation: implementation} = state

    %OperationSpec{
      "$oag_path": request_path,
      "$oag_path_parameters": params_from_path,
      parameters: params_from_operation
    } = operation_spec

    {state, all_params} =
      (params_from_path ++ params_from_operation)
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn param, {state, params} ->
        {state, param} = Param.from_spec(state, param)
        {state, [param | params]}
      end)

    path_params = Enum.filter(all_params, &(&1.location == :path))
    query_params = Enum.filter(all_params, &(&1.location == :query))

    docstring = implementation.operation_docstring(state, operation_spec, query_params)
    module_names = implementation.operation_module_names(state, operation_spec)
    request_method = implementation.operation_request_method(state, operation_spec)

    for module_name <- module_names, reduce: state do
      state ->
        function_name = implementation.operation_function_name(state, operation_spec)

        {state, request_body} =
          implementation.operation_request_body(state, operation_spec)
          |> process_request_body(state, module_name, function_name)

        {state, response_body} =
          implementation.operation_response_body(state, operation_spec)
          |> process_response_body(state, module_name, function_name)

        operation = %Operation{
          docstring: docstring,
          function_name: function_name,
          module_name: module_name,
          request_body: request_body,
          request_method: request_method,
          request_path: request_path,
          request_path_parameters: path_params,
          request_query_parameters: query_params,
          responses: response_body
        }

        %State{state | operations: [operation | state.operations]}
    end
  end

  @spec process_request_body(Operation.request_body_unprocessed(), State.t(), String.t(), atom) ::
          {State.t(), Operation.request_body()}
  defp process_request_body(request_body, state, op_module_name, op_function_name) do
    request_body
    |> Enum.sort_by(fn {content_type, _schema} -> content_type end, :desc)
    |> Enum.reduce({state, []}, fn {content_type, schema_spec}, {state, request_body} ->
      context = {:request, op_module_name, op_function_name, content_type}
      {state, type} = Type.from_schema(state, schema_spec)

      state =
        Type.reduce(type, state, fn t, state ->
          if is_reference(t) do
            schema = Map.fetch!(state.schema_specs_by_ref, t)
            process_schema(state, t, schema, context)
          else
            state
          end
        end)

      {state, [{content_type, type} | request_body]}
    end)
  end

  @spec process_response_body(Operation.response_body_unprocessed(), State.t(), String.t(), atom) ::
          {State.t(), Operation.response_body()}
  defp process_response_body(response_body, state, op_module_name, op_function_name) do
    response_body
    |> Enum.sort_by(fn {status_code, _schema} -> status_code end, :desc)
    |> Enum.reduce({state, []}, fn {status_code, schema_specs}, {state, response_body} ->
      {state, schema_types} =
        schema_specs
        |> Enum.reverse()
        |> Enum.reduce({state, %{}}, fn {content_type, schema_spec}, {state, schema_types} ->
          context = {:response, op_module_name, op_function_name, status_code, content_type}
          {state, type} = Type.from_schema(state, schema_spec)

          state =
            Type.reduce(type, state, fn t, state ->
              if is_reference(t) do
                schema = Map.fetch!(state.schema_specs_by_ref, t)
                process_schema(state, t, schema, context)
              else
                state
              end
            end)

          {state, Map.put(schema_types, content_type, type)}
        end)

      {state, [{status_code, schema_types} | response_body]}
    end)
  end

  @spec process_schema(State.t(), reference, SchemaSpec.t(), tuple, MapSet.t()) :: State.t()
  defp process_schema(state, ref, schema_spec, context, seen_refs \\ MapSet.new()) do
    schema_spec = SchemaSpec.add_context(schema_spec, context)

    if MapSet.member?(seen_refs, ref) do
      state
    else
      %State{implementation: implementation, schemas_by_ref: schemas_by_ref} = state
      seen_refs = MapSet.put(seen_refs, ref)

      cond do
        implementation.ignore_schema?(state, schema_spec) ->
          schema = Schema.map(ref)
          State.put_new_schema(state, ref, schema)

        schema = Map.get(schemas_by_ref, ref) ->
          schema = Schema.merge_contexts(schema, schema_spec)
          State.put_schema(state, ref, schema)

        :else ->
          {state, fields} = process_schema_fields(state, schema_spec, ref, seen_refs)

          schema = Schema.new(ref, schema_spec, fields)
          State.put_schema(state, ref, schema)
      end
    end
  end

  @spec process_schema_fields(State.t(), SchemaSpec.t(), reference, MapSet.t()) ::
          {State.t(), [Field.t()]}
  defp process_schema_fields(state, schema_spec, parent_ref, seen_refs) do
    %SchemaSpec{properties: properties, required: required} = schema_spec

    for {field_name, field_spec} <- properties, reduce: {state, []} do
      {state, fields} ->
        nullable? =
          case field_spec do
            %SchemaSpec{nullable: nullable?} -> nullable?
            {:ref, _} -> false
          end

        required? = is_list(required) and field_name in required
        context = {:field, parent_ref, field_name}
        {state, type} = Type.from_schema(state, field_spec)

        state =
          Type.reduce(type, state, fn t, state ->
            if is_reference(t) do
              schema = Map.fetch!(state.schema_specs_by_ref, t)
              process_schema(state, t, schema, context, seen_refs)
            else
              state
            end
          end)

        field_name =
          case config(state, :field_casing) do
            :camel -> OpenAPI.Processor.Naming.normalize_identifier(field_name, :lower_camel)
            :snake -> OpenAPI.Processor.Naming.normalize_identifier(field_name, :snake)
            _else -> field_name
          end

        field = %Field{
          name: field_name,
          nullable: nullable?,
          private: false,
          required: required?,
          type: type
        }

        {state, [field | fields]}
    end
  end

  @spec record_schema_output_format(State.t()) :: State.t()
  defp record_schema_output_format(state) do
    %State{schemas_by_ref: schemas_by_ref} = state

    to_process =
      schemas_by_ref
      |> Map.values()
      |> :queue.from_list()

    do_record_schema_output_format(state, to_process)
  end

  @spec do_record_schema_output_format(State.t(), :queue.queue(Schema.t())) :: State.t()
  defp do_record_schema_output_format(state, to_process) do
    %State{implementation: implementation} = state

    case :queue.out(to_process) do
      {{:value, schema}, to_process} ->
        case implementation.schema_format(state, schema) do
          :unknown ->
            to_process = :queue.in(schema, to_process)
            do_record_schema_output_format(state, to_process)

          format ->
            schema = %Schema{schema | output_format: format}
            state = State.put_schema(state, schema.ref, schema)
            do_record_schema_output_format(state, to_process)
        end

      {:empty, _to_process} ->
        state
    end
  end

  @spec record_schema_module_and_type(State.t()) :: State.t()
  defp record_schema_module_and_type(state) do
    %State{implementation: implementation, schemas_by_ref: schemas_by_ref} = state

    for {_ref, schema} <- schemas_by_ref, reduce: state do
      state ->
        {module, type} = implementation.schema_module_and_type(state, schema)
        schema = %Schema{schema | module_name: module, type_name: type}
        State.put_schema(state, schema.ref, schema)
    end
  end

  @spec config(OpenAPI.Processor.State.t(), atom) :: term
  @spec config(OpenAPI.Processor.State.t(), atom, term) :: term
  defp config(state, key, default \\ nil) do
    %OpenAPI.Processor.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(key, default)
  end
end
