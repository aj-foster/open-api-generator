defmodule Klaviyo.PatchProfileResponse do
  @moduledoc """
  Provides struct and type for a PatchProfileResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchProfileResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchProfileResponseData, :t}]
  end
end
