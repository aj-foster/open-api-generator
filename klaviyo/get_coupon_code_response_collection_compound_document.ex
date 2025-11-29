defmodule GetCouponCodeResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetCouponCodeResponseCollectionCompoundDocumentData.t()],
          included: [CouponResponseObjectResource.t()] | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetCouponCodeResponseCollectionCompoundDocumentData, :t}],
      included: [{CouponResponseObjectResource, :t}],
      links: {CollectionLinks, :t}
    ]
  end
end
