defmodule ApiUserWithoutKey do
  @moduledoc """
  Provides struct and type for a ApiUserWithoutKey
  """

  @type t :: %__MODULE__{
          apiKeyLastChars: String.t() | nil,
          avatar: String.t(),
          email: String.t(),
          id: integer,
          name: String.t(),
          organizations: [ApiUserWithoutKeyOrganizations.t()],
          username: String.t()
        }

  defstruct [:apiKeyLastChars, :avatar, :email, :id, :name, :organizations, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiKeyLastChars: {:string, :generic},
      avatar: {:string, :generic},
      email: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      organizations: [{ApiUserWithoutKeyOrganizations, :t}],
      username: {:string, :generic}
    ]
  end
end
