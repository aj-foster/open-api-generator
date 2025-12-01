defmodule Klaviyo.FlowSeriesRequestDTO do
  @moduledoc """
  Provides struct and type for a FlowSeriesRequestDTO
  """

  @type t :: %__MODULE__{data: Klaviyo.FlowSeriesRequestDTOResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.FlowSeriesRequestDTOResourceObject, :t}]
  end
end
