defmodule Mix.Tasks.Api.Gen do
  @moduledoc """
  Generate code from an Open API specification.
  """
  @shortdoc "Generate code from an Open API specification"

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    cond do
      length(args) != 1 ->
        Mix.shell().error("Usage: mix api.gen path/to/spec.yaml")

      not File.exists?(List.first(args)) ->
        Mix.shell().error("Error: file not found")

      true ->
        OpenAPI.Reader.read(List.first(args))
    end
  end
end
