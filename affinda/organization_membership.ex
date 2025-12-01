defmodule Affinda.OrganizationMembership do
  @moduledoc """
  Provides struct and type for a OrganizationMembership
  """

  @type t :: %__MODULE__{
          identifier: String.t(),
          organization: String.t(),
          role: String.t(),
          user: Affinda.User.t()
        }

  defstruct [:identifier, :organization, :role, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      identifier: :string,
      organization: :string,
      role: {:enum, ["admin", "member"]},
      user: {Affinda.User, :t}
    ]
  end
end
