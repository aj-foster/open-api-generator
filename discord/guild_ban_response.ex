defmodule GuildBanResponse do
  @moduledoc """
  Provides struct and type for a GuildBanResponse
  """

  @type t :: %__MODULE__{reason: String.t() | nil, user: UserResponse.t()}

  defstruct [:reason, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reason: {:union, [{:string, :generic}, :null]}, user: {UserResponse, :t}]
  end
end
