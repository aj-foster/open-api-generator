defmodule SpaceTraders.ContractPayment do
  @moduledoc """
  Provides struct and type for a ContractPayment
  """

  @type t :: %__MODULE__{onAccepted: integer, onFulfilled: integer}

  defstruct [:onAccepted, :onFulfilled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [onAccepted: :integer, onFulfilled: :integer]
  end
end
