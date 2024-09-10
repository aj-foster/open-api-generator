defmodule SegmentPartialUpdateQuery do
  @moduledoc """
  Provides struct and type for a SegmentPartialUpdateQuery
  """

  @type t :: %__MODULE__{data: SegmentPartialUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SegmentPartialUpdateQueryResourceObject, :t}]
  end
end
