defmodule GetProfileResponseCollectionDataAttributes do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCollectionDataAttributes
  """

  @type t :: %__MODULE__{
          predictive_analytics: PredictiveAnalytics.t() | nil,
          subscriptions: Subscriptions.t() | nil
        }

  defstruct [:predictive_analytics, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [predictive_analytics: {PredictiveAnalytics, :t}, subscriptions: {Subscriptions, :t}]
  end
end
