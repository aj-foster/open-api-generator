defmodule Klaviyo.ImagePartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a ImagePartialUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.ImagePartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ImagePartialUpdateQueryResourceObject, :t}]
  end
end
