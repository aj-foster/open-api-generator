defmodule Klaviyo.CampaignMessageAssignTemplateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CampaignMessageAssignTemplateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          template:
            Klaviyo.CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplate.t()
        }

  defstruct [:template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      template:
        {Klaviyo.CampaignMessageAssignTemplateQueryResourceObjectRelationshipsTemplate, :t}
    ]
  end
end
