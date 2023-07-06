defmodule OpenAPI.Processor.State do
  @moduledoc false

  @type t :: %__MODULE__{
          implementation: module,
          spec: OpenAPI.Spec.t()
        }

  defstruct [
    :implementation,
    :spec
  ]

  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    %__MODULE__{
      implementation: implementation(state),
      spec: state.spec
    }
  end

  @spec implementation(OpenAPI.State.t()) :: module
  defp implementation(state) do
    %OpenAPI.State{call: %OpenAPI.Call{profile: profile}} = state

    Application.get_env(:oapi_generator, profile)
    |> Keyword.get(:processor, OpenAPI.Processor)
  end
end
