defmodule CampaignMessageAssignTemplateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignMessageAssignTemplateQueryResourceObject
  """

  @type t :: %__MODULE__{
          id: String.t(),
          relationships: CampaignMessageAssignTemplateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:id, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      relationships: {CampaignMessageAssignTemplateQueryResourceObjectRelationships, :t},
      type: {:const, "campaign-message"}
    ]
  end
end
