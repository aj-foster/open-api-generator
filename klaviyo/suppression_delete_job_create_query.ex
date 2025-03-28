defmodule SuppressionDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a SuppressionDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: SuppressionDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SuppressionDeleteJobCreateQueryResourceObject, :t}]
  end
end
