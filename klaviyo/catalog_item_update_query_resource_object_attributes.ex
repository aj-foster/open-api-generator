defmodule Klaviyo.CatalogItemUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          custom_metadata: map | nil,
          description: String.t() | nil,
          image_full_url: String.t() | nil,
          image_thumbnail_url: String.t() | nil,
          images: [String.t()] | nil,
          price: number | nil,
          published: boolean | nil,
          title: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :custom_metadata,
    :description,
    :image_full_url,
    :image_thumbnail_url,
    :images,
    :price,
    :published,
    :title,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_metadata: :map,
      description: :string,
      image_full_url: :string,
      image_thumbnail_url: :string,
      images: [:string],
      price: :number,
      published: :boolean,
      title: :string,
      url: :string
    ]
  end
end
