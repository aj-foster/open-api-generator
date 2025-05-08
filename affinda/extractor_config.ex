defmodule ExtractorConfig do
  @moduledoc """
  Provides struct and type for a ExtractorConfig
  """

  @type t :: %__MODULE__{resumeRedact: RedactConfig.t() | nil}

  defstruct [:resumeRedact]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [resumeRedact: {RedactConfig, :t}]
  end
end
