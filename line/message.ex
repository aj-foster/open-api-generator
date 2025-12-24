defmodule Line.Message do
  @moduledoc """
  Provides struct and type for a Message
  """

  @type t :: %__MODULE__{
          quickReply: Line.QuickReply.t() | nil,
          sender: Line.Sender.t() | nil,
          type: String.t()
        }

  defstruct [:quickReply, :sender, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [quickReply: {Line.QuickReply, :t}, sender: {Line.Sender, :t}, type: :string]
  end
end
