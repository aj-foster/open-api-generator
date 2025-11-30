defmodule Klaviyo.PushTokenUnregisterQuery do
  @moduledoc """
  Provides struct and type for a PushTokenUnregisterQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.PushTokenUnregisterQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PushTokenUnregisterQueryResourceObject, :t}]
  end
end
