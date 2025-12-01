defmodule Klaviyo.GetFlowResponse do
  @moduledoc """
  Provides struct and type for a GetFlowResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetFlowResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetFlowResponseData, :t}]
  end
end
