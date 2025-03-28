defmodule WebSearchUserLocation do
  @moduledoc """
  Provides struct and type for a WebSearchUserLocation
  """

  @type t :: %__MODULE__{approximate: WebSearchLocation.t(), type: String.t()}

  defstruct [:approximate, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [approximate: {WebSearchLocation, :t}, type: {:const, "approximate"}]
  end
end
