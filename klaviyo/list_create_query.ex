defmodule Klaviyo.ListCreateQuery do
  @moduledoc """
  Provides struct and type for a ListCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.ListCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ListCreateQueryResourceObject, :t}]
  end
end
