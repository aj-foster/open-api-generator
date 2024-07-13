defmodule OpenAPI.Processor.Operation.Param do
  @moduledoc """
  Provides the Param struct that is used by the renderer
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Processor.Type
  alias OpenAPI.Spec.Path.Parameter

  @typedoc "Location of the param"
  @type location :: :cookie | :header | :path | :query

  @typedoc "Style of the param"
  @type style ::
          :matrix | :label | :form | :simple | :space_delimited | :pipe_delimited | :deep_object

  @typedoc "Processed param data used by the renderer"
  @type t :: %__MODULE__{
          description: String.t() | nil,
          explode: boolean,
          location: location,
          name: String.t(),
          style: style,
          value_type: Type.t()
        }

  defstruct [
    :description,
    :explode,
    :name,
    :location,
    :style,
    :value_type
  ]

  @doc false
  @spec from_spec(State.t(), Parameter.t()) :: {State.t(), t}
  def from_spec(state, %Parameter{} = param) do
    %Parameter{description: description, explode: explode, name: name} = param
    {state, value_type} = value_type(state, param)

    param =
      %__MODULE__{
        description: description,
        explode: explode,
        name: name,
        location: location(param),
        style: style(param),
        value_type: value_type
      }

    {state, param}
  end

  @spec location(Parameter.t()) :: location
  defp location(%Parameter{in: "cookie"}), do: :cookie
  defp location(%Parameter{in: "header"}), do: :header
  defp location(%Parameter{in: "path"}), do: :path
  defp location(%Parameter{in: "query"}), do: :query

  @spec style(Parameter.t()) :: style
  defp style(%Parameter{style: "matrix"}), do: :matrix
  defp style(%Parameter{style: "label"}), do: :label
  defp style(%Parameter{style: "form"}), do: :form
  defp style(%Parameter{style: "simple"}), do: :simple
  defp style(%Parameter{style: "spaceDelimited"}), do: :space_delimited
  defp style(%Parameter{style: "pipeDelimited"}), do: :pipe_delimited
  defp style(%Parameter{style: "deepObject"}), do: :deep_object

  @spec value_type(State.t(), Parameter.t()) :: {State.t(), Type.t()}
  defp value_type(state, %Parameter{schema: nil}), do: {state, :string}

  defp value_type(state, %Parameter{schema: schema_or_ref}) do
    Type.from_schema(state, schema_or_ref)
  end
end
