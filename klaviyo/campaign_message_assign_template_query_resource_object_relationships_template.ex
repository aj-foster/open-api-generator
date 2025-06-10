defmodule CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplate do
  @moduledoc """
  Provides struct and type for a CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplate
  """

  @type t :: %__MODULE__{
          data: CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplateData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplateData, :t}]
  end
end
