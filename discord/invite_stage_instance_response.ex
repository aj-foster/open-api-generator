defmodule Discord.InviteStageInstanceResponse do
  @moduledoc """
  Provides struct and type for a InviteStageInstanceResponse
  """

  @type t :: %__MODULE__{
          members: [Discord.GuildMemberResponse.t()] | nil,
          participant_count: integer | nil,
          speaker_count: integer | nil,
          topic: String.t()
        }

  defstruct [:members, :participant_count, :speaker_count, :topic]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      members: {:union, [[{Discord.GuildMemberResponse, :t}], :null]},
      participant_count: {:union, [{:integer, "int32"}, :null]},
      speaker_count: {:union, [{:integer, "int32"}, :null]},
      topic: :string
    ]
  end
end
