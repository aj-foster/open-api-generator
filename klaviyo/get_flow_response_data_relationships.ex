defmodule Klaviyo.GetFlowResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions": Klaviyo.GetFlowResponseDataRelationshipsFlowActions.t() | nil,
          tags: Klaviyo.GetFlowResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions": {Klaviyo.GetFlowResponseDataRelationshipsFlowActions, :t},
      tags: {Klaviyo.GetFlowResponseDataRelationshipsTags, :t}
    ]
  end
end
