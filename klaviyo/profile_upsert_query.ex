defmodule Klaviyo.ProfileUpsertQuery do
  @moduledoc """
  Provides struct and type for a ProfileUpsertQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.ProfileUpsertQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ProfileUpsertQueryResourceObject, :t}]
  end
end
