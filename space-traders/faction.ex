defmodule SpaceTraders.Faction do
  @moduledoc """
  Provides struct and type for a Faction
  """

  @type t :: %__MODULE__{
          description: String.t(),
          headquarters: String.t() | nil,
          isRecruiting: boolean,
          name: String.t(),
          symbol: String.t(),
          traits: [SpaceTraders.FactionTrait.t()]
        }

  defstruct [:description, :headquarters, :isRecruiting, :name, :symbol, :traits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      headquarters: :string,
      isRecruiting: :boolean,
      name: :string,
      symbol:
        {:enum,
         [
           "COSMIC",
           "VOID",
           "GALACTIC",
           "QUANTUM",
           "DOMINION",
           "ASTRO",
           "CORSAIRS",
           "OBSIDIAN",
           "AEGIS",
           "UNITED",
           "SOLITARY",
           "COBALT",
           "OMEGA",
           "ECHO",
           "LORDS",
           "CULT",
           "ANCIENTS",
           "SHADOW",
           "ETHEREAL"
         ]},
      traits: [{SpaceTraders.FactionTrait, :t}]
    ]
  end
end
