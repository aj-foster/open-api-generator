defmodule OpenAPI.Generator.Operation do
  alias OpenAPI.Generator.Typing
  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Schema.Media
  alias OpenAPI.Spec.Response
  alias OpenAPI.State

  @spec process(State.t(), String.t(), atom, Operation.t()) :: {State.t(), term}
  def process(state, path, method, operation) do
    {state, body} = process_body(state, operation)
    {state, responses} = responses(state, operation)
    path_params = path_params(state, path, operation)
    query_params = query_params(state, operation)

    for {modules, function} <- names(operation), reduce: state do
      state ->
        module = Module.concat(modules)

        operation = %{
          body: body,
          description: operation.description,
          docs: operation.external_docs,
          method: method,
          module: module,
          name: function,
          path: path,
          path_params: path_params,
          query_params: query_params,
          responses: responses,
          summary: operation.summary
        }

        %{state | operations: [operation | state.operations]}
    end
  end

  @spec process_body(State.t(), Operation.t()) :: {State.t(), term}
  defp process_body(state, %Operation{request_body: nil}), do: {state, nil}

  defp process_body(state, %Operation{request_body: %RequestBody{content: content}}) do
    body =
      content
      |> Enum.sort_by(fn {content_type, _media} -> content_type end)
      |> Enum.map(fn {_content_type, media} -> media_to_typespec(state, media) end)
      |> Enum.uniq()

    {state, body}
  end

  #
  # OLD
  #

  @doc """
  Construct an ergonomic name for an operation helper based on tags and operation ID.
  """
  @spec names(Operation.t()) :: [{[String.t()], String.t()}]
  def names(%Operation{operation_id: id, tags: []}) do
    [function | modules] = String.replace(id, "-", "_") |> String.split("/") |> Enum.reverse()

    modules =
      Enum.reverse(modules)
      |> Enum.map(&Macro.camelize/1)

    [{modules, Macro.underscore(function)}]
  end

  def names(%Operation{operation_id: id, tags: tags}) do
    function = String.replace(id, ~r|[/-]|, "_") |> Macro.underscore()

    for tag <- tags do
      tag = String.replace(tag, "-", "_")
      camelized_tag = Macro.camelize(tag)
      underscored_tag = Macro.underscore(tag)

      function = String.trim_leading(function, underscored_tag <> "_")

      {[camelized_tag], function}
    end
  end

  defp path_params(state, path, %Operation{parameters: parameters}) do
    all_params =
      Enum.map(parameters, &parameter(state, &1))
      |> Enum.into(%{})

    String.split(path, ~r/(^|\})[^\{\}]*(\{|$)/, trim: true)
    |> Enum.map(fn name ->
      schema = all_params[name].schema
      type = Typing.schema_to_type(state, schema)
      {name, schema, type}
    end)
  end

  defp query_params(state, %Operation{parameters: parameters}) do
    parameters
    |> Enum.map(&parameter(state, &1))
    |> Enum.filter(fn
      {_name, %Parameter{in: "query"}} -> true
      _ -> false
    end)
    |> Enum.map(fn {name, param} ->
      type = Typing.schema_to_type(state, param.schema)
      {name, param.description, type}
    end)
  end

  defp parameter(_state, %Parameter{name: name} = param), do: {name, param}

  defp media_to_typespec(state, %Media{schema: %Schema{type: "object"} = schema}) do
    Typing.schema_to_type(state, schema)
  end

  defp media_to_typespec(_state, _operation) do
    "term"
  end

  defp responses(state, %Operation{responses: responses}) do
    Enum.reduce(responses, {state, %{}}, fn {status, response}, {state, responses} ->
      {state, response} = parse_response(state, response)
      {state, Map.put(responses, status, response)}
    end)
  end

  defp parse_response(state, %Response{content: nil}), do: {state, nil}
  defp parse_response(state, %Response{content: c}) when map_size(c) == 0, do: {state, nil}

  defp parse_response(state, %Response{content: %{"application/json" => %Media{schema: schema}}}) do
    {state, Typing.schema_to_type(state, schema)}
  end

  defp parse_response(state, _response), do: {state, :string}
end
