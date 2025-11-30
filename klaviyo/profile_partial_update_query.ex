defmodule Klaviyo.ProfilePartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a ProfilePartialUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.ProfilePartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ProfilePartialUpdateQueryResourceObject, :t}]
  end
end
