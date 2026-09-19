defmodule Line.BroadcastRequest do
  @moduledoc """
  Provides struct and type for a BroadcastRequest
  """

  @type t :: %__MODULE__{messages: [Line.Message.t()], notificationDisabled: boolean | nil}

  defstruct [:messages, :notificationDisabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [messages: [{Line.Message, :t}], notificationDisabled: :boolean]
  end
end
