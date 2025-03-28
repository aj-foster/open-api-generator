defmodule FlowValuesRequestDTO do
  @moduledoc """
  Provides struct and type for a FlowValuesRequestDTO
  """

  @type t :: %__MODULE__{data: FlowValuesRequestDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {FlowValuesRequestDTOResourceObject, :t}]
  end
end
