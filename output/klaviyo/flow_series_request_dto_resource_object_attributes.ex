defmodule FlowSeriesRequestDTOResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a FlowSeriesRequestDTOResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          conversion_metric_id: String.t(),
          filter: String.t() | nil,
          interval: String.t(),
          statistics: [String.t()],
          timeframe: CustomTimeframe.t() | Timeframe.t()
        }

  defstruct [:conversion_metric_id, :filter, :interval, :statistics, :timeframe]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conversion_metric_id: {:string, :generic},
      filter: {:string, :generic},
      interval: {:enum, ["daily", "hourly", "monthly", "weekly"]},
      statistics: [
        enum: [
          "average_order_value",
          "bounce_rate",
          "bounced",
          "bounced_or_failed",
          "bounced_or_failed_rate",
          "click_rate",
          "click_to_open_rate",
          "clicks",
          "clicks_unique",
          "conversion_rate",
          "conversion_uniques",
          "conversion_value",
          "conversions",
          "delivered",
          "delivery_rate",
          "failed",
          "failed_rate",
          "open_rate",
          "opens",
          "opens_unique",
          "recipients",
          "revenue_per_recipient",
          "spam_complaint_rate",
          "spam_complaints",
          "unsubscribe_rate",
          "unsubscribe_uniques",
          "unsubscribes"
        ]
      ],
      timeframe: {:union, [{CustomTimeframe, :t}, {Timeframe, :t}]}
    ]
  end
end
