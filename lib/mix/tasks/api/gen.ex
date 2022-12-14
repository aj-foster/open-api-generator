defmodule Mix.Tasks.Api.Gen do
  @moduledoc """
  Generate code from an Open API description

  This task requires two arguments:

  * The configuration profile to use, and
  * The location of the OpenAPI description.

  The description location can be given as an absolute path or a path relative to the Mix project
  where this task is run.

  ## Example

  ```shell
  mix api.gen default ../rest-api-description/spec.yaml
  ```
  """
  @shortdoc "Generate code from an Open API description"

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
        OpenAPI.run(spec_file, config)
    end
  end

  def run(_args) do
    Mix.shell().error("Usage: mix api.gen [profile] [path/to/spec.yaml]")
  end
end
