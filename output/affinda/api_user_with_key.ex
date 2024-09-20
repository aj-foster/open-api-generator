defmodule ApiUserWithKey do
  @moduledoc """
  Provides struct and type for a ApiUserWithKey
  """

  @type t :: %__MODULE__{
          apiKey: String.t(),
          apiKeyLastChars: String.t() | nil,
          avatar: String.t(),
          email: String.t(),
          id: integer,
          name: String.t(),
          organizations: [ApiUserWithKeyOrganizations.t()],
          username: String.t()
        }

  defstruct [:apiKey, :apiKeyLastChars, :avatar, :email, :id, :name, :organizations, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiKey: {:string, :generic},
      apiKeyLastChars: {:string, :generic},
      avatar: {:string, :generic},
      email: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      organizations: [{ApiUserWithKeyOrganizations, :t}],
      username: {:string, :generic}
    ]
  end
end
