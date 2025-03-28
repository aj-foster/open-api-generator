defmodule GetCouponCodeCreateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeCreateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "coupon-codes":
            GetCouponCodeCreateJobResponseCollectionCompoundDocumentDataRelationshipsCouponCodes.t()
            | nil
        }

  defstruct [:"coupon-codes"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "coupon-codes":
        {GetCouponCodeCreateJobResponseCollectionCompoundDocumentDataRelationshipsCouponCodes, :t}
    ]
  end
end
