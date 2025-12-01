defmodule Klaviyo.ServerBISSubscriptionCreateQuery do
  @moduledoc """
  Provides struct and type for a ServerBISSubscriptionCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.ServerBISSubscriptionCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ServerBISSubscriptionCreateQueryResourceObject, :t}]
  end
end
