defmodule SuppressionCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a SuppressionCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: SuppressionCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SuppressionCreateJobCreateQueryResourceObject, :t}]
  end
end
