defmodule Request do
  @moduledoc """
  Provides struct and type for a Request
  """

  @type t :: %__MODULE__{data: RequestData.t(), type: String.t()}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {RequestData, :t}, type: {:string, :generic}]
  end
end
