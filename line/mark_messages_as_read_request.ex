defmodule Line.MarkMessagesAsReadRequest do
  @moduledoc """
  Provides struct and type for a MarkMessagesAsReadRequest
  """

  @type t :: %__MODULE__{chat: Line.ChatReference.t()}

  defstruct [:chat]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [chat: {Line.ChatReference, :t}]
  end
end
