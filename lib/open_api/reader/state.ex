defmodule OpenAPI.Reader.State do
  @moduledoc """
  State of the reader phase of code generation

  This struct is created at the beginning of the read phase using data from the overall
  `OpenAPI.State`. It is fully managed by the read phase, and it is unlikely that client libraries
  would read or write to this struct.
  """
  require Logger

  alias OpenAPI.Reader.Config
  alias OpenAPI.Spec
  alias OpenAPI.Spec.Schema
  alias OpenAPI.Spec.Path.Parameter

  @typedoc "Decode function for raw Yaml"
  @type decoder :: decoder(term)

  @typedoc "Decode function for raw Yaml"
  @type decoder(t) :: (t, yaml -> {map, t})

  @typedoc "OpenAPI reader state"
  @type t :: %__MODULE__{
          base_file: String.t() | nil,
          base_file_path: [Spec.path_segment()],
          config: Config.t(),
          current_file: String.t() | nil,
          current_file_path: [Spec.path_segment()],
          files: %{optional(String.t()) => yaml | nil},
          last_ref_file: String.t() | nil,
          last_ref_path: [Spec.path_segment()],
          path_parameters: [Parameter.t()],
          refs: %{optional(String.t()) => map},
          schema_specs_by_path: %{Spec.full_path() => Schema.t() | {:ref, Spec.full_path()}},
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
    :refs,
    :schema_specs_by_path,
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
      refs: %{},
      schema_specs_by_path: %{},
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
  @spec with_path(t, yaml, Spec.path_segment(), decoder) ::
          {t, term}
  def with_path(%__MODULE__{} = state, yaml, path_segment, decoder) do
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

    {%__MODULE__{} = state, result} = decoder.(state, yaml)

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
  def with_ref(%__MODULE__{} = state, %{"$ref" => ref}, decoder) do
    %__MODULE__{
      current_file: original_current_file,
      current_file_path: original_current_file_path,
      last_ref_file: original_last_ref_file,
      last_ref_path: original_last_ref_path
    } = state

    [new_file, new_ref_path] =
      case String.split(ref, "#") do
        [""] ->
          [state.current_file, ""]

        [file] ->
          new_file =
            state.current_file
            |> Path.dirname()
            |> Path.join(file)
            |> Path.expand()

          [new_file, ""]

        ["", path] ->
          [state.current_file, path]

        [file, path] ->
          new_file =
            state.current_file
            |> Path.dirname()
            |> Path.join(file)
            |> Path.expand()

          [new_file, path]
      end

    new_ref_path_segments = String.split(new_ref_path, "/", trim: true)
    new_ref = "#{new_file}##{new_ref_path}"

    state = %__MODULE__{
      state
      | current_file: new_file,
        current_file_path: Enum.reverse(new_ref_path_segments),
        last_ref_file: new_file,
        last_ref_path: Enum.reverse(new_ref_path_segments)
    }

    stored_yaml = state.refs[new_ref]

    {state, yaml} =
      if stored_yaml do
        {state, stored_yaml}
      else
        %__MODULE__{} = state = OpenAPI.Reader.ensure_file(state, new_file)
        yaml = get_in_or_root(state.files[new_file], new_ref_path_segments)
        state = %__MODULE__{state | refs: Map.put(state.refs, new_ref, yaml)}

        {state, yaml}
      end

    {%__MODULE__{} = state, result} = decoder.(state, yaml)

    state = %__MODULE__{
      state
      | current_file: original_current_file,
        current_file_path: original_current_file_path,
        last_ref_file: original_last_ref_file,
        last_ref_path: original_last_ref_path
    }

    {state, result}
  end

  def with_ref(state, yaml, decoder), do: decoder.(state, yaml)

  @doc false
  @spec with_schema_ref(t, yaml, decoder) :: {t, term}
  def with_schema_ref(%__MODULE__{} = state, yaml, decoder) do
    source_path = {state.last_ref_file, Enum.reverse(state.last_ref_path)}

    with_ref(state, yaml, fn %__MODULE__{} = state, yaml ->
      target_path = {state.current_file, Enum.reverse(state.current_file_path)}
      target_ref = {:ref, target_path}

      {state, result} =
        if schema = Map.get(state.schema_specs_by_path, target_path) do
          {state, schema}
        else
          state = put_spec_by_path(state, target_path, target_ref)
          {state, schema} = decoder.(state, yaml)
          {put_spec_by_path(state, target_path, schema), schema}
        end

      if source_path == target_path do
        {state, result}
      else
        {put_spec_by_path(state, source_path, target_ref), result}
      end
    end)
  end

  @spec get_in_or_root(map, [Spec.path_segment()]) :: any
  defp get_in_or_root(map, []), do: map
  defp get_in_or_root(map, path), do: get_in(map, path)

  @spec put_spec_by_path(t, Spec.full_path(), Schema.t() | {:ref, Spec.full_path()}) :: t
  defp put_spec_by_path(%__MODULE__{} = state, path, spec) do
    %__MODULE__{schema_specs_by_path: schema_specs_by_path} = state
    schema_specs_by_path = Map.put(schema_specs_by_path, path, spec)
    %__MODULE__{state | schema_specs_by_path: schema_specs_by_path}
  end
end
