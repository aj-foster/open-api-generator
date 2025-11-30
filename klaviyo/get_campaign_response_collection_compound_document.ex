defmodule Klaviyo.GetCampaignResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCampaignResponseCollectionCompoundDocumentData.t()],
          included:
            [
              Klaviyo.CampaignMessageResponseObjectResource.t()
              | Klaviyo.TagResponseObjectResource.t()
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
      data: [{Klaviyo.GetCampaignResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [
          {Klaviyo.CampaignMessageResponseObjectResource, :t},
          {Klaviyo.TagResponseObjectResource, :t}
        ]
      ],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
