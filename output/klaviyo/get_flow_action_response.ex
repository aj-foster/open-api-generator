defmodule GetFlowActionResponse do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponse
  """

  @type t :: %__MODULE__{data: GetFlowActionResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetFlowActionResponseData, :t}]
  end
end
