defmodule OpenAPI.Generator.Operation do
  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.RequestBody
  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Schema.Media
  alias OpenAPI.Spec.Response

  def process(state, {path, method, operation_spec}) do
    for {modules, function} <- names(operation_spec) do
      module = Module.concat(modules)

      filename =
        Path.join([
          state.options.base_location,
          state.options.operation_location,
          Macro.underscore(module) <> ".ex"
        ])

      module = Module.concat(state.options.base_module, module)

      operation = %{
        body: body(state, operation_spec),
        description: operation_spec.description,
        docs: operation_spec.external_docs,
        method: method,
        name: function,
        path: path,
        path_params: path_params(state, path, operation_spec),
        query_params: query_params(state, operation_spec),
        responses: responses(state, operation_spec),
        summary: operation_spec.summary
      }

      {module, %{docstring: "", fields: [], name: filename, operations: [operation]}}
    end
  end

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
      typespec = OpenAPI.Generator.Schema.typespec(state, schema, name)
      {name, schema, typespec}
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
      typespec = OpenAPI.Generator.Schema.typespec(state, param.schema, name)
      {name, param.description, typespec}
    end)
  end

  defp parameter(_state, %Parameter{name: name} = param), do: {name, param}

  defp body(_state, %Operation{request_body: nil}), do: nil

  defp body(state, %Operation{request_body: %RequestBody{content: content}}) do
    content
    |> Enum.sort_by(fn {content_type, _media} -> content_type end)
    |> Enum.map(fn {_content_type, media} -> media_to_typespec(state, media) end)
    |> Enum.uniq()
  end

  defp media_to_typespec(state, %Media{schema: %Schema{type: "object"} = schema}) do
    OpenAPI.Generator.Schema.typespec(state, schema)
  end

  defp media_to_typespec(_state, _operation) do
    "term"
  end

  defp responses(state, %Operation{responses: responses}) do
    Enum.map(responses, fn {status, response} -> {status, parse_response(state, response)} end)
  end

  defp parse_response(_state, %Response{content: nil}), do: nil
  defp parse_response(_state, %Response{content: c}) when map_size(c) == 0, do: nil

  defp parse_response(state, %Response{content: %{"application/json" => %Media{schema: schema}}}) do
    OpenAPI.Generator.Schema.type(state, schema)
  end

  defp parse_response(_state, _response) do
    :string
  end
end
