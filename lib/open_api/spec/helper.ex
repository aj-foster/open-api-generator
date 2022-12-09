defmodule OpenAPI.Spec.Helper do
  @moduledoc false

  alias OpenAPI.State

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
  def with_ref(state, %{"$ref" => ref}, decoder) do
    [new_file, new_ref_path] = String.split(ref, "#")
    new_file = Path.join(state.current_file, new_file) |> Path.expand()
    new_ref_path_segments = String.split(new_ref_path, "/", trim: true)

    original_last_ref_file = state.last_ref_file
    original_last_ref_path = state.last_ref_path
    new_ref = "#{new_file}##{new_ref_path}"

    state =
      Map.merge(state, %{
        last_ref_file: new_file,
        last_ref_path: Enum.reverse(new_ref_path_segments)
      })

    stored_yaml = state.refs[new_ref]

    {state, yaml} =
      if stored_yaml do
        {state, stored_yaml}
      else
        state = OpenAPI.Reader.ensure_file(state, new_file)
        yaml = get_in(state.files[new_file], new_ref_path_segments)
        state = %State{state | refs: Map.put(state.refs, new_ref, yaml)}

        {state, yaml}
      end

    {state, result} = decoder.(state, yaml)

    state =
      Map.merge(state, %{
        last_ref_file: original_last_ref_file,
        last_ref_path: original_last_ref_path
      })

    {state, result}
  end

  def with_ref(state, yaml, decoder), do: decoder.(state, yaml)
end
