defmodule Klaviyo.GetCouponCodeCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCouponCodeCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCouponCodeCreateJobResponseCompoundDocumentData.t(),
          included: [Klaviyo.CouponCodeResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCouponCodeCreateJobResponseCompoundDocumentData, :t},
      included: [{Klaviyo.CouponCodeResponseObjectResource, :t}]
    ]
  end
end
