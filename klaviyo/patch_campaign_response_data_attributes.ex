defmodule Klaviyo.PatchCampaignResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseDataAttributes
  """

  @type t :: %__MODULE__{
          archived: boolean,
          audiences: Klaviyo.AudiencesSubObject.t(),
          created_at: DateTime.t(),
          name: String.t(),
          scheduled_at: DateTime.t(),
          send_options:
            Klaviyo.EmailSendOptionsSubObject.t() | Klaviyo.SMSSendOptionsSubObject.t(),
          send_strategy: Klaviyo.SendStrategySubObject.t(),
          send_time: DateTime.t(),
          status: String.t(),
          tracking_options:
            Klaviyo.EmailTrackingOptionsSubObject.t() | Klaviyo.SMSTrackingOptionsSubObject.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :archived,
    :audiences,
    :created_at,
    :name,
    :scheduled_at,
    :send_options,
    :send_strategy,
    :send_time,
    :status,
    :tracking_options,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      audiences: {Klaviyo.AudiencesSubObject, :t},
      created_at: {:string, "date-time"},
      name: :string,
      scheduled_at: {:string, "date-time"},
      send_options:
        {:union, [{Klaviyo.EmailSendOptionsSubObject, :t}, {Klaviyo.SMSSendOptionsSubObject, :t}]},
      send_strategy: {Klaviyo.SendStrategySubObject, :t},
      send_time: {:string, "date-time"},
      status: :string,
      tracking_options:
        {:union,
         [{Klaviyo.EmailTrackingOptionsSubObject, :t}, {Klaviyo.SMSTrackingOptionsSubObject, :t}]},
      updated_at: {:string, "date-time"}
    ]
  end
end
