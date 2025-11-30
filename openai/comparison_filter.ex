defmodule OpenAI.ComparisonFilter do
  @moduledoc """
  Provides struct and type for a ComparisonFilter
  """

  @type t :: %__MODULE__{key: String.t(), type: String.t(), value: boolean | number | String.t()}

  defstruct [:key, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      key: :string,
      type: {:enum, ["eq", "ne", "gt", "gte", "lt", "lte"]},
      value: {:union, [:boolean, :number, :string]}
    ]
  end
end
