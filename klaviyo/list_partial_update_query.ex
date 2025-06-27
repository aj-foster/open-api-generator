defmodule ListPartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a ListPartialUpdateQuery
  """

  @type t :: %__MODULE__{data: ListPartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ListPartialUpdateQueryResourceObject, :t}]
  end
end
