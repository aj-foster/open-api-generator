defmodule PostFlowSeriesResponseDTODataAttributes do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTODataAttributes
  """

  @type t :: %__MODULE__{date_times: [DateTime.t()], results: [SeriesData.t()]}

  defstruct [:date_times, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date_times: [string: :date_time], results: [{SeriesData, :t}]]
  end
end
