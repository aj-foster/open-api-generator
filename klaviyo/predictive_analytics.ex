defmodule PredictiveAnalytics do
  @moduledoc """
  Provides struct and type for a PredictiveAnalytics
  """

  @type t :: %__MODULE__{
          average_days_between_orders: number | nil,
          average_order_value: number | nil,
          churn_probability: number | nil,
          expected_date_of_next_order: DateTime.t() | nil,
          historic_clv: number | nil,
          historic_number_of_orders: integer | nil,
          predicted_clv: number | nil,
          predicted_number_of_orders: number | nil,
          total_clv: number | nil
        }

  defstruct [
    :average_days_between_orders,
    :average_order_value,
    :churn_probability,
    :expected_date_of_next_order,
    :historic_clv,
    :historic_number_of_orders,
    :predicted_clv,
    :predicted_number_of_orders,
    :total_clv
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      average_days_between_orders: :number,
      average_order_value: :number,
      churn_probability: :number,
      expected_date_of_next_order: {:string, :date_time},
      historic_clv: :number,
      historic_number_of_orders: :integer,
      predicted_clv: :number,
      predicted_number_of_orders: :number,
      total_clv: :number
    ]
  end
end
