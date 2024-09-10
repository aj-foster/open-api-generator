defmodule ResumeSearchDetailOccupationGroup do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailOccupationGroup
  """

  @type t :: %__MODULE__{missing: [integer] | nil, value: [OccupationGroupSearchResult.t()] | nil}

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [missing: [:integer], value: [{OccupationGroupSearchResult, :t}]]
  end
end
