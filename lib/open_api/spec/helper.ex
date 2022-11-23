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

  @type path_segment :: String.t() | integer
  @type path :: [path_segment]
  @type decoder :: (map, map -> {map, term})

  @spec with_path(map, map, path_segment | path, decoder) :: {map, term}
  def with_path(state, yaml, path_segment, decoder) do
    original_path = state.current_path

    state =
      if is_list(path_segment) do
        Map.put(state, :current_path, path_segment ++ original_path)
      else
        Map.put(state, :current_path, [path_segment | original_path])
      end

    {state, result} = decoder.(state, yaml)

    state = Map.put(state, :current_path, original_path)
    {state, result}
  end
end
