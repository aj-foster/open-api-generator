defmodule PostCampaignResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCampaignResponseDataAttributes
  """

  @type t :: %__MODULE__{
          archived: boolean,
          audiences: AudiencesSubObject.t(),
          created_at: DateTime.t(),
          name: String.t(),
          scheduled_at: DateTime.t(),
          send_options: EmailSendOptionsSubObject.t() | SMSSendOptionsSubObject.t(),
          send_strategy: SendStrategySubObject.t(),
          send_time: DateTime.t(),
          status: String.t(),
          tracking_options: EmailTrackingOptionsSubObject.t() | SMSTrackingOptionsSubObject.t(),
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
      audiences: {AudiencesSubObject, :t},
      created_at: {:string, :date_time},
      name: {:string, :generic},
      scheduled_at: {:string, :date_time},
      send_options: {:union, [{EmailSendOptionsSubObject, :t}, {SMSSendOptionsSubObject, :t}]},
      send_strategy: {SendStrategySubObject, :t},
      send_time: {:string, :date_time},
      status: {:string, :generic},
      tracking_options:
        {:union, [{EmailTrackingOptionsSubObject, :t}, {SMSTrackingOptionsSubObject, :t}]},
      updated_at: {:string, :date_time}
    ]
  end
end
