defmodule GitHub.Hook.DeliveryResponse do
  @moduledoc """
  Provides struct and type for a Hook.DeliveryResponse
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, headers: map | nil, payload: String.t() | nil}

  defstruct [:__info__, :headers, :payload]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [headers: {:union, [:map, :null]}, payload: {:union, [{:string, :generic}, :null]}]
  end
end
