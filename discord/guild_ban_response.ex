defmodule Discord.GuildBanResponse do
  @moduledoc """
  Provides struct and type for a GuildBanResponse
  """

  @type t :: %__MODULE__{reason: String.t() | nil, user: Discord.UserResponse.t()}

  defstruct [:reason, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reason: {:union, [:string, :null]}, user: {Discord.UserResponse, :t}]
  end
end
