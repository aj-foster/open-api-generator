defmodule SpaceTraders.Survey do
  @moduledoc """
  Provides struct and type for a Survey
  """

  @type t :: %__MODULE__{
          deposits: [SpaceTraders.SurveyDeposit.t()],
          expiration: DateTime.t(),
          signature: String.t(),
          size: String.t(),
          symbol: String.t()
        }

  defstruct [:deposits, :expiration, :signature, :size, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      deposits: [{SpaceTraders.SurveyDeposit, :t}],
      expiration: {:string, "date-time"},
      signature: :string,
      size: {:enum, ["SMALL", "MODERATE", "LARGE"]},
      symbol: :string
    ]
  end
end
