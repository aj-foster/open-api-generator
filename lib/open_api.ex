defmodule OpenAPI do
  @moduledoc """
  Code generator for OpenAPI REST API descriptions

  This module provides a single function, `run/2`, that accepts the name of an OpenAPI description
  file and configuration. It does the work of reading the description, processing schemas and
  operations, and writing out generated files.

  For a list of valid options to pass as configuration, see `OpenAPI.Config`.
  """
  alias OpenAPI.Generator
  alias OpenAPI.Reader
  alias OpenAPI.Spec
  alias OpenAPI.State

  @doc "Read the OpenAPI description at `filename` and generate code according to `config`."
  @spec run(String.t(), keyword) :: term
  def run(filename, config) do
    State.new(filename, config)
    |> Reader.read("")
    |> Spec.decode()
    |> Generator.run()
  end
end
