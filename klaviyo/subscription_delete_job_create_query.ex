defmodule Klaviyo.SubscriptionDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.SubscriptionDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.SubscriptionDeleteJobCreateQueryResourceObject, :t}]
  end
end
