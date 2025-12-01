defmodule Klaviyo.GetProfileResponseCollectionDataAttributes do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionDataAttributes
  """

  @type t :: %__MODULE__{
          predictive_analytics: Klaviyo.PredictiveAnalytics.t() | nil,
          subscriptions: Klaviyo.Subscriptions.t() | nil
        }

  defstruct [:predictive_analytics, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      predictive_analytics: {Klaviyo.PredictiveAnalytics, :t},
      subscriptions: {Klaviyo.Subscriptions, :t}
    ]
  end
end
