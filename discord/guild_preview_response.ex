defmodule Discord.GuildPreviewResponse do
  @moduledoc """
  Provides struct and type for a GuildPreviewResponse
  """

  @type t :: %__MODULE__{
          approximate_member_count: integer,
          approximate_presence_count: integer,
          description: String.t() | nil,
          discovery_splash: String.t() | nil,
          emojis: [Discord.EmojiResponse.t()],
          features: [String.t()],
          home_header: String.t() | nil,
          icon: String.t() | nil,
          id: String.t(),
          name: String.t(),
          splash: String.t() | nil,
          stickers: [Discord.GuildStickerResponse.t()]
        }

  defstruct [
    :approximate_member_count,
    :approximate_presence_count,
    :description,
    :discovery_splash,
    :emojis,
    :features,
    :home_header,
    :icon,
    :id,
    :name,
    :splash,
    :stickers
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approximate_member_count: {:integer, "int32"},
      approximate_presence_count: {:integer, "int32"},
      description: {:union, [:string, :null]},
      discovery_splash: {:union, [:string, :null]},
      emojis: [{Discord.EmojiResponse, :t}],
      features: [:string],
      home_header: {:union, [:string, :null]},
      icon: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      name: :string,
      splash: {:union, [:string, :null]},
      stickers: [{Discord.GuildStickerResponse, :t}]
    ]
  end
end
