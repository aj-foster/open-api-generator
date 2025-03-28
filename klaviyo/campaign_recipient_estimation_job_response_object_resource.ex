defmodule CampaignRecipientEstimationJobResponseObjectResource do
  @moduledoc """
  Provides struct and type for a CampaignRecipientEstimationJobResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: CampaignRecipientEstimationJobResponseObjectResourceAttributes.t(),
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
      attributes: {CampaignRecipientEstimationJobResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "campaign-recipient-estimation-job"}
    ]
  end
end
