defmodule OpenAPI.Processor.State do
  @moduledoc false
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @type t :: %__MODULE__{
          implementation: module,
          operations: [Operation.t()],
          profile: atom,
          schemas: %{reference => SchemaSpec.t()},
          schema_registry: %{term => reference},
          spec: OpenAPI.Spec.t()
        }

  defstruct [
    :implementation,
    :operations,
    :profile,
    :schemas,
    :schema_registry,
    :spec
  ]

  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    profile = profile(state)

    %__MODULE__{
      implementation: implementation(profile),
      operations: [],
      profile: profile,
      schemas: %{},
      schema_registry: %{},
      spec: state.spec
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
