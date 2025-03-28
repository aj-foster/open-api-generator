defmodule Message do
  @moduledoc """
  Provides struct and type for a Message
  """

  @type t :: %__MODULE__{
          quickReply: QuickReply.t() | nil,
          sender: Sender.t() | nil,
          type: String.t()
        }

  defstruct [:quickReply, :sender, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [quickReply: {QuickReply, :t}, sender: {Sender, :t}, type: {:string, :generic}]
  end
end
