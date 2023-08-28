defmodule OpenAPI.Renderer.Operation do
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Operation.Param
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @spec render_all(State.t(), File.t()) :: Macro.t()
  def render_all(state, file) do
    %State{implementation: implementation} = state
    %File{operations: operations} = file

    for operation <- Enum.sort_by(operations, & &1.function_name) do
      implementation.render_operation(state, operation)
    end
  end

  @spec render(State.t(), Operation.t()) :: Macro.t()
  def render(state, operation) do
    %State{implementation: implementation} = state

    # types = implementation.render_operation_types(operation)
    docstring = implementation.render_operation_doc(state, operation)
    typespec = implementation.render_operation_spec(state, operation)
    function = implementation.render_operation_function(state, operation)

    Util.clean_list([docstring, typespec, function])
  end

  @spec render_doc(State.t(), Operation.t()) :: Macro.t()
  def render_doc(_state, operation) do
    %Operation{docstring: docstring} = operation

    quote do
      @doc unquote(docstring)
    end
  end

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

  @spec render_query(Operation.t()) :: Macro.t() | nil
  defp render_query(operation) do
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

  @spec render_call(State.t(), Operation.t()) :: Macro.t()
  defp render_call(state, operation) do
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

    args =
      if length(path_params) > 0 or not (length(request_body) > 0) do
        args =
          for %Param{name: name} <- path_params do
            arg_as_atom = String.to_atom(name)
            {arg_as_atom, {arg_as_atom, [], nil}}
          end

        body_arg = unless length(request_body) == 0, do: {:body, {:body, [], nil}}
        args = Util.clean_list([args, body_arg])

        quote do
          {:args, unquote(args)}
        end
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
      if length(request_body) > 0 do
        body =
          Enum.map(request_body, fn {content_type, type} ->
            {content_type, Util.to_readable_type(state, type)}
          end)

        quote do
          {:request, unquote(body)}
        end
      end

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

  @spec render_spec(State.t(), Operation.t()) :: Macro.t()
  def render_spec(state, operation) do
    %Operation{
      function_name: name,
      request_body: request_body,
      request_path_parameters: path_params,
      responses: responses
    } = operation

    path_parameters =
      for %Param{value_type: type} <- path_params do
        quote(do: unquote(Util.to_type(state, type)))
      end

    request_body =
      if length(request_body) > 0 do
        body_type = {:union, Enum.map(request_body, fn {_content_type, type} -> type end)}
        quote(do: unquote(Util.to_type(state, body_type)))
      end

    opts = quote(do: keyword)

    arguments = Util.clean_list([path_parameters, request_body, opts])
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
  # Helpers
  #

  @spec config(OpenAPI.Renderer.State.t()) :: Keyword.t()
  defp config(state) do
    %OpenAPI.Renderer.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:output, [])
  end
end
