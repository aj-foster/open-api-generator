defmodule Affinda.ApiUserWithoutKey do
  @moduledoc """
  Provides struct and type for a ApiUserWithoutKey
  """

  @type t :: %__MODULE__{
          apiKeyLastChars: String.t() | nil,
          avatar: String.t() | nil,
          email: String.t(),
          id: integer,
          name: String.t(),
          organizations: [Affinda.ApiUserWithoutKeyOrganizations.t()],
          username: String.t()
        }

  defstruct [:apiKeyLastChars, :avatar, :email, :id, :name, :organizations, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiKeyLastChars: :string,
      avatar: :string,
      email: :string,
      id: :integer,
      name: :string,
      organizations: [{Affinda.ApiUserWithoutKeyOrganizations, :t}],
      username: :string
    ]
  end
end
