defmodule OpenAPI.Generator.State do
  @moduledoc false
  alias OpenAPI.Generator.Options
  alias OpenAPI.Spec

  @type file :: %{
          name: String.t(),
          docstring: String.t(),
          fields: [term]
        }

  @type t :: %__MODULE__{
          files: %{required(module) => file},
          options: Options.t(),
          paths: [term],
          path_files: %{required(module) => file},
          schemas: [{String.t(), module, Spec.t()}],
          schema_files: %{required(module) => file}
        }

  defstruct [
    :files,
    :options,
    :paths,
    :path_files,
    :schemas,
    :schema_files
  ]
end
