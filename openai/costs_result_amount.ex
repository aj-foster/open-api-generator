defmodule OpenAI.CostsResultAmount do
  @moduledoc """
  Provides struct and type for a CostsResultAmount
  """

  @type t :: %__MODULE__{currency: String.t() | nil, value: number | nil}

  defstruct [:currency, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currency: :string, value: :number]
  end
end
