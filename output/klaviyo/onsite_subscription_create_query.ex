defmodule OnsiteSubscriptionCreateQuery do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQuery
  """

  @type t :: %__MODULE__{data: OnsiteSubscriptionCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OnsiteSubscriptionCreateQueryResourceObject, :t}]
  end
end
