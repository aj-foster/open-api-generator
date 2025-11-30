defmodule Discord.TeamMemberResponse do
  @moduledoc """
  Provides struct and type for a TeamMemberResponse
  """

  @type t :: %__MODULE__{
          membership_state: integer,
          team_id: String.t(),
          user: Discord.UserResponse.t()
        }

  defstruct [:membership_state, :team_id, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [membership_state: :integer, team_id: {:string, :generic}, user: {Discord.UserResponse, :t}]
  end
end
