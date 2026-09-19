defmodule Klaviyo.GetCampaignMessageResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentData.t()],
          included:
            [
              Klaviyo.CampaignResponseObjectResource.t()
              | Klaviyo.TemplateResponseObjectResource.t()
            ]
            | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [
          {Klaviyo.CampaignResponseObjectResource, :t},
          {Klaviyo.TemplateResponseObjectResource, :t}
        ]
      ],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
