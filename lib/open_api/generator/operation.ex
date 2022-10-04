defmodule OpenAPI.Generator.Operation do
  alias OpenAPI.Spec.Path.Operation

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
        description: operation_spec.description,
        method: method,
        name: function,
        path: path,
        path_params: path_params(state, path, operation_spec),
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
    |> Enum.map(fn name -> {name, all_params[name].schema} end)
  end

  defp parameter(_state, %OpenAPI.Spec.Path.Parameter{name: name} = param), do: {name, param}

  defp parameter(state, %OpenAPI.Spec.Ref{"$ref": "#/components/parameters/" <> loc}) do
    %OpenAPI.Spec.Path.Parameter{name: name} =
      param = Map.fetch!(state.spec.components.parameters, loc)

    {name, param}
  end
end
