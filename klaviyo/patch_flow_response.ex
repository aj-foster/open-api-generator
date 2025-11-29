defmodule PatchFlowResponse do
  @moduledoc """
  Provides struct and type for a PatchFlowResponse
  """

  @type t :: %__MODULE__{data: PatchFlowResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchFlowResponseData, :t}]
  end
end
