defmodule AccountResponseBody do
  @moduledoc """
  Provides struct and type for a AccountResponseBody
  """

  @type t :: %__MODULE__{
          email: String.t(),
          id: String.t(),
          organizations: [OrganizationMembership.t()],
          profile_picture: String.t() | nil
        }

  defstruct [:email, :id, :organizations, :profile_picture]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :email},
      id: {:string, :generic},
      organizations: [{OrganizationMembership, :t}],
      profile_picture: {:string, :uri}
    ]
  end
end
