defmodule GetCampaignResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetCampaignResponseCompoundDocumentData.t(),
          included:
            [CampaignMessageResponseObjectResource.t() | TagResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetCampaignResponseCompoundDocumentData, :t},
      included: [
        union: [{CampaignMessageResponseObjectResource, :t}, {TagResponseObjectResource, :t}]
      ]
    ]
  end
end
