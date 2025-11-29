defmodule TagCreateQuery do
  @moduledoc """
  Provides struct and type for a TagCreateQuery
  """

  @type t :: %__MODULE__{data: TagCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TagCreateQueryResourceObject, :t}]
  end
end
