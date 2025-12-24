defmodule SpaceTraders.ContractTerms do
  @moduledoc """
  Provides struct and type for a ContractTerms
  """

  @type t :: %__MODULE__{
          deadline: DateTime.t(),
          deliver: [SpaceTraders.ContractDeliverGood.t()] | nil,
          payment: SpaceTraders.ContractPayment.t()
        }

  defstruct [:deadline, :deliver, :payment]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      deadline: {:string, "date-time"},
      deliver: [{SpaceTraders.ContractDeliverGood, :t}],
      payment: {SpaceTraders.ContractPayment, :t}
    ]
  end
end
