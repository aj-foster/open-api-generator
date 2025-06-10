defmodule GuildStickerResponse do
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
          user: UserResponse.t() | nil
        }

  defstruct [:available, :description, :format_type, :guild_id, :id, :name, :tags, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      available: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      format_type: {:union, [:integer, :null]},
      guild_id: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      tags: {:string, :generic},
      type: {:const, 2},
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
