defmodule SpaceTraders.Cooldown do
  @moduledoc """
  Provides struct and type for a Cooldown
  """

  @type t :: %__MODULE__{
          expiration: DateTime.t() | nil,
          remainingSeconds: integer,
          shipSymbol: String.t(),
          totalSeconds: integer
        }

  defstruct [:expiration, :remainingSeconds, :shipSymbol, :totalSeconds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expiration: {:string, "date-time"},
      remainingSeconds: :integer,
      shipSymbol: :string,
      totalSeconds: :integer
    ]
  end
end
