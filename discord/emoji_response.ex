defmodule EmojiResponse do
  @moduledoc """
  Provides struct and type for a EmojiResponse
  """

  @type t :: %__MODULE__{
          animated: boolean,
          available: boolean,
          id: String.t(),
          managed: boolean,
          name: String.t(),
          require_colons: boolean,
          roles: [String.t()],
          user: UserResponse.t() | nil
        }

  defstruct [:animated, :available, :id, :managed, :name, :require_colons, :roles, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      animated: :boolean,
      available: :boolean,
      id: {:string, "snowflake"},
      managed: :boolean,
      name: {:string, :generic},
      require_colons: :boolean,
      roles: [string: "snowflake"],
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
