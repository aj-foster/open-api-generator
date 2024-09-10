defmodule ValidateMessageRequest do
  @moduledoc """
  Provides struct and type for a ValidateMessageRequest
  """

  @type t :: %__MODULE__{messages: [Message.t()]}

  defstruct [:messages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [messages: [{Message, :t}]]
  end
end
