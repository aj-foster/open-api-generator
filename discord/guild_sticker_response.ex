defmodule Discord.GuildStickerResponse do
  @moduledoc """
  Provides struct and type for a GuildStickerResponse
  """

  @type t :: %__MODULE__{
          available: boolean,
          description: String.t() | nil,
          format_type: integer | nil,
          guild_id: String.t(),
          id: String.t(),
          name: String.t(),
          tags: String.t(),
          type: 2,
          user: Discord.UserResponse.t() | nil
        }

  defstruct [:available, :description, :format_type, :guild_id, :id, :name, :tags, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available: :boolean,
      description: {:union, [:string, :null]},
      format_type: {:union, [{:integer, "int32"}, :null]},
      guild_id: {:string, "snowflake"},
      id: {:string, "snowflake"},
      name: :string,
      tags: :string,
      type: {:const, 2},
      user: {:union, [{Discord.UserResponse, :t}, :null]}
    ]
  end
end
