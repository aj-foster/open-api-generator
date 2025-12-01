defmodule Klaviyo.GetFlowMessageResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-action":
            Klaviyo.GetFlowMessageResponseCollectionDataRelationshipsFlowAction.t() | nil,
          template: Klaviyo.GetFlowMessageResponseCollectionDataRelationshipsTemplate.t() | nil
        }

  defstruct [:"flow-action", :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-action": {Klaviyo.GetFlowMessageResponseCollectionDataRelationshipsFlowAction, :t},
      template: {Klaviyo.GetFlowMessageResponseCollectionDataRelationshipsTemplate, :t}
    ]
  end
end
