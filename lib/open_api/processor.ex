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
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  @doc """
  Run the processing phase of the code generator

  This functions is used by the main `OpenAPI` module. It is unlikely that you will call this
  function directly, unless you are reimplementing one of the core functions. If this happens,
  please share your use-case with the maintainers; a plugin might be warranted.
  """
  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(state) do
    state
    |> State.new()
    |> collect_operations_and_schemas()

    # |> IO.inspect(pretty: true, syntax_colors: IO.ANSI.syntax_colors())
    state
  end

  #
  # Integration
  #

  defmacro __using__(_opts) do
    quote do
      defdelegate ignore_operation?(state, operation), to: OpenAPI.Processor
      defdelegate ignore_schema?(state, schema), to: OpenAPI.Processor
      defdelegate operation_docstring(state, operation_spec, params), to: OpenAPI.Processor
      defdelegate operation_function_name(state, operation_spec), to: OpenAPI.Processor
      defdelegate operation_module_names(state, operation_spec), to: OpenAPI.Processor
      defdelegate operation_request_body(state, operation_spec), to: OpenAPI.Processor
      defdelegate operation_request_method(state, operation_spec), to: OpenAPI.Processor
      defdelegate operation_response_body(state, operation_spec), to: OpenAPI.Processor

      defoverridable ignore_operation?: 2,
                     ignore_schema?: 2,
                     operation_docstring: 3,
                     operation_function_name: 2,
                     operation_module_names: 2,
                     operation_request_body: 2,
                     operation_request_method: 2,
                     operation_response_body: 2
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
                      operation_response_body: 2

  @doc """
  Whether to render the given operation in the generated code

  If this function returns `true`, the operation will not appear in the generated code.

  See `OpenAPI.Processor.ignore_operation?/2` for the default implementation.
  """
  @callback ignore_operation?(State.t(), OperationSpec.t()) :: boolean

  @doc """
  Whether to render the given schema in the generated code

  If this function returns `true`, the schema will not appear in the generated code (unless it
  returns `false` when presented in another context) and a plain `map` will be used as its type.

  See `OpenAPI.Processor.ignore_schema?/2` for the default implementation.
  """
  @callback ignore_schema?(State.t(), SchemaSpec.t()) :: boolean

  @doc """
  Construct a docstring for the given operation

  This function accepts the operation spec as well as a list of the **processed** query params
  associated with the operation.

  See `OpenAPI.Processor.Operation.docstring/2` for the default implementation.
  """
  @callback operation_docstring(State.t(), OperationSpec.t(), [Param.t()]) :: String.t()

  @doc """
  Choose the name of the client function for the given operation

  This function accepts the operation spec and chooses a name for the client function that will
  be generated. The name must be unique within its module (see `c:operation_module_name/1`).

  See `OpenAPI.Processor.Naming.operation_function/2` for the default implementation.
  """
  @callback operation_function_name(State.t(), OperationSpec.t()) :: atom

  @doc """
  Choose the names of the client function modules for the given operation

  Each operation may have multiple client functions in different modules. This function accepts
  the operation spec and returns a list of all of its operation modules.

  See `OpenAPI.Processor.Naming.operation_modules/2` for the default implementation.
  """
  @callback operation_module_names(State.t(), OperationSpec.t()) :: [module]

  @doc """
  Collect a list of request content types and their associated schemas

  This function accepts the operation spec and returns a list of tuples containing the content
  type (ex. "application/json") and the schema associated with that type.

  See `OpenAPI.Processor.Operation.request_body/1` for the default implementation.
  """
  @callback operation_request_body(State.t(), OperationSpec.t()) :: Operation.request_body()

  @doc """
  Choose and cast the request method for the given operation

  This function accepts the operation spec and must return the (lowercase) atom representing the
  HTTP method.

  See `OpenAPI.Processor.Operation.request_method/1` for the default implementation.
  """
  @callback operation_request_method(State.t(), OperationSpec.t()) :: Operation.method()

  @doc """
  Collect a list of response status codes and their associated schemas

  This function accepts the operation spec and returns a list of tuples containing the status
  codes (ex. `200` or `:default`) and the schema associated with that code.

  See `OpenAPI.Processor.Operation.response_body/1` for the default implementation.
  """
  @callback operation_response_body(State.t(), OperationSpec.t()) :: Operation.response_body()

  #
  # Default Implementations
  #

  defdelegate ignore_operation?(state, operation_spec), to: OpenAPI.Processor.Ignore
  defdelegate ignore_schema?(state, schema_spec), to: OpenAPI.Processor.Ignore

  defdelegate operation_docstring(state, operation_spec, params),
    to: OpenAPI.Processor.Operation,
    as: :docstring

  defdelegate operation_function_name(state, operation_spec),
    to: OpenAPI.Processor.Naming,
    as: :operation_function

  defdelegate operation_module_names(state, operation_spec),
    to: OpenAPI.Processor.Naming,
    as: :operation_modules

  defdelegate operation_request_body(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :request_body

  defdelegate operation_request_method(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :request_method

  defdelegate operation_response_body(state, operation_spec),
    to: OpenAPI.Processor.Operation,
    as: :response_body

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
        # |> IO.inspect(pretty: true, syntax_colors: IO.ANSI.syntax_colors())

        state
    end
  end

  @spec process_operation(State.t(), OperationSpec.t()) :: [Operation.t()]
  defp process_operation(state, operation_spec) do
    %State{implementation: implementation} = state

    %OperationSpec{
      "$oag_path": request_path,
      "$oag_path_parameters": params_from_path,
      parameters: params_from_operation
    } = operation_spec

    all_params = Enum.map(params_from_path ++ params_from_operation, &Param.from_spec/1)
    path_params = Enum.filter(all_params, &(&1.location == :path))
    query_params = Enum.filter(all_params, &(&1.location == :query))

    docstring = implementation.operation_docstring(state, operation_spec, query_params)
    module_names = implementation.operation_module_names(state, operation_spec)

    # TODO: Process schemas here
    request_body =
      implementation.operation_request_body(state, operation_spec)
      |> Enum.sort_by(fn {content_type, _schema} -> content_type end)
      |> Enum.map(fn {content_type, schema} -> {content_type, schema} end)

    request_method = implementation.operation_request_method(state, operation_spec)

    # TODO: Process schemas here
    response_body =
      implementation.operation_response_body(state, operation_spec)
      |> Enum.sort_by(fn {status_code, _schemas} -> status_code end)
      |> Enum.map(fn {status_code, schemas} -> {status_code, schemas} end)

    for module_name <- module_names do
      function_name = implementation.operation_function_name(state, operation_spec)
      IO.puts("#{inspect(module_name)}.#{function_name}")

      %Operation{
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
    end
  end
end

# Create module name callback that returns all possible module names (based on operation ID first,
# tags second, default configured module third). Modify function name callback to accept the
# module name and trim the beginning of the function name if necessary. Then create an operation
# struct for each name.
#
# Save the operations and start processing schemas.
