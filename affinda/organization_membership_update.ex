defmodule OrganizationMembershipUpdate do
  @moduledoc """
  Provides struct and type for a OrganizationMembershipUpdate
  """

  @type t :: %__MODULE__{role: String.t() | nil}

  defstruct [:role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: {:enum, ["admin", "member"]}]
  end
end
