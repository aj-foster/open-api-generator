defmodule OpenAPI.State do
  @moduledoc "Contains state used by the generator while reading and writing files."

  @typedoc "Decode function for raw Yaml."
  @type decoder :: decoder(term)

  @typedoc "Decode function for raw Yaml."
  @type decoder(t) :: (t, yaml -> {map, t})

  @typedoc "Key or index of a Yaml document."
  @type path_segment :: String.t() | integer

  @typedoc "OpenAPI generator state."
  @type t :: %__MODULE__{
          base_file: String.t(),
          base_file_path: [path_segment],
          current_file: String.t(),
          current_file_path: [path_segment],
          last_ref: String.t() | nil,
          last_ref_path: [path_segment],
          refs: %{optional(String.t()) => map},
          schemas: %{optional(String.t()) => map}
        }

  @typedoc "Raw Yaml input."
  @type yaml :: map | list

  defstruct [
    :base_file,
    :base_file_path,
    :current_file,
    :current_file_path,
    :files,
    :last_ref,
    :last_ref_path,
    :refs,
    :schemas
  ]

  @doc "Create a new state struct starting from the given `base_filename`."
  @spec new(String.t()) :: t
  def new(base_filename) do
    absolute_path_of_base_file = Path.absname(base_filename, File.cwd!()) |> Path.expand()

    %__MODULE__{
      base_file: absolute_path_of_base_file,
      base_file_path: [],
      current_file: absolute_path_of_base_file,
      current_file_path: [],
      files: %{},
      last_ref: nil,
      last_ref_path: [],
      refs: %{},
      schemas: %{}
    }
  end
end
