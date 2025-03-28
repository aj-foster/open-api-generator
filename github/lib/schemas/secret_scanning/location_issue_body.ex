defmodule GitHub.SecretScanning.LocationIssueBody do
  @moduledoc """
  Provides struct and type for a SecretScanning.LocationIssueBody
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, issue_body_url: String.t()}

  defstruct [:__info__, :issue_body_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issue_body_url: {:string, :uri}]
  end
end
