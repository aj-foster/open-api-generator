defmodule GitHub.SecretScanning.LocationDiscussionComment do
  @moduledoc """
  Provides struct and type for a SecretScanning.LocationDiscussionComment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, discussion_comment_url: String.t()}

  defstruct [:__info__, :discussion_comment_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [discussion_comment_url: {:string, :uri}]
  end
end
