defmodule Line.Filter do
  @moduledoc """
  Provides struct and type for a Filter
  """

  @type t :: %__MODULE__{demographic: Line.DemographicFilter.t() | nil}

  defstruct [:demographic]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [demographic: {Line.DemographicFilter, :t}]
  end
end
