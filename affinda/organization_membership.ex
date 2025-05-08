defmodule OrganizationMembership do
  @moduledoc """
  Provides struct and type for a OrganizationMembership
  """

  @type t :: %__MODULE__{
          identifier: String.t(),
          organization: String.t(),
          role: String.t(),
          user: User.t()
        }

  defstruct [:identifier, :organization, :role, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      identifier: {:string, :generic},
      organization: {:string, :generic},
      role: {:enum, ["admin", "member"]},
      user: {User, :t}
    ]
  end
end
