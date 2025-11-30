defmodule Klaviyo.PostFlowSeriesResponseDTODataAttributes do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTODataAttributes
  """

  @type t :: %__MODULE__{date_times: [DateTime.t()], results: [Klaviyo.SeriesData.t()]}

  defstruct [:date_times, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [date_times: [string: "date-time"], results: [{Klaviyo.SeriesData, :t}]]
  end
end
