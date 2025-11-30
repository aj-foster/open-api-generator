defmodule Affinda.OccupationGroupSearchScoreComponent do
  @moduledoc """
  Provides struct and type for a OccupationGroupSearchScoreComponent
  """

  @type t :: %__MODULE__{label: String.t(), score: number | nil, value: String.t() | nil}

  defstruct [:label, :score, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: :string, score: :number, value: :string]
  end
end
