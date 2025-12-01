defmodule SpaceTraders.Contract do
  @moduledoc """
  Provides struct and type for a Contract
  """

  @type t :: %__MODULE__{
          accepted: boolean,
          deadlineToAccept: DateTime.t() | nil,
          expiration: DateTime.t(),
          factionSymbol: String.t(),
          fulfilled: boolean,
          id: String.t(),
          terms: SpaceTraders.ContractTerms.t(),
          type: String.t()
        }

  defstruct [
    :accepted,
    :deadlineToAccept,
    :expiration,
    :factionSymbol,
    :fulfilled,
    :id,
    :terms,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepted: :boolean,
      deadlineToAccept: {:string, "date-time"},
      expiration: {:string, "date-time"},
      factionSymbol: :string,
      fulfilled: :boolean,
      id: :string,
      terms: {SpaceTraders.ContractTerms, :t},
      type: {:enum, ["PROCUREMENT", "TRANSPORT", "SHUTTLE"]}
    ]
  end
end
