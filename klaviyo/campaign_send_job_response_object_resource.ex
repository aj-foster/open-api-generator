defmodule Klaviyo.CampaignSendJobResponseObjectResource do
  @moduledoc """
  Provides struct and type for a CampaignSendJobResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CampaignSendJobResponseObjectResourceAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CampaignSendJobResponseObjectResourceAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      type: {:const, "campaign-send-job"}
    ]
  end
end
