defmodule Mix.Tasks.Api.Gen do
  @moduledoc """
  Generate code from an Open API specification.
  """
  @shortdoc "Generate code from an Open API specification"

  use Mix.Task

  @impl Mix.Task
  def run([profile, spec_file]) do
    profile = String.to_atom(profile)
    config = Application.get_env(:open_api, profile)

    cond do
      is_nil(config) ->
        Mix.shell().error("Profile #{profile} not found in configuration")

      not File.exists?(spec_file) ->
        Mix.shell().error("Error: file not found")

      true ->
        OpenAPI.Reader.read(spec_file)
        |> OpenAPI.Spec.decode()

        # |> IO.inspect(pretty: true, syntax_colors: IO.ANSI.syntax_colors(), limit: :infinity)
        # |> OpenAPI.Generator.run(config)
    end
  end

  def run(_args) do
    Mix.shell().error("Usage: mix api.gen [profile] [path/to/spec.yaml]")
  end
end
