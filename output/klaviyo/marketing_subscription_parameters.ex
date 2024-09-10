defmodule MarketingSubscriptionParameters do
  @moduledoc """
  Provides struct and type for a MarketingSubscriptionParameters
  """

  @type t :: %__MODULE__{consent: String.t(), consented_at: DateTime.t() | nil}

  defstruct [:consent, :consented_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [consent: {:const, "SUBSCRIBED"}, consented_at: {:string, :date_time}]
  end
end
