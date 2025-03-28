defmodule CampaignPartialUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CampaignPartialUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          audiences: AudiencesSubObject.t() | nil,
          name: String.t() | nil,
          send_options: EmailSendOptionsSubObject.t() | SMSSendOptionsSubObject.t() | nil,
          send_strategy: SendStrategySubObject.t() | nil,
          tracking_options:
            EmailTrackingOptionsSubObject.t() | SMSTrackingOptionsSubObject.t() | nil
        }

  defstruct [:audiences, :name, :send_options, :send_strategy, :tracking_options]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audiences: {AudiencesSubObject, :t},
      name: {:string, :generic},
      send_options: {:union, [{EmailSendOptionsSubObject, :t}, {SMSSendOptionsSubObject, :t}]},
      send_strategy: {SendStrategySubObject, :t},
      tracking_options:
        {:union, [{EmailTrackingOptionsSubObject, :t}, {SMSTrackingOptionsSubObject, :t}]}
    ]
  end
end
