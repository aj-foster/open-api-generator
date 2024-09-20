defmodule EventCreateQueryV2ResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a EventCreateQueryV2ResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          metric: EventCreateQueryV2ResourceObjectAttributesMetric.t(),
          profile: EventCreateQueryV2ResourceObjectAttributesProfile.t(),
          properties: map,
          time: DateTime.t() | nil,
          unique_id: String.t() | nil,
          value: number | nil
        }

  defstruct [:metric, :profile, :properties, :time, :unique_id, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metric: {EventCreateQueryV2ResourceObjectAttributesMetric, :t},
      profile: {EventCreateQueryV2ResourceObjectAttributesProfile, :t},
      properties: :map,
      time: {:string, :date_time},
      unique_id: {:string, :generic},
      value: :number
    ]
  end
end
