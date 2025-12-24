defmodule Klaviyo.PatchImageResponse do
  @moduledoc """
  Provides struct and type for a PatchImageResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchImageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchImageResponseData, :t}]
  end
end
