defmodule SearchExpressionSearchScoreComponent do
  @moduledoc """
  Provides struct and type for a SearchExpressionSearchScoreComponent
  """

  @type t :: %__MODULE__{label: String.t(), score: number | nil, value: String.t() | nil}

  defstruct [:label, :score, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, score: :number, value: {:string, :generic}]
  end
end
