defmodule ClientBISSubscriptionCreateQuery do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQuery
  """

  @type t :: %__MODULE__{data: ClientBISSubscriptionCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ClientBISSubscriptionCreateQueryResourceObject, :t}]
  end
end
