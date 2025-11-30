defmodule Klaviyo.PatchCatalogItemResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchCatalogItemResponseDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          custom_metadata: map | nil,
          description: String.t() | nil,
          external_id: String.t() | nil,
          image_full_url: String.t() | nil,
          image_thumbnail_url: String.t() | nil,
          images: [String.t()] | nil,
          price: number | nil,
          published: boolean | nil,
          title: String.t() | nil,
          updated: DateTime.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :created,
    :custom_metadata,
    :description,
    :external_id,
    :image_full_url,
    :image_thumbnail_url,
    :images,
    :price,
    :published,
    :title,
    :updated,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, "date-time"},
      custom_metadata: :map,
      description: :string,
      external_id: :string,
      image_full_url: :string,
      image_thumbnail_url: :string,
      images: [:string],
      price: :number,
      published: :boolean,
      title: :string,
      updated: {:string, "date-time"},
      url: :string
    ]
  end
end
