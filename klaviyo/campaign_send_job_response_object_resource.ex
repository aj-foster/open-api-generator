defmodule CampaignSendJobResponseObjectResource do
  @moduledoc """
  Provides struct and type for a CampaignSendJobResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: CampaignSendJobResponseObjectResourceAttributes.t(),
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
      attributes: {CampaignSendJobResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "campaign-send-job"}
    ]
  end
end
