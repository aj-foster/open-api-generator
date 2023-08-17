defmodule OpenAPI.Renderer.State do
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Renderer.File

  @type t :: %__MODULE__{
          files: %{module => File.t()},
          implementation: module,
          operations: [Operation.t()],
          profile: atom,
          schemas: %{reference => Schema.t()}
        }

  defstruct [
    :files,
    :implementation,
    :operations,
    :profile,
    :schemas
  ]

  @spec new(OpenAPI.State.t()) :: t
  def new(state) do
    %OpenAPI.State{
      call: %OpenAPI.Call{profile: profile},
      operations: operations,
      schemas: schemas
    } = state

    %__MODULE__{
      files: %{},
      implementation: implementation(profile),
      operations: operations,
      profile: profile,
      schemas: schemas
    }
  end

  @spec implementation(atom) :: module
  defp implementation(profile) do
    Application.get_env(:oapi_generator, profile)
    |> Keyword.get(:renderer, OpenAPI.Renderer)
  end

  def update_files(%__MODULE__{files: files} = state, module, operation_or_schema) do
    files =
      Map.update(
        files,
        module,
        File.new(module, operation_or_schema),
        &File.add(&1, operation_or_schema)
      )

    %__MODULE__{state | files: files}
  end
end
