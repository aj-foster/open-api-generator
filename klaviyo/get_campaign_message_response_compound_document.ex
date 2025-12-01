defmodule Klaviyo.GetCampaignMessageResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCampaignMessageResponseCompoundDocumentData.t(),
          included:
            [
              Klaviyo.CampaignResponseObjectResource.t()
              | Klaviyo.TemplateResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCampaignMessageResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.CampaignResponseObjectResource, :t},
          {Klaviyo.TemplateResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
