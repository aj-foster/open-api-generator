defmodule Klaviyo.TagFlowOp do
  @moduledoc """
  Provides struct and type for a TagFlowOp
  """

  @type t :: %__MODULE__{data: [Klaviyo.TagFlowOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.TagFlowOpData, :t}]]
  end
end
