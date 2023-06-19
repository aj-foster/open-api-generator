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
  def run([profile | spec_files]) do
    OpenAPI.run(profile, spec_files)
  end

  def run(_args) do
    Mix.shell().error("Usage: mix api.gen [profile] [paths/to/spec.yaml]")
  end
end
