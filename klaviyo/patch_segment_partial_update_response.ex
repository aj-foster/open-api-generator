defmodule Klaviyo.PatchSegmentPartialUpdateResponse do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchSegmentPartialUpdateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchSegmentPartialUpdateResponseData, :t}]
  end
end
