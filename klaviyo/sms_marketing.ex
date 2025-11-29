defmodule SMSMarketing do
  @moduledoc """
  Provides struct and type for a SMSMarketing
  """

  @type t :: %__MODULE__{
          can_receive_sms_marketing: boolean,
          consent: String.t(),
          consent_timestamp: DateTime.t(),
          last_updated: DateTime.t(),
          method: String.t(),
          method_detail: String.t() | nil
        }

  defstruct [
    :can_receive_sms_marketing,
    :consent,
    :consent_timestamp,
    :last_updated,
    :method,
    :method_detail
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_receive_sms_marketing: :boolean,
      consent: {:string, :generic},
      consent_timestamp: {:string, :date_time},
      last_updated: {:string, :date_time},
      method: {:string, :generic},
      method_detail: {:string, :generic}
    ]
  end
end
