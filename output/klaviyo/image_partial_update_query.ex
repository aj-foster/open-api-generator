defmodule ImagePartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a ImagePartialUpdateQuery
  """

  @type t :: %__MODULE__{data: ImagePartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ImagePartialUpdateQueryResourceObject, :t}]
  end
end
