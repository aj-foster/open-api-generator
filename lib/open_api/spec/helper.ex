defmodule OpenAPI.Spec.Helper do
  @moduledoc false

  alias OpenAPI.State

  @spec resolve_ref(map, String.t()) :: {map, map}
  def resolve_ref(state, ref) do
    stored_yaml = state.refs[ref]

    if stored_yaml do
      {state, stored_yaml}
    else
      [file, path] = String.split(ref, "#")
      state = OpenAPI.Reader.ensure_file(state, file)
      yaml = get_in(state.files[file], String.split(path, "/", trim: true))
      state = put_in(state, [:refs, ref], yaml)

      {state, yaml}
    end
  end

  @doc "Run the given `decoder` while managing the state's paths."
  @spec with_path(State.t(), State.yaml(), State.path_segment(), State.decoder()) ::
          {State.t(), term}
  def with_path(state, yaml, path_segment, decoder) do
    original_base_file_path = state.base_file_path
    original_current_file_path = state.current_file_path
    original_last_ref_path = state.last_ref_path

    state =
      Map.merge(state, %{
        base_file_path: [path_segment | original_base_file_path],
        current_file_path: [path_segment | original_current_file_path],
        last_ref_path: [path_segment | original_last_ref_path]
      })

    {state, result} = decoder.(state, yaml)

    state =
      Map.merge(state, %{
        base_file_path: original_base_file_path,
        current_file_path: original_current_file_path,
        last_ref_path: original_last_ref_path
      })

    {state, result}
  end

  @doc "Run the given `decoder` after resolving a ref, if present."
  @spec with_ref(State.t(), State.yaml(), State.decoder()) :: {State.t(), term}
  def with_ref(state, %{"$ref" => "#" <> path}, decoder) do
    original_last_ref = state.last_ref
    original_last_ref_path = state.last_ref_path
    new_ref = "#{state.current_file}##{path}"

    state =
      Map.merge(state, %{
        last_ref: new_ref,
        last_ref_path: []
      })

    stored_yaml = state.refs[new_ref]

    {state, yaml} =
      if stored_yaml do
        {state, stored_yaml}
      else
        yaml = get_in(state.files[state.current_file], String.split(path, "/", trim: true))
        state = %State{state | refs: Map.put(state.refs, new_ref, yaml)}

        {state, yaml}
      end

    {state, result} = decoder.(state, yaml)

    state =
      Map.merge(state, %{
        last_ref: original_last_ref,
        last_ref_path: original_last_ref_path
      })

    {state, result}
  end

  def with_ref(state, %{"$ref" => ref}, decoder) do
    [new_file, new_ref_path] = String.split(ref, "#")
    new_file = Path.join(state.current_file, new_file) |> Path.expand()

    original_last_ref = state.last_ref
    original_last_ref_path = state.last_ref_path
    new_ref = "#{new_file}##{new_ref_path}"

    state =
      Map.merge(state, %{
        last_ref: new_ref,
        last_ref_path: []
      })

    stored_yaml = state.refs[new_ref]

    {state, yaml} =
      if stored_yaml do
        {state, stored_yaml}
      else
        state = OpenAPI.Reader.ensure_file(state, new_file)
        yaml = get_in(state.files[new_file], String.split(new_ref_path, "/", trim: true))
        state = %State{state | refs: Map.put(state.refs, new_ref, yaml)}

        {state, yaml}
      end

    {state, result} = decoder.(state, yaml)

    state =
      Map.merge(state, %{
        last_ref: original_last_ref,
        last_ref_path: original_last_ref_path
      })

    {state, result}
  end

  def with_ref(state, yaml, decoder), do: decoder.(state, yaml)
end
