defmodule Klaviyo.PatchFlowResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchFlowResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions": Klaviyo.PatchFlowResponseDataRelationshipsFlowActions.t() | nil,
          tags: Klaviyo.PatchFlowResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions": {Klaviyo.PatchFlowResponseDataRelationshipsFlowActions, :t},
      tags: {Klaviyo.PatchFlowResponseDataRelationshipsTags, :t}
    ]
  end
end
