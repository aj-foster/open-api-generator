defmodule OpenAPI.State do
  @moduledoc false

  alias OpenAPI.Config
  alias OpenAPI.Spec

  @typedoc "Decode function for raw Yaml."
  @type decoder :: decoder(term)

  @typedoc "Decode function for raw Yaml."
  @type decoder(t) :: (t, yaml -> {map, t})

  @type file :: %{
          name: String.t(),
          docstring: String.t(),
          fields: map,
          methods: [term]
        }

  @typedoc "Key or index of a Yaml document."
  @type path_segment :: String.t() | integer

  @typedoc "OpenAPI generator state."
  @type t :: %__MODULE__{
          base_file: String.t(),
          base_file_path: [path_segment],
          config: Config.t(),
          current_file: String.t(),
          current_file_path: [path_segment],
          last_ref_file: String.t() | nil,
          last_ref_path: [path_segment],
          operations: [map],
          operation_files: %{optional(module) => file},
          refs: %{optional(String.t()) => map},
          schemas: %{optional(String.t()) => map},
          schema_files: %{optional(module) => file},
          spec: Spec.t() | nil
        }

  @typedoc "Raw Yaml input."
  @type yaml :: map | list

  defstruct [
    :base_file,
    :base_file_path,
    :config,
    :current_file,
    :current_file_path,
    :files,
    :last_ref_file,
    :last_ref_path,
    :operations,
    :operation_files,
    :refs,
    :schemas,
    :schema_files,
    :spec
  ]

  @doc "Create a new state struct starting from the given `base_filename`."
  @spec new(String.t(), keyword) :: t
  def new(base_filename, config) do
    absolute_path_of_base_file = Path.absname(base_filename, File.cwd!()) |> Path.expand()

    %__MODULE__{
      base_file: absolute_path_of_base_file,
      base_file_path: [],
      config: Config.new(config),
      current_file: absolute_path_of_base_file,
      current_file_path: [],
      files: %{},
      last_ref_file: nil,
      last_ref_path: [],
      operations: [],
      operation_files: %{},
      refs: %{},
      schemas: %{},
      schema_files: %{},
      spec: nil
    }
  end
end
