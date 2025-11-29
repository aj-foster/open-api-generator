defmodule ReplyMessageRequest do
  @moduledoc """
  Provides struct and type for a ReplyMessageRequest
  """

  @type t :: %__MODULE__{
          messages: [Message.t()],
          notificationDisabled: boolean | nil,
          replyToken: String.t()
        }

  defstruct [:messages, :notificationDisabled, :replyToken]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [messages: [{Message, :t}], notificationDisabled: :boolean, replyToken: {:string, :generic}]
  end
end
