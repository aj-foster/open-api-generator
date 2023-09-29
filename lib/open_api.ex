defmodule OpenAPI do
  @moduledoc """
  Code generator for OpenAPI REST API descriptions

  > #### Note {:.info}
  >
  > It is not expected that clients will call functions in this module directly. Instead, consider
  > using the `mix api.gen` task.

  This module provides a single function, `run/2`, that accepts the name of a configuration
  profile and a list of files containing JSON or Yaml OpenAPI descriptions. It runs the three
  phases of code generation:

    * `OpenAPI.Reader`
    * `OpenAPI.Processor`
    * `OpenAPI.Renderer`

  At the end, an `OpenAPI.State` struct is returned with all of the data that was used to
  generate the client code.

  For more information, see the [readme](/README.md) or the available guides on
  [configuration](/guides/configuration.md), [plugins](/guides/plugins.md), or
  [creating a client library](/guides/client-author-guide.md).
  """
  require Logger

  alias OpenAPI.Call
  alias OpenAPI.Processor
  alias OpenAPI.Reader
  alias OpenAPI.Renderer
  alias OpenAPI.State

  @doc """
  Using the given configuration `profile`, read the OpenAPI description contained in `files` and
  generate client code
  """
  @spec run(String.t(), [String.t()]) :: term
  def run(profile, files) do
    Logger.debug("""
    Beginning code generation
    Profile: #{inspect(profile)}
    Files: [
      #{Enum.map_join(files, ",\n  ", &"\"#{&1}\"")}
    ]
    """)

    Call.new(profile, files)
    |> State.new()
    |> Reader.run()
    |> Processor.run()
    |> Renderer.run()
  end
end
