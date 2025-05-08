defmodule PostCouponCodeCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCouponCodeCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCouponCodeCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCouponCodeCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCouponCodeCreateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCouponCodeCreateJobResponseDataRelationships, :t},
      type: {:const, "coupon-code-bulk-create-job"}
    ]
  end
end
