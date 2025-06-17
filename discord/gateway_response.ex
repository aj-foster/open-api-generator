defmodule GatewayResponse do
  @moduledoc """
  Provides struct and type for a GatewayResponse
  """

  @type t :: %__MODULE__{url: String.t()}

  defstruct [:url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [url: {:string, :uri}]
  end
end
