defmodule GetCouponCodeCreateJobResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCouponCodeCreateJobResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCouponCodeCreateJobResponseCompoundDocumentData.t(),
          included: [CouponCodeResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCouponCodeCreateJobResponseCompoundDocumentData, :t},
      included: [{CouponCodeResponseObjectResource, :t}]
    ]
  end
end
