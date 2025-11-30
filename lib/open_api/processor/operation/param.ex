defmodule OpenAPI.Processor.Operation.Param do
  @moduledoc """
  Provides the Param struct that is used by the renderer
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec.Path.Parameter

  @typedoc "Location of the param"
  @type location :: :cookie | :header | :path | :query

  @typedoc "Processed param data used by the renderer"
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

  @doc false
  @spec from_spec(State.t(), Parameter.t()) :: {State.t(), t}
  def from_spec(state, %Parameter{} = param) do
    %Parameter{description: description, name: name} = param
    {state, value_type} = value_type(state, param)

    param =
      %__MODULE__{
        description: description,
        name: name,
        location: location(param),
        value_type: value_type
      }

    {state, param}
  end

  @spec location(Parameter.t()) :: location
  defp location(%Parameter{in: "cookie"}), do: :cookie
  defp location(%Parameter{in: "header"}), do: :header
  defp location(%Parameter{in: "path"}), do: :path
  defp location(%Parameter{in: "query"}), do: :query

  @spec value_type(State.t(), Parameter.t()) :: {State.t(), Type.t()}
  defp value_type(state, %Parameter{schema: nil}), do: {state, :string}

  defp value_type(state, %Parameter{schema: schema_or_ref}) do
    Type.from_schema(state, schema_or_ref)
  end
end
