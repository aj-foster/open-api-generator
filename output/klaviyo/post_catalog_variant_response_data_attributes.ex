defmodule PostCatalogVariantResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponseDataAttributes
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          custom_metadata: map | nil,
          description: String.t() | nil,
          external_id: String.t() | nil,
          image_full_url: String.t() | nil,
          image_thumbnail_url: String.t() | nil,
          images: [String.t()] | nil,
          inventory_policy: 0 | 1 | 2 | nil,
          inventory_quantity: number | nil,
          price: number | nil,
          published: boolean | nil,
          sku: String.t() | nil,
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
    :inventory_policy,
    :inventory_quantity,
    :price,
    :published,
    :sku,
    :title,
    :updated,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, :date_time},
      custom_metadata: :map,
      description: {:string, :generic},
      external_id: {:string, :generic},
      image_full_url: {:string, :generic},
      image_thumbnail_url: {:string, :generic},
      images: [string: :generic],
      inventory_policy: {:enum, [0, 1, 2]},
      inventory_quantity: :number,
      price: :number,
      published: :boolean,
      sku: {:string, :generic},
      title: {:string, :generic},
      updated: {:string, :date_time},
      url: {:string, :generic}
    ]
  end
end
