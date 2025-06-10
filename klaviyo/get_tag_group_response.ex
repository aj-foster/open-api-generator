defmodule GetTagGroupResponse do
  @moduledoc """
  Provides struct and type for a GetTagGroupResponse
  """

  @type t :: %__MODULE__{data: GetTagGroupResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetTagGroupResponseData, :t}]
  end
end
