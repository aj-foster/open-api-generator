defmodule EventCreateQueryV2 do
  @moduledoc """
  Provides struct and type for a EventCreateQueryV2
  """

  @type t :: %__MODULE__{data: EventCreateQueryV2ResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {EventCreateQueryV2ResourceObject, :t}]
  end
end
