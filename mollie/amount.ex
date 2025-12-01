defmodule Mollie.Amount do
  @moduledoc """
  Provides struct and type for a Amount
  """

  @type t :: %__MODULE__{currency: String.t(), value: String.t()}

  defstruct [:currency, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currency: :string, value: :string]
  end
end
