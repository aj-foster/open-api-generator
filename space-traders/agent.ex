defmodule SpaceTraders.Agent do
  @moduledoc """
  Provides struct and type for a Agent
  """

  @type t :: %__MODULE__{
          accountId: String.t() | nil,
          credits: integer,
          headquarters: String.t(),
          shipCount: integer,
          startingFaction: String.t(),
          symbol: String.t()
        }

  defstruct [:accountId, :credits, :headquarters, :shipCount, :startingFaction, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountId: :string,
      credits: {:integer, "int64"},
      headquarters: :string,
      shipCount: :integer,
      startingFaction: :string,
      symbol: :string
    ]
  end
end
