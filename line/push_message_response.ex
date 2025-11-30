defmodule Line.PushMessageResponse do
  @moduledoc """
  Provides struct and type for a PushMessageResponse
  """

  @type t :: %__MODULE__{sentMessages: [Line.SentMessage.t()]}

  defstruct [:sentMessages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sentMessages: [{Line.SentMessage, :t}]]
  end
end
