defmodule :"Elixir.PostCouponCodeCreateJobResponseDataRelationshipsCoupon-codes" do
  @moduledoc """
  Provides struct and type for a :"Elixir.PostCouponCodeCreateJobResponseDataRelationshipsCoupon-codes"
  """

  @type t :: %__MODULE__{
          data: [
            :"Elixir.:\"Elixir.PostCouponCodeCreateJobResponseDataRelationshipsCoupon-codes\"Data".t()
          ],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {:"Elixir.:\"Elixir.PostCouponCodeCreateJobResponseDataRelationshipsCoupon-codes\"Data",
         :t}
      ],
      links: {RelationshipLinks, :t}
    ]
  end
end
