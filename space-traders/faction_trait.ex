defmodule SpaceTraders.FactionTrait do
  @moduledoc """
  Provides struct and type for a FactionTrait
  """

  @type t :: %__MODULE__{description: String.t(), name: String.t(), symbol: String.t()}

  defstruct [:description, :name, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      name: :string,
      symbol:
        {:enum,
         [
           "BUREAUCRATIC",
           "SECRETIVE",
           "CAPITALISTIC",
           "INDUSTRIOUS",
           "PEACEFUL",
           "DISTRUSTFUL",
           "WELCOMING",
           "SMUGGLERS",
           "SCAVENGERS",
           "REBELLIOUS",
           "EXILES",
           "PIRATES",
           "RAIDERS",
           "CLAN",
           "GUILD",
           "DOMINION",
           "FRINGE",
           "FORSAKEN",
           "ISOLATED",
           "LOCALIZED",
           "ESTABLISHED",
           "NOTABLE",
           "DOMINANT",
           "INESCAPABLE",
           "INNOVATIVE",
           "BOLD",
           "VISIONARY",
           "CURIOUS",
           "DARING",
           "EXPLORATORY",
           "RESOURCEFUL",
           "FLEXIBLE",
           "COOPERATIVE",
           "UNITED",
           "STRATEGIC",
           "INTELLIGENT",
           "RESEARCH_FOCUSED",
           "COLLABORATIVE",
           "PROGRESSIVE",
           "MILITARISTIC",
           "TECHNOLOGICALLY_ADVANCED",
           "AGGRESSIVE",
           "IMPERIALISTIC",
           "TREASURE_HUNTERS",
           "DEXTEROUS",
           "UNPREDICTABLE",
           "BRUTAL",
           "FLEETING",
           "ADAPTABLE",
           "SELF_SUFFICIENT",
           "DEFENSIVE",
           "PROUD",
           "DIVERSE",
           "INDEPENDENT",
           "SELF_INTERESTED",
           "FRAGMENTED",
           "COMMERCIAL",
           "FREE_MARKETS",
           "ENTREPRENEURIAL"
         ]}
    ]
  end
end
