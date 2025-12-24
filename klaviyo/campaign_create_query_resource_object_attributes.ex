defmodule Klaviyo.CampaignCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          audiences: Klaviyo.AudiencesSubObject.t(),
          "campaign-messages":
            Klaviyo.CampaignCreateQueryResourceObjectAttributesCampaignMessages.t(),
          name: String.t(),
          send_options:
            Klaviyo.EmailSendOptionsSubObject.t() | Klaviyo.SMSSendOptionsSubObject.t() | nil,
          send_strategy: Klaviyo.SendStrategySubObject.t() | nil,
          tracking_options:
            Klaviyo.EmailTrackingOptionsSubObject.t()
            | Klaviyo.SMSTrackingOptionsSubObject.t()
            | nil
        }

  defstruct [
    :audiences,
    :"campaign-messages",
    :name,
    :send_options,
    :send_strategy,
    :tracking_options
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audiences: {Klaviyo.AudiencesSubObject, :t},
      "campaign-messages":
        {Klaviyo.CampaignCreateQueryResourceObjectAttributesCampaignMessages, :t},
      name: :string,
      send_options:
        {:union, [{Klaviyo.EmailSendOptionsSubObject, :t}, {Klaviyo.SMSSendOptionsSubObject, :t}]},
      send_strategy: {Klaviyo.SendStrategySubObject, :t},
      tracking_options:
        {:union,
         [{Klaviyo.EmailTrackingOptionsSubObject, :t}, {Klaviyo.SMSTrackingOptionsSubObject, :t}]}
    ]
  end
end
