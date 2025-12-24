defmodule Klaviyo.GetCampaignResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: Klaviyo.GetCampaignResponseCompoundDocumentData.t(),
          included:
            [
              Klaviyo.CampaignMessageResponseObjectResource.t()
              | Klaviyo.TagResponseObjectResource.t()
            ]
            | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Klaviyo.GetCampaignResponseCompoundDocumentData, :t},
      included: [
        union: [
          {Klaviyo.CampaignMessageResponseObjectResource, :t},
          {Klaviyo.TagResponseObjectResource, :t}
        ]
      ]
    ]
  end
end
