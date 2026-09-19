defmodule Klaviyo.GetFlowActionFlowMessageRelationshipResponseCollection do
  @moduledoc """
  Provides struct and type for a GetFlowActionFlowMessageRelationshipResponseCollection
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetFlowActionFlowMessageRelationshipResponseCollectionData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetFlowActionFlowMessageRelationshipResponseCollectionData, :t}]]
  end
end
