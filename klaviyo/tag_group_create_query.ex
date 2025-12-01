defmodule Klaviyo.TagGroupCreateQuery do
  @moduledoc """
  Provides struct and type for a TagGroupCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.TagGroupCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.TagGroupCreateQueryResourceObject, :t}]
  end
end
