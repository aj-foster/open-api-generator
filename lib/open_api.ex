defmodule OpenAPI do
  @moduledoc """
  Code generator for OpenAPI REST API descriptions

  This module provides a single function, `run/2`, that accepts the name of an OpenAPI description
  file and configuration. It does the work of reading the description, processing schemas and
  operations, and writing out generated files.

  For a list of valid options to pass as configuration, see `OpenAPI.Config`.
  """
  alias OpenAPI.Call
  alias OpenAPI.Processor
  alias OpenAPI.Reader
  alias OpenAPI.State

  @doc """
  Using the given configuration `profile`, read the OpenAPI description contained in `files` and
  generate client code
  """
  @spec run(String.t(), [String.t()]) :: term
  def run(profile, files) do
    Call.new(profile, files)
    |> State.new()
    |> Reader.run()
    |> Processor.run()
  end
end
