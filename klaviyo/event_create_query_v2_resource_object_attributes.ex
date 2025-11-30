defmodule Klaviyo.EventCreateQueryV2ResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a EventCreateQueryV2ResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          metric: Klaviyo.EventCreateQueryV2ResourceObjectAttributesMetric.t(),
          profile: Klaviyo.EventCreateQueryV2ResourceObjectAttributesProfile.t(),
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
      metric: {Klaviyo.EventCreateQueryV2ResourceObjectAttributesMetric, :t},
      profile: {Klaviyo.EventCreateQueryV2ResourceObjectAttributesProfile, :t},
      properties: :map,
      time: {:string, "date-time"},
      unique_id: :string,
      value: :number
    ]
  end
end
