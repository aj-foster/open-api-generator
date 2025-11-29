defmodule PostCouponCodeResponseData do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCouponCodeResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCouponCodeResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCouponCodeResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCouponCodeResponseDataRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
