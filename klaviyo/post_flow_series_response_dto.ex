defmodule PostFlowSeriesResponseDTO do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTO
  """

  @type t :: %__MODULE__{data: PostFlowSeriesResponseDTOData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostFlowSeriesResponseDTOData, :t}]
  end
end
