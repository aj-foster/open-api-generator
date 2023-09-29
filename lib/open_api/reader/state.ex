defmodule OpenAPI.Reader.State do
  @moduledoc """
  State of the reader phase of code generation

  This struct is created at the beginning of the read phase using data from the overall
  `OpenAPI.State`. It is fully managed by the read phase, and it is unlikely that client libraries
  would read or write to this struct.
  """
  require Logger

  alias OpenAPI.Reader.Config
  alias OpenAPI.Spec.Path.Parameter

  @typedoc "Decode function for raw Yaml"
  @type decoder :: decoder(term)

  @typedoc "Decode function for raw Yaml"
  @type decoder(t) :: (t, yaml -> {map, t})

  @typedoc "Key or index of a Yaml document."
  @type path_segment :: String.t() | integer

  @typedoc "OpenAPI reader state"
  @type t :: %__MODULE__{
          base_file: String.t() | nil,
          base_file_path: [path_segment],
          config: Config.t(),
          current_file: String.t() | nil,
          current_file_path: [path_segment],
          files: %{optional(String.t()) => yaml | nil},
          last_ref_file: String.t() | nil,
          last_ref_path: [path_segment],
          path_parameters: [Parameter.t()],
          previous_refs: MapSet.t(),
          refs: %{optional(String.t()) => map},
          spec: Spec.t() | nil
        }

  @typedoc "Raw Yaml input"
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
    :path_parameters,
    :previous_refs,
    :refs,
    :spec
  ]

  #
  # Creation
  #

  @doc false
  @spec new(Config.t()) :: t
  def new(config) do
    %__MODULE__{
      base_file: nil,
      base_file_path: [],
      config: config,
      current_file: nil,
      current_file_path: [],
      files: files(config),
      last_ref_file: nil,
      last_ref_path: [],
      path_parameters: [],
      previous_refs: MapSet.new(),
      refs: %{},
      spec: nil
    }
  end

  @spec files(Config.t()) :: %{optional(String.t()) => yaml | nil}
  defp files(config) do
    %Config{additional_files: additional_files, file: file, passed_files: passed_files} = config

    [passed_files, file, additional_files]
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
    |> Enum.map(fn filename -> {filename, nil} end)
    |> Enum.into(%{})
  end

  #
  # Manipulation
  #

  @doc false
  @spec with_path(t, yaml, path_segment, decoder) ::
          {t, term}
  def with_path(state, yaml, path_segment, decoder) do
    %__MODULE__{
      base_file_path: original_base_file_path,
      current_file_path: original_current_file_path,
      last_ref_path: original_last_ref_path
    } = state

    state = %__MODULE__{
      state
      | base_file_path: [path_segment | original_base_file_path],
        current_file_path: [path_segment | original_current_file_path],
        last_ref_path: [path_segment | original_last_ref_path]
    }

    {state, result} = decoder.(state, yaml)

    state = %__MODULE__{
      state
      | base_file_path: original_base_file_path,
        current_file_path: original_current_file_path,
        last_ref_path: original_last_ref_path
    }

    {state, result}
  end

  @doc false
  @spec with_ref(t, yaml, decoder) :: {t, term}
  def with_ref(state, %{"$ref" => ref}, decoder) do
    [new_file, new_ref_path] = String.split(ref, "#")
    new_file = Path.join(state.current_file, new_file)
    new_ref_path_segments = String.split(new_ref_path, "/", trim: true)

    if MapSet.member?(state.previous_refs, {new_file, new_ref_path_segments}) do
      {state, {:cycle, {new_file, new_ref_path_segments}}}
    else
      %__MODULE__{
        last_ref_file: original_last_ref_file,
        last_ref_path: original_last_ref_path,
        previous_refs: original_previous_refs
      } = state

      new_ref = "#{new_file}##{new_ref_path}"

      state = %__MODULE__{
        state
        | last_ref_file: new_file,
          last_ref_path: Enum.reverse(new_ref_path_segments),
          previous_refs: MapSet.put(state.previous_refs, {new_file, new_ref_path_segments})
      }

      stored_yaml = state.refs[new_ref]

      {state, yaml} =
        if stored_yaml do
          {state, stored_yaml}
        else
          state = OpenAPI.Reader.ensure_file(state, new_file)
          yaml = get_in(state.files[new_file], new_ref_path_segments)
          state = %__MODULE__{state | refs: Map.put(state.refs, new_ref, yaml)}

          {state, yaml}
        end

      {state, result} = decoder.(state, yaml)

      state = %__MODULE__{
        state
        | last_ref_file: original_last_ref_file,
          last_ref_path: original_last_ref_path,
          previous_refs: original_previous_refs
      }

      {state, result}
    end
  end

  def with_ref(state, yaml, decoder), do: decoder.(state, yaml)
end
