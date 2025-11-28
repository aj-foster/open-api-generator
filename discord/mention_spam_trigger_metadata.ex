defmodule MentionSpamTriggerMetadata do
  @moduledoc """
  Provides struct and type for a MentionSpamTriggerMetadata
  """

  @type t :: %__MODULE__{
          mention_raid_protection_enabled: boolean | nil,
          mention_total_limit: integer
        }

  defstruct [:mention_raid_protection_enabled, :mention_total_limit]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mention_raid_protection_enabled: {:union, [:boolean, :null]}, mention_total_limit: :integer]
  end
end
