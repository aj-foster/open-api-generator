defmodule OpenAPI.Generator.State do
  @moduledoc false
  alias OpenAPI.Generator.Options
  alias OpenAPI.Spec

  @type file :: %{
          name: String.t(),
          docstring: String.t(),
          fields: [term],
          methods: [term]
        }

  @type t :: %__MODULE__{
          files: %{required(module) => file},
          options: Options.t(),
          operations: [{String.t(), atom, Spec.Path.Operation.t()}],
          operation_files: %{required(module) => file},
          schemas: [{String.t(), module, Spec.t()}],
          schema_files: %{required(module) => file},
          spec: OpenAPI.Spec.t()
        }

  defstruct [
    :files,
    :options,
    :operations,
    :operation_files,
    :schemas,
    :schema_files,
    :spec
  ]
end
