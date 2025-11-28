defmodule Message do
  @moduledoc """
  Provides struct and type for a Message
  """

  @type t :: %__MODULE__{data: MessageData.t(), type: String.t()}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {MessageData, :t}, type: {:string, :generic}]
  end
end
