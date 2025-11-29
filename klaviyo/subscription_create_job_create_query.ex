defmodule SubscriptionCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: SubscriptionCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SubscriptionCreateJobCreateQueryResourceObject, :t}]
  end
end
