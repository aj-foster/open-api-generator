defmodule OpenAPI.Renderer.State do
  @moduledoc """
  State of the render phase of code generation

  This struct is created at the beginning of the render phase using data from the overall
  generator `OpenAPI.State`. It has the following fields:

    * `files`: Map of module names and their associated `t:OpenAPI.Renderer.File.t/0` structs.
      This map is built using the `operations` and `schemas` data.
    * `implementation`: Module configured as the implementation of the renderer (defaults to
      `OpenAPI.Renderer`). Callbacks must use this field when calling other render callbacks.
    * `operations`: List of `t:OpenAPI.Processor.Operation.t/0` structs processed in the previous
      phase. These operations may appear in any order due to map key ordering.
    * `profile`: Name of the active configuration profile. Callbacks must use this field when
      looking up configuration from the application environment.
    * `schemas`: Map of schema references to their `t:OpenAPI.Processor.Schema.t/0` structs
      processed in the previous phase. The reference-keyed map is included to make it easier for
      callbacks to look up a schema by its reference, as this is often how operations will refer
      to them.

  All of this state is managed by the code generator, and it is unlikely that a callback would
  need to transform this struct directly.
  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Renderer.File

  @typedoc """
  Render phase state

  See module documentation for additional information.
  """
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

  @doc false
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

  @doc false
  @spec update_files(t, module, Operation.t()) :: t
  @spec update_files(t, module, Schema.t()) :: t
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

  defimpl Inspect do
    import Inspect.Algebra

    def inspect(renderer_state, _opts) do
      %OpenAPI.Renderer.State{implementation: implementation} = renderer_state

      concat([
        "#OpenAPI.Renderer.State<",
        "implementation: ",
        inspect(implementation),
        ">"
      ])
    end
  end
end
