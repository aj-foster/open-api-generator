defmodule OpenAI.CompoundFilter do
  @moduledoc """
  Provides struct and type for a CompoundFilter
  """

  @type t :: %__MODULE__{filters: [map | OpenAI.ComparisonFilter.t()], type: String.t()}

  defstruct [:filters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [filters: [union: [:map, {OpenAI.ComparisonFilter, :t}]], type: {:enum, ["and", "or"]}]
  end
end
