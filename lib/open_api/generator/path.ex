defmodule OpenAPI.Generator.Path do
  alias OpenAPI.Spec.Path.Operation

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
end
