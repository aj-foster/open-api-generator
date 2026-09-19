defmodule Klaviyo.GetTagGroupResponse do
  @moduledoc """
  Provides struct and type for a GetTagGroupResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetTagGroupResponseData, :t}]
  end
end
