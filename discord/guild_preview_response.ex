defmodule GuildPreviewResponse do
  @moduledoc """
  Provides struct and type for a GuildPreviewResponse
  """

  @type t :: %__MODULE__{
          approximate_member_count: integer,
          approximate_presence_count: integer,
          description: String.t() | nil,
          discovery_splash: String.t() | nil,
          emojis: [EmojiResponse.t()],
          features: [String.t()],
          home_header: String.t() | nil,
          icon: String.t() | nil,
          id: String.t(),
          name: String.t(),
          splash: String.t() | nil,
          stickers: [GuildStickerResponse.t()]
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
      approximate_member_count: :integer,
      approximate_presence_count: :integer,
      description: {:union, [{:string, :generic}, :null]},
      discovery_splash: {:union, [{:string, :generic}, :null]},
      emojis: [{EmojiResponse, :t}],
      features: [string: :generic],
      home_header: {:union, [{:string, :generic}, :null]},
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      splash: {:union, [{:string, :generic}, :null]},
      stickers: [{GuildStickerResponse, :t}]
    ]
  end
end
