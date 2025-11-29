defmodule SearchOverrideRule do
  @moduledoc """
  Provides struct and type for a SearchOverrideRule
  """

  @type t :: %__MODULE__{match: String.t(), query: String.t()}

  defstruct [:match, :query]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [match: {:enum, ["exact", "contains"]}, query: {:string, :generic}]
  end
end
