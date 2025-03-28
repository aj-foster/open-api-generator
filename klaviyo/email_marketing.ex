defmodule EmailMarketing do
  @moduledoc """
  Provides struct and type for a EmailMarketing
  """

  @type t :: %__MODULE__{
          can_receive_email_marketing: boolean,
          consent: String.t(),
          consent_timestamp: DateTime.t() | nil,
          custom_method_detail: String.t() | nil,
          double_optin: boolean | nil,
          last_updated: DateTime.t() | nil,
          list_suppressions: [EmailMarketingListSuppression.t()] | nil,
          method: String.t() | nil,
          method_detail: String.t() | nil,
          suppression: [EmailMarketingSuppression.t()] | nil
        }

  defstruct [
    :can_receive_email_marketing,
    :consent,
    :consent_timestamp,
    :custom_method_detail,
    :double_optin,
    :last_updated,
    :list_suppressions,
    :method,
    :method_detail,
    :suppression
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_receive_email_marketing: :boolean,
      consent: {:string, :generic},
      consent_timestamp: {:string, :date_time},
      custom_method_detail: {:string, :generic},
      double_optin: :boolean,
      last_updated: {:string, :date_time},
      list_suppressions: [{EmailMarketingListSuppression, :t}],
      method: {:string, :generic},
      method_detail: {:string, :generic},
      suppression: [{EmailMarketingSuppression, :t}]
    ]
  end
end
