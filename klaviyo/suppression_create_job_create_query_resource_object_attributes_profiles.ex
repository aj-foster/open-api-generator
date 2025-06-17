defmodule SuppressionCreateJobCreateQueryResourceObjectAttributesProfiles do
  @moduledoc """
  Provides struct and type for a SuppressionCreateJobCreateQueryResourceObjectAttributesProfiles
  """

  @type t :: %__MODULE__{data: [ProfileSuppressionCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ProfileSuppressionCreateQueryResourceObject, :t}]]
  end
end
