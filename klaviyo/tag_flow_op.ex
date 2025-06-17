defmodule TagFlowOp do
  @moduledoc """
  Provides struct and type for a TagFlowOp
  """

  @type t :: %__MODULE__{data: [TagFlowOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{TagFlowOpData, :t}]]
  end
end
