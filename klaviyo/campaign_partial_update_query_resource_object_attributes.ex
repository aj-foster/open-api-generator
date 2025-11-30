defmodule Klaviyo.CampaignPartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignPartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          audiences: Klaviyo.AudiencesSubObject.t() | nil,
          name: String.t() | nil,
          send_options:
            Klaviyo.EmailSendOptionsSubObject.t() | Klaviyo.SMSSendOptionsSubObject.t() | nil,
          send_strategy: Klaviyo.SendStrategySubObject.t() | nil,
          tracking_options:
            Klaviyo.EmailTrackingOptionsSubObject.t()
            | Klaviyo.SMSTrackingOptionsSubObject.t()
            | nil
        }

  defstruct [:audiences, :name, :send_options, :send_strategy, :tracking_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audiences: {Klaviyo.AudiencesSubObject, :t},
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
