defmodule PostCampaignSendJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCampaignSendJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCampaignSendJobResponseDataAttributes.t(),
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
      attributes: {PostCampaignSendJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "campaign-send-job"}
    ]
  end
end
