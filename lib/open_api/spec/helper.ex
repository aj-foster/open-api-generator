defmodule OpenAPI.Spec.Helper do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      @before_compile OpenAPI.Spec.Helper
    end
  end

  defmacro __before_compile__(_env) do
    quote do
      def decoders, do: @decoders
      def matches?(_value), do: false
      def post(spec), do: spec

      defoverridable decoders: 0, post: 1
    end
  end

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

  @type path_segment :: String.t() | integer
  @type decoder :: (map, term -> {map, term})

  @spec with_path(map, term, path_segment, decoder) :: {map, term}
  def with_path(state, yaml, path_segment, decoder) do
    original_path = state.current_path
    original_ref = state.current_ref
    state = Map.put(state, :current_path, [path_segment | original_path])
    new_ref = if original_ref, do: "#{original_ref}/#{path_segment}"
    state = Map.put(state, :current_ref, new_ref)

    {state, result} = decoder.(state, yaml)

    state = Map.merge(state, %{current_path: original_path, current_ref: original_ref})
    {state, result}
  end

  @spec with_ref(map, term, (map, map -> {map, term})) :: {map, term}
  def with_ref(state, %{"$ref" => ref}, decoder) do
    original_ref = state.current_ref
    state = Map.put(state, :current_ref, ref)

    {state, yaml} = resolve_ref(state, ref)
    {state, result} = decoder.(state, yaml)

    state = Map.put(state, :current_ref, original_ref)
    {state, result}
  end

  def with_ref(state, yaml, decoder), do: decoder.(state, yaml)
end
