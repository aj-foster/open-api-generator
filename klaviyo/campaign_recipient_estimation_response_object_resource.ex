defmodule CampaignRecipientEstimationResponseObjectResource do
  @moduledoc """
  Provides struct and type for a CampaignRecipientEstimationResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: CampaignRecipientEstimationResponseObjectResourceAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CampaignRecipientEstimationResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "campaign-recipient-estimation"}
    ]
  end
end
