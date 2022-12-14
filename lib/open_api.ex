defmodule OpenAPI do
  alias OpenAPI.Generator
  alias OpenAPI.Reader
  alias OpenAPI.Spec
  alias OpenAPI.State

  @spec run(String.t(), keyword) :: term
  def run(filename, config) do
    State.new(filename, config)
    |> Reader.read("")
    |> Spec.decode()
    |> Generator.run()
  end
end
