defmodule Klaviyo.CampaignSendJobPartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CampaignSendJobPartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CampaignSendJobPartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CampaignSendJobPartialUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "campaign-send-job"}
    ]
  end
end
