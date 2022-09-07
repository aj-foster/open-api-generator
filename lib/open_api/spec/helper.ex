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
end
