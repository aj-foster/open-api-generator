defmodule HashErrorsData do
  @moduledoc """
  Provides struct and type for a HashErrorsData
  """

  @type t :: %__MODULE__{column: integer | nil, row: integer | nil, source: String.t() | nil}

  defstruct [:column, :row, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [column: :integer, row: :integer, source: {:string, :generic}]
  end
end
