defmodule GitHub.SecretScanning.LocationPullRequestComment do
  @moduledoc """
  Provides struct and type for a SecretScanning.LocationPullRequestComment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, pull_request_comment_url: String.t()}

  defstruct [:__info__, :pull_request_comment_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pull_request_comment_url: {:string, :uri}]
  end
end
