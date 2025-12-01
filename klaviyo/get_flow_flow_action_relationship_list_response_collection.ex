defmodule Klaviyo.GetFlowFlowActionRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetFlowFlowActionRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetFlowFlowActionRelationshipListResponseCollectionData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetFlowFlowActionRelationshipListResponseCollectionData, :t}]]
  end
end
