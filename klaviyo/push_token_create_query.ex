defmodule Klaviyo.PushTokenCreateQuery do
  @moduledoc """
  Provides struct and type for a PushTokenCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.PushTokenCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PushTokenCreateQueryResourceObject, :t}]
  end
end
