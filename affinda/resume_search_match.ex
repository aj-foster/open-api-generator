defmodule ResumeSearchMatch do
  @moduledoc """
  Provides struct and type for a ResumeSearchMatch
  """

  @type t :: %__MODULE__{details: ResumeSearchMatchDetails.t() | nil, score: number | nil}

  defstruct [:details, :score]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [details: {ResumeSearchMatchDetails, :t}, score: :number]
  end
end
