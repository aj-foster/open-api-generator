defmodule MentionSpamTriggerMetadataResponse do
  @moduledoc """
  Provides struct and type for a MentionSpamTriggerMetadataResponse
  """

  @type t :: %__MODULE__{mention_total_limit: integer}

  defstruct [:mention_total_limit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mention_total_limit: :integer]
  end
end
