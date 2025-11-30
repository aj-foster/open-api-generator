defmodule Klaviyo.PatchCouponResponseData do
  @moduledoc """
  Provides struct and type for a PatchCouponResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCouponResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCouponResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      type: {:const, "coupon"}
    ]
  end
end
