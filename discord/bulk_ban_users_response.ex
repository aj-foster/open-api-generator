defmodule BulkBanUsersResponse do
  @moduledoc """
  Provides struct and type for a BulkBanUsersResponse
  """

  @type t :: %__MODULE__{banned_users: [String.t()], failed_users: [String.t()]}

  defstruct [:banned_users, :failed_users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [banned_users: [string: :generic], failed_users: [string: :generic]]
  end
end
