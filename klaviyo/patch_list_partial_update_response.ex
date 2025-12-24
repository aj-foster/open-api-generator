defmodule Klaviyo.PatchListPartialUpdateResponse do
  @moduledoc """
  Provides struct and type for a PatchListPartialUpdateResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchListPartialUpdateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchListPartialUpdateResponseData, :t}]
  end
end
