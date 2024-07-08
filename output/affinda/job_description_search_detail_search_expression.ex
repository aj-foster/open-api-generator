defmodule JobDescriptionSearchDetailSearchExpression do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailSearchExpression
  """

  @type t :: %__MODULE__{missing: [String.t()] | nil, value: [String.t()] | nil}

  defstruct [:missing, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [missing: [string: :generic], value: [string: :generic]]
  end
end
