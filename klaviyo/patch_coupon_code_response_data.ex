defmodule PatchCouponCodeResponseData do
  @moduledoc """
  Provides struct and type for a PatchCouponCodeResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCouponCodeResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCouponCodeResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCouponCodeResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCouponCodeResponseDataRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
