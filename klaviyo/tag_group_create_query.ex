defmodule TagGroupCreateQuery do
  @moduledoc """
  Provides struct and type for a TagGroupCreateQuery
  """

  @type t :: %__MODULE__{data: TagGroupCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TagGroupCreateQueryResourceObject, :t}]
  end
end
