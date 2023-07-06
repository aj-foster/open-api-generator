defmodule OpenAPI.Processor.State do
  @moduledoc false

  @type t :: %__MODULE__{
          implementation: module,
          spec: OpenAPI.Spec.t(),
          profile: atom
        }

  defstruct [
    :implementation,
    :spec,
    :profile
  ]

  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    profile = profile(state)

    %__MODULE__{
      implementation: implementation(profile),
      spec: state.spec,
      profile: profile
    }
  end

  @spec implementation(atom) :: module
  defp implementation(profile) do
    Application.get_env(:oapi_generator, profile)
    |> Keyword.get(:processor, OpenAPI.Processor)
  end

  @spec profile(OpenAPI.State.t()) :: atom
  defp profile(state) do
    %OpenAPI.State{call: %OpenAPI.Call{profile: profile}} = state

    profile
  end
end
