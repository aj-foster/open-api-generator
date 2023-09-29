defmodule OpenAPI.State do
  @moduledoc """
  State for the overall code generation

  This struct contains data that is passed between phases of the generation. It includes the
  following fields:

    * `call`: Information about the original call to the generator, including the configuration
      profile and the spec files passed.
    * `files`: After the render phase, contains a list of `t:OpenAPI.Renderer.File.t/0` structs
      that were written.
    * `operations`: After the process phase, contains a list of `t:OpenAPI.Processor.Operation.t/0`
      structs that were processed.
    * `schemas`: After the process phase, contains a map of schema references to their
      `t:OpenAPI.Processor.Schema.t/0` structs. The reference-keyed map is included to make it
      easier for render callbacks to look up a schema by its reference, as this is often how
      operations will refer to them.
    * `schema_specs_by_path`: After the read phase, contains a map of all schema specs keyed on
      their base file and last referenced paths. This allows for easy lookup of schema specs from
      `t:OpenAPI.Spec.ref/0` references.
    * `spec`: After the read phase, contains the parsed and merged OpenAPI description(s).

  All of this state is managed by the code generator between phases, and it is unlikely that a
  callback would need to read or write to this struct directly.
  """

  alias OpenAPI.Call
  alias OpenAPI.Spec

  @typedoc "OpenAPI generator state"
  @type t :: %__MODULE__{
          call: Call.t(),
          files: [OpenAPI.Renderer.File.t()],
          operations: [OpenAPI.Processor.Operation.t()],
          schemas: %{reference => OpenAPI.Processor.Schema.t()},
          schema_specs_by_path: %{Spec.full_path() => Spec.Schema.t()},
          spec: Spec.t() | nil
        }

  @typedoc "Raw Yaml input."
  @type yaml :: map | list

  defstruct [
    :call,
    :files,
    :operations,
    :schemas,
    :schema_specs_by_path,
    :spec
  ]

  @doc false
  @spec new(Call.t()) :: t
  def new(%Call{} = call) do
    %__MODULE__{
      call: call,
      files: [],
      operations: [],
      schemas: %{},
      schema_specs_by_path: %{},
      spec: nil
    }
  end
end
