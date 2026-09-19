defmodule Discord.MessageEmbedResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedResponse
  """

  @type t :: %__MODULE__{
          author: Discord.MessageEmbedAuthorResponse.t() | nil,
          color: integer | nil,
          description: String.t() | nil,
          fields: [map] | nil,
          footer: Discord.MessageEmbedFooterResponse.t() | nil,
          image: Discord.MessageEmbedImageResponse.t() | nil,
          provider: Discord.MessageEmbedProviderResponse.t() | nil,
          thumbnail: Discord.MessageEmbedImageResponse.t() | nil,
          timestamp: DateTime.t() | nil,
          title: String.t() | nil,
          type: String.t(),
          url: String.t() | nil,
          video: Discord.MessageEmbedVideoResponse.t() | nil
        }

  defstruct [
    :author,
    :color,
    :description,
    :fields,
    :footer,
    :image,
    :provider,
    :thumbnail,
    :timestamp,
    :title,
    :type,
    :url,
    :video
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: {:union, [{Discord.MessageEmbedAuthorResponse, :t}, :null]},
      color: {:union, [{:integer, "int32"}, :null]},
      description: {:union, [:string, :null]},
      fields: {:union, [[:map], :null]},
      footer: {:union, [{Discord.MessageEmbedFooterResponse, :t}, :null]},
      image: {:union, [{Discord.MessageEmbedImageResponse, :t}, :null]},
      provider: {:union, [{Discord.MessageEmbedProviderResponse, :t}, :null]},
      thumbnail: {:union, [{Discord.MessageEmbedImageResponse, :t}, :null]},
      timestamp: {:union, [{:string, "date-time"}, :null]},
      title: {:union, [:string, :null]},
      type: :string,
      url: {:union, [{:string, "uri"}, :null]},
      video: {:union, [{Discord.MessageEmbedVideoResponse, :t}, :null]}
    ]
  end
end
