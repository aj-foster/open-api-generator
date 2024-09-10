defmodule SubscriptionDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: SubscriptionDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SubscriptionDeleteJobCreateQueryResourceObject, :t}]
  end
end
