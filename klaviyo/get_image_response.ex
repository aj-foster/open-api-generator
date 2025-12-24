defmodule Klaviyo.GetImageResponse do
  @moduledoc """
  Provides struct and type for a GetImageResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.ImageResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.ImageResponseObjectResource, :t}]
  end
end
