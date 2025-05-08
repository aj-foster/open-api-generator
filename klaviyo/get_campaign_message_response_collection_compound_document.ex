defmodule GetCampaignMessageResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetCampaignMessageResponseCollectionCompoundDocumentData.t()],
          included:
            [CampaignResponseObjectResource.t() | TemplateResponseObjectResource.t()] | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetCampaignMessageResponseCollectionCompoundDocumentData, :t}],
      included: [
        union: [{CampaignResponseObjectResource, :t}, {TemplateResponseObjectResource, :t}]
      ],
      links: {CollectionLinks, :t}
    ]
  end
end
