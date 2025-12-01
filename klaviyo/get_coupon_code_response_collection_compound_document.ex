defmodule Klaviyo.GetCouponCodeResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentData.t()],
          included: [Klaviyo.CouponResponseObjectResource.t()] | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentData, :t}],
      included: [{Klaviyo.CouponResponseObjectResource, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
