defmodule GitHub.PackagesBillingUsage do
  @moduledoc """
  Provides struct and type for a PackagesBillingUsage
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          included_gigabytes_bandwidth: integer,
          total_gigabytes_bandwidth_used: integer,
          total_paid_gigabytes_bandwidth_used: integer
        }

  defstruct [
    :__info__,
    :included_gigabytes_bandwidth,
    :total_gigabytes_bandwidth_used,
    :total_paid_gigabytes_bandwidth_used
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      included_gigabytes_bandwidth: :integer,
      total_gigabytes_bandwidth_used: :integer,
      total_paid_gigabytes_bandwidth_used: :integer
    ]
  end
end
