defmodule Affinda.ApiUserWithKey do
  @moduledoc """
  Provides struct and type for a ApiUserWithKey
  """

  @type t :: %__MODULE__{
          apiKey: String.t(),
          apiKeyLastChars: String.t() | nil,
          avatar: String.t() | nil,
          email: String.t(),
          id: integer,
          name: String.t(),
          organizations: [Affinda.ApiUserWithKeyOrganizations.t()],
          username: String.t()
        }

  defstruct [:apiKey, :apiKeyLastChars, :avatar, :email, :id, :name, :organizations, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiKey: :string,
      apiKeyLastChars: :string,
      avatar: :string,
      email: :string,
      id: :integer,
      name: :string,
      organizations: [{Affinda.ApiUserWithKeyOrganizations, :t}],
      username: :string
    ]
  end
end
