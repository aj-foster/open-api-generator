defmodule MessageEmbedResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedResponse
  """

  @type t :: %__MODULE__{
          author: MessageEmbedAuthorResponse.t() | nil,
          color: integer | nil,
          description: String.t() | nil,
          fields: [map] | nil,
          footer: MessageEmbedFooterResponse.t() | nil,
          image: MessageEmbedImageResponse.t() | nil,
          provider: MessageEmbedProviderResponse.t() | nil,
          thumbnail: MessageEmbedImageResponse.t() | nil,
          timestamp: DateTime.t() | nil,
          title: String.t() | nil,
          type: String.t(),
          url: String.t() | nil,
          video: MessageEmbedVideoResponse.t() | nil
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
      author: {:union, [{MessageEmbedAuthorResponse, :t}, :null]},
      color: {:union, [:integer, :null]},
      description: {:union, [{:string, :generic}, :null]},
      fields: {:union, [[:map], :null]},
      footer: {:union, [{MessageEmbedFooterResponse, :t}, :null]},
      image: {:union, [{MessageEmbedImageResponse, :t}, :null]},
      provider: {:union, [{MessageEmbedProviderResponse, :t}, :null]},
      thumbnail: {:union, [{MessageEmbedImageResponse, :t}, :null]},
      timestamp: {:union, [{:string, :date_time}, :null]},
      title: {:union, [{:string, :generic}, :null]},
      type: {:string, :generic},
      url: {:union, [{:string, :uri}, :null]},
      video: {:union, [{MessageEmbedVideoResponse, :t}, :null]}
    ]
  end
end
