defmodule GetCouponCodeResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCouponCodeResponseCompoundDocumentData.t(),
          included: [CouponResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCouponCodeResponseCompoundDocumentData, :t},
      included: [{CouponResponseObjectResource, :t}]
    ]
  end
end
