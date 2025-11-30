defmodule Klaviyo.GetCouponCodeResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
