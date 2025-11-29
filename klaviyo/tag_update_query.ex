defmodule TagUpdateQuery do
  @moduledoc """
  Provides struct and type for a TagUpdateQuery
  """

  @type t :: %__MODULE__{data: TagUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TagUpdateQueryResourceObject, :t}]
  end
end
