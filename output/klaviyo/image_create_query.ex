defmodule ImageCreateQuery do
  @moduledoc """
  Provides struct and type for a ImageCreateQuery
  """

  @type t :: %__MODULE__{data: ImageCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ImageCreateQueryResourceObject, :t}]
  end
end
