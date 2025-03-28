defmodule FlowSeriesRequestDTO do
  @moduledoc """
  Provides struct and type for a FlowSeriesRequestDTO
  """

  @type t :: %__MODULE__{data: FlowSeriesRequestDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {FlowSeriesRequestDTOResourceObject, :t}]
  end
end
