defmodule FacetCountsCounts do
  @moduledoc """
  Provides struct and type for a FacetCountsCounts
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          highlighted: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:count, :highlighted, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, highlighted: {:string, :generic}, value: {:string, :generic}]
  end
end
