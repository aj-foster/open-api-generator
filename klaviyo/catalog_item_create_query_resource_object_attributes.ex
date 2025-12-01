defmodule Klaviyo.CatalogItemCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          catalog_type: String.t() | nil,
          custom_metadata: map | nil,
          description: String.t(),
          external_id: String.t(),
          image_full_url: String.t() | nil,
          image_thumbnail_url: String.t() | nil,
          images: [String.t()] | nil,
          integration_type: String.t() | nil,
          price: number | nil,
          published: boolean | nil,
          title: String.t(),
          url: String.t()
        }

  defstruct [
    :catalog_type,
    :custom_metadata,
    :description,
    :external_id,
    :image_full_url,
    :image_thumbnail_url,
    :images,
    :integration_type,
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
      catalog_type: :string,
      custom_metadata: :map,
      description: :string,
      external_id: :string,
      image_full_url: :string,
      image_thumbnail_url: :string,
      images: [:string],
      integration_type: {:const, "$custom"},
      price: :number,
      published: :boolean,
      title: :string,
      url: :string
    ]
  end
end
