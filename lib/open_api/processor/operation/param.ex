defmodule OpenAPI.Processor.Operation.Param do
  @doc false
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.Schema

  @type location :: :cookie | :header | :path | :query

  @type t :: %__MODULE__{
          description: String.t() | nil,
          location: location,
          name: String.t(),
          value_type: Type.t()
        }

  defstruct [
    :description,
    :name,
    :location,
    :value_type
  ]

  @spec from_spec(Parameter.t()) :: t
  def from_spec(%Parameter{} = param) do
    %Parameter{description: description, name: name} = param

    %__MODULE__{
      description: description,
      name: name,
      location: location(param),
      value_type: value_type(param)
    }
  end

  @spec location(Parameter.t()) :: location
  defp location(%Parameter{in: "cookie"}), do: :cookie
  defp location(%Parameter{in: "header"}), do: :header
  defp location(%Parameter{in: "path"}), do: :path
  defp location(%Parameter{in: "query"}), do: :query

  @spec value_type(Parameter.t()) :: Type.t()
  defp value_type(%Parameter{schema: %Schema{} = schema}), do: Type.primitive_from_schema(schema)
  defp value_type(_param), do: {:string, :generic}
end
