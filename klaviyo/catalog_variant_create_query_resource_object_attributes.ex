defmodule CatalogVariantCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObjectAttributes
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
          inventory_policy: 0 | 1 | 2 | nil,
          inventory_quantity: number,
          price: number,
          published: boolean | nil,
          sku: String.t(),
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
    :inventory_policy,
    :inventory_quantity,
    :price,
    :published,
    :sku,
    :title,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      catalog_type: {:string, :generic},
      custom_metadata: :map,
      description: {:string, :generic},
      external_id: {:string, :generic},
      image_full_url: {:string, :generic},
      image_thumbnail_url: {:string, :generic},
      images: [string: :generic],
      integration_type: {:const, "$custom"},
      inventory_policy: {:enum, [0, 1, 2]},
      inventory_quantity: :number,
      price: :number,
      published: :boolean,
      sku: {:string, :generic},
      title: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
