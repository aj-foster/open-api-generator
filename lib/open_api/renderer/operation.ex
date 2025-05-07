defmodule OpenAPI.Renderer.Operation do
  @moduledoc """
  Default implementation for callbacks related to rendering operations

  This module contains the default implementations for:

    * `c:OpenAPI.Renderer.render_operations/2`
    * `c:OpenAPI.Renderer.render_operation/2`
    * `c:OpenAPI.Renderer.render_operation_doc/2`
    * `c:OpenAPI.Renderer.render_operation_function/2`
    * `c:OpenAPI.Renderer.render_operation_spec/2`

  These focus on the operation functions and surrounding code.

  ## Configuration

  All configuration offered by the functions in this module lives under the `output` key of the
  active configuration profile. For example (default values shown):

      # config/config.exs

      config :oapi_generator, default: [
        output: [
          base_module: nil,
          operation_call: [
            request: :list
          ],
          types: [
            error: nil
          ]
        ]
      ]

  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @doc """
  Render all of the operations contained in a single module

  Default implementation of `c:OpenAPI.Renderer.render_operations/2`.

  This implementation iterates through the operations contained in a file, sorted by their
  function name, and calls both `c:OpenAPI.Renderer.render_operation/2` and
  `c:OpenAPI.Renderer.render_schema_types/2` callbacks for each. The latter is only given schemas
  that have an output format of `:typed_map` and relate exclusively to the operation. Afterwards,
  it calls `c:OpenAPI.Renderer.render_schema_field_function/2` for all schemas that had types
  output earlier. It returns a list of AST nodes.
  """
  @spec render_all(State.t(), File.t()) :: Macro.t()
  def render_all(state, file) do
    %State{implementation: implementation} = state
    %File{module: module, operations: operations, schemas: schemas} = file

    related_schemas =
      schemas
      |> Enum.filter(&(&1.output_format == :typed_map))
      |> filter_related_schemas(state, module)
      |> Enum.group_by(&{&1.module_name, &1.type_name})
      |> Enum.map(fn {_module_and_type, schemas} -> Enum.reduce(schemas, &Schema.merge/2) end)
      |> List.flatten()
      |> Enum.sort_by(& &1.type_name)

    related_schemas_by_operation = group_related_schemas(related_schemas, state)

    for operation <- Enum.sort_by(operations, & &1.function_name) do
      related_schemas = related_schemas_by_operation[operation.function_name] || []

      Util.clean_list([
        implementation.render_schema_types(state, related_schemas),
        implementation.render_operation(state, operation)
      ])
    end
  end

  defp filter_related_schemas(schemas, state, module) do
    to_process =
      schemas
      |> Enum.filter(&(&1.output_format == :typed_map))
      |> :queue.from_list()

    do_filter_related_schemas(
      %{schemas_by_ref: state.schemas, module: module, filter_by_ref: %{}, final: []},
      to_process
    )
  end

  defp do_filter_related_schemas(
         %{
           schemas_by_ref: schemas_by_ref,
           module: module,
           filter_by_ref: filter_by_ref,
           final: final
         },
         to_process
       ) do
    case :queue.out(to_process) do
      {{:value, %Schema{context: [{:response, ^module, _, _, _}], ref: ref} = schema}, to_process} ->
        do_filter_related_schemas(
          %{
            schemas_by_ref: schemas_by_ref,
            module: module,
            filter_by_ref: Map.put(filter_by_ref, ref, true),
            final: [schema | final]
          },
          to_process
        )

      {{:value, %Schema{context: [{:field, parent_ref, _}], ref: ref} = schema}, to_process} ->
        case Map.fetch(filter_by_ref, parent_ref) do
          {:ok, true} ->
            do_filter_related_schemas(
              %{
                schemas_by_ref: schemas_by_ref,
                module: module,
                filter_by_ref: Map.put(filter_by_ref, ref, true),
                final: [schema | final]
              },
              to_process
            )

          {:ok, false} ->
            do_filter_related_schemas(
              %{
                schemas_by_ref: schemas_by_ref,
                module: module,
                filter_by_ref: Map.put(filter_by_ref, ref, false),
                final: final
              },
              to_process
            )

          :error ->
            to_process = :queue.in(schema, to_process)

            do_filter_related_schemas(
              %{
                schemas_by_ref: schemas_by_ref,
                module: module,
                filter_by_ref: filter_by_ref,
                final: final
              },
              to_process
            )
        end

      {{:value, %Schema{ref: ref}}, to_process} ->
        do_filter_related_schemas(
          %{
            schemas_by_ref: schemas_by_ref,
            module: module,
            filter_by_ref: Map.put(filter_by_ref, ref, false),
            final: final
          },
          to_process
        )

      {:empty, _to_process} ->
        final
    end
  end

  defp group_related_schemas(schemas, state) do
    do_group_related_schemas(
      %{schemas_by_ref: state.schemas, group_by_ref: %{}, final: %{}},
      :queue.from_list(schemas)
    )
  end

  defp do_group_related_schemas(
         %{
           schemas_by_ref: schemas_by_ref,
           group_by_ref: group_by_ref,
           final: final
         },
         to_process
       ) do
    case :queue.out(to_process) do
      {{:value, %Schema{context: [{:response, _, operation, _, _}], ref: ref} = schema},
       to_process} ->
        do_group_related_schemas(
          %{
            schemas_by_ref: schemas_by_ref,
            group_by_ref: Map.put(group_by_ref, ref, operation),
            final: Map.update(final, operation, [schema], fn schemas -> [schema | schemas] end)
          },
          to_process
        )

      {{:value, %Schema{context: [{:field, parent_ref, _}], ref: ref} = schema}, to_process} ->
        if operation = Map.get(group_by_ref, parent_ref) do
          do_group_related_schemas(
            %{
              schemas_by_ref: schemas_by_ref,
              group_by_ref: Map.put(group_by_ref, ref, operation),
              final: Map.update(final, operation, [schema], fn schemas -> [schema | schemas] end)
            },
            to_process
          )
        else
          to_process = :queue.in(schema, to_process)

          do_group_related_schemas(
            %{
              schemas_by_ref: schemas_by_ref,
              group_by_ref: group_by_ref,
              final: final
            },
            to_process
          )
        end

      {{:value, %Schema{ref: ref} = schema}, to_process} ->
        do_group_related_schemas(
          %{
            schemas_by_ref: schemas_by_ref,
            group_by_ref: Map.put(group_by_ref, ref, :unknown),
            final: Map.update(final, :unknown, [schema], fn schemas -> [schema | schemas] end)
          },
          to_process
        )

      {:empty, _to_process} ->
        final
    end
  end

  @doc """
  Render a single operation

  Default implementation of `c:OpenAPI.Renderer.render_operation/2`.

  This implementation calls the following callbacks and concatenates their results:

    * `c:OpenAPI.Renderer.render_operation_doc/2`
    * `c:OpenAPI.Renderer.render_operation_spec/2`
    * `c:OpenAPI.Renderer.render_operation_function/2`

  """
  @spec render(State.t(), Operation.t()) :: Macro.t()
  def render(state, operation) do
    %State{implementation: implementation} = state

    # types = implementation.render_operation_types(operation)
    docstring = implementation.render_operation_doc(state, operation)
    typespec = implementation.render_operation_spec(state, operation)
    function = implementation.render_operation_function(state, operation)

    Util.clean_list([docstring, typespec, function])
  end

  @doc """
  Render the docstring for an operation function

  Default implementation of `c:OpenAPI.Renderer.render_operation_doc/2`.

  This implementation uses the docstring created by the processor without modification.
  """
  @spec render_doc(State.t(), Operation.t()) :: Macro.t()
  def render_doc(_state, operation) do
    %Operation{docstring: docstring} = operation

    quote do
      @doc unquote(docstring)
    end
  end

  @doc """
  Render the function definition for an operation function

  Default implementation of `c:OpenAPI.Renderer.render_operation_function/2`.

  This implementation constructs a function that calls a dynamically chosen client module's
  `request` function with details about the operation.

  ## Configuration

  Use `output.operation_call` to modify the format of output code within the function call. For
  example, the following will output a map for the request body information:

      config :oapi_generator, default: [
        output: [
          operation_call: [
            request: :map
          ]
        ]
      ]

  ## Example

        def my_operation(path_param, body, opts \\ []) do
          client = opts[:client] || @default_client
          query = Keyword.take(opts, [:query_param])

          client.request(%{
            args: [path_param: path_param, body: body],
            call: {Example.Operations, :my_operation},
            url: "/path/to/\#{path_param}",
            body: body,
            method: :post,
            query: query,
            request: [{"application/json", :map}],
            response: [{200, :map}, {404, {Example.NotFoundError, :t}}],
            opts: opts
          })
        end

  """
  @spec render_function(State.t(), Operation.t()) :: Macro.t()
  def render_function(state, operation) do
    %Operation{
      function_name: name,
      request_body: request_body,
      request_path_parameters: path_params
    } = operation

    path_parameter_arguments =
      for %Param{name: name} <- path_params do
        {String.to_atom(name), [], nil}
      end

    body_argument = unless length(request_body) == 0, do: quote(do: body)
    opts_argument = quote do: opts \\ []

    arguments = Util.clean_list([path_parameter_arguments, body_argument, opts_argument])

    client =
      quote do
        client = opts[:client] || @default_client
      end

    query = render_query(operation)
    call = render_call(state, operation)

    operation_body = Util.clean_list([client, query, call])

    quote do
      def unquote(name)(unquote_splicing(arguments)) do
        (unquote_splicing(operation_body))
      end
    end
  end

  @doc """
  Render code to handle query params in the body of an operation function

  This function is called by the default implementation of
  `c:OpenAPI.Renderer.render_operation_function/2` (see `render_function/2`). It returns code
  similar to this:

      query = Keyword.take(opts, [:param1, :param2])

  **Warning**: This function is public for the benefit of plugin implementers who wish to
  replicate portions of the default implementation. It is subject to change.
  """
  @spec render_query(Operation.t()) :: Macro.t() | nil
  def render_query(operation) do
    %Operation{request_query_parameters: query_params} = operation

    if length(query_params) > 0 do
      params =
        query_params
        |> Enum.sort_by(& &1.name)
        |> Enum.map(fn %Param{name: name} -> String.to_atom(name) end)

      quote do
        query = Keyword.take(opts, unquote(params))
      end
    end
  end

  @doc """
  Render a call to `client.request/1` in the body of an operation function

  This function is called by the default implementation of
  `c:OpenAPI.Renderer.render_operation_function/2` (see `render_function/2`). It returns code
  similar to this:

      client.request(%{...})

  **Warning**: This function is public for the benefit of plugin implementers who wish to
  replicate portions of the default implementation. It is subject to change.
  """
  @spec render_call(State.t(), Operation.t()) :: Macro.t()
  def render_call(state, operation) do
    %Operation{
      function_name: function_name,
      module_name: module_name,
      request_body: request_body,
      request_method: request_method,
      request_path: request_path,
      request_path_parameters: path_params,
      request_query_parameters: query_params,
      responses: responses
    } = operation

    path_param_args =
      for %Param{name: name} <- path_params do
        arg_as_atom = String.to_atom(name)
        {arg_as_atom, {arg_as_atom, [], nil}}
      end

    body_arg = unless length(request_body) == 0, do: {:body, {:body, [], nil}}
    args = Util.clean_list([path_param_args, body_arg])

    args =
      quote do
        {:args, unquote(args)}
      end

    module_name =
      Module.concat([
        config(state)[:base_module],
        module_name
      ])

    call =
      quote do
        {:call, {unquote(module_name), unquote(function_name)}}
      end

    url =
      String.replace(request_path, ~r/\{([[:word:]]+)\}/, "#\{\\1\}")
      |> then(&"\"#{&1}\"")
      |> Code.string_to_quoted!()
      |> then(fn url ->
        quote do
          {:url, unquote(url)}
        end
      end)

    method =
      quote do
        {:method, unquote(request_method)}
      end

    body =
      if length(request_body) > 0 do
        quote do
          {:body, body}
        end
      end

    query =
      if length(query_params) > 0 do
        quote do
          {:query, query}
        end
      end

    request =
      render_call_request_info(state, request_body, config(state)[:operation_call][:request])

    responses =
      if length(responses) > 0 do
        items =
          responses
          |> Enum.sort_by(fn {status_or_default, _schemas} -> status_or_default end)
          |> Enum.map(fn {status_or_default, schemas} ->
            type = Util.to_readable_type(state, {:union, Map.values(schemas)})

            quote do
              {unquote(status_or_default), unquote(type)}
            end
          end)

        quote do
          {:response, unquote(items)}
        end
      end

    options =
      quote do
        {:opts, opts}
      end

    request_details =
      [args, call, url, body, method, query, request, responses, options]
      |> Enum.reject(&is_nil/1)

    quote do
      client.request(%{
        unquote_splicing(request_details)
      })
    end
  end

  @doc """
  Render the spec of an operation function

  Default implementation of `c:OpenAPI.Renderer.render_operation_spec/2`.
  """
  @spec render_spec(State.t(), Operation.t()) :: Macro.t()
  def render_spec(state, operation) do
    %Operation{
      function_name: name,
      request_body: request_body,
      request_path_parameters: path_params,
      responses: responses
    } = operation

    path_parameters =
      for %Param{name: name, value_type: type} <- path_params do
        quote(do: unquote({String.to_atom(name), [], nil}) :: unquote(Util.to_type(state, type)))
      end

    request_body =
      if length(request_body) > 0 do
        body_type = {:union, Enum.map(request_body, fn {_content_type, type} -> type end)}
        quote(do: body :: unquote(Util.to_type(state, body_type)))
      end

    opts = quote(do: opts :: keyword)

    arguments = path_parameters ++ Enum.reject([request_body, opts], &is_nil/1)
    return_type = render_return_type(state, responses)

    quote do
      @spec unquote(name)(unquote_splicing(arguments)) :: unquote(return_type)
    end
  end

  defp render_return_type([], _type_overrides), do: quote(do: :ok)

  defp render_return_type(state, responses) do
    {success, error} =
      responses
      |> Enum.reject(fn {_status, schemas} -> map_size(schemas) == 0 end)
      |> Enum.reject(fn {status, _schemas} -> status >= 300 and status < 400 end)
      |> Enum.split_with(fn {status, _schemas} -> status < 300 end)

    ok =
      if length(success) > 0 do
        type =
          success
          |> Enum.map(fn {_state, schemas} -> Map.values(schemas) end)
          |> List.flatten()
          |> then(&Util.to_type(state, {:union, &1}))

        quote(do: {:ok, unquote(type)})
      else
        quote(do: :ok)
      end

    error =
      if error_type = config(state)[:types][:error] do
        quote(do: {:error, unquote(Util.to_type(state, error_type))})
      else
        if length(error) > 0 do
          type =
            error
            |> Enum.map(fn {_state, schemas} -> Map.values(schemas) end)
            |> List.flatten()
            |> then(&Util.to_type(state, {:union, &1}))

          quote(do: {:error, unquote(type)})
        else
          quote(do: :error)
        end
      end

    {:|, [], [ok, error]}
  end

  #
  # Public Helpers
  #

  @doc """
  Renders a keyword list element containing information about the request body

  The second argument accepts a format for the output code, which can be `:map` or the default of
  `:list`.

  This function is called by the default implementation of
  `c:OpenAPI.Renderer.render_operation_function/2` (see `render_function/2`). It returns code
  similar to this:

      # Default format:
      request: [{"application/json", {MySchema, :t}}]

      # With format `:map`:
      request: %{"application/json" => {MySchema, :t}}

  **Warning**: This function is public for the benefit of plugin implementers who wish to
  replicate portions of the default implementation. It is subject to change.
  """
  @spec render_call_request_info(State.t(), Operation.request_body(), atom) :: Macro.t()
  def render_call_request_info(state, request_body, format)
  def render_call_request_info(_state, [], _format), do: nil

  def render_call_request_info(state, request_body, :map) do
    body =
      Enum.map(request_body, fn {content_type, type} ->
        {content_type, Util.to_readable_type(state, type)}
      end)

    quote do
      {:request, unquote({:%{}, [], body})}
    end
  end

  def render_call_request_info(state, request_body, _default_list) do
    body =
      Enum.map(request_body, fn {content_type, type} ->
        {content_type, Util.to_readable_type(state, type)}
      end)

    quote do
      {:request, unquote(body)}
    end
  end

  #
  # Private Helpers
  #

  @spec config(OpenAPI.Renderer.State.t()) :: Keyword.t()
  defp config(state) do
    %OpenAPI.Renderer.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:output, [])
  end
end
