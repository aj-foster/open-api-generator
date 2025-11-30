defmodule Klaviyo.TagSegmentOp do
  @moduledoc """
  Provides struct and type for a TagSegmentOp
  """

  @type t :: %__MODULE__{data: [Klaviyo.TagSegmentOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.TagSegmentOpData, :t}]]
  end
end
