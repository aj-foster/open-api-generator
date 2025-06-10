defmodule MembershipListResponse do
  @moduledoc """
  Provides struct and type for a MembershipListResponse
  """

  @type t :: %__MODULE__{memberships: [Membership.t()]}

  defstruct [:memberships]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [memberships: [{Membership, :t}]]
  end
end
