defmodule GitHub.SecretScanning.LocationIssueTitle do
  @moduledoc """
  Provides struct and type for a SecretScanning.LocationIssueTitle
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, issue_title_url: String.t()}

  defstruct [:__info__, :issue_title_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issue_title_url: {:string, :uri}]
  end
end
