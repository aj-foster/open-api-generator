defmodule GitHub.CombinedBillingUsage do
  @moduledoc """
  Provides struct and type for a CombinedBillingUsage
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          days_left_in_billing_cycle: integer,
          estimated_paid_storage_for_month: integer,
          estimated_storage_for_month: integer
        }

  defstruct [
    :__info__,
    :days_left_in_billing_cycle,
    :estimated_paid_storage_for_month,
    :estimated_storage_for_month
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      days_left_in_billing_cycle: :integer,
      estimated_paid_storage_for_month: :integer,
      estimated_storage_for_month: :integer
    ]
  end
end
