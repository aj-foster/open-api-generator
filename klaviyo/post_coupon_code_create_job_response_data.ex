defmodule Klaviyo.PostCouponCodeCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCouponCodeCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCouponCodeCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCouponCodeCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCouponCodeCreateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCouponCodeCreateJobResponseDataRelationships, :t},
      type: {:const, "coupon-code-bulk-create-job"}
    ]
  end
end
