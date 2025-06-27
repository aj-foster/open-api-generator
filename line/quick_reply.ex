defmodule QuickReply do
  @moduledoc """
  Provides struct and type for a QuickReply
  """

  @type t :: %__MODULE__{items: [QuickReplyItem.t()] | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{QuickReplyItem, :t}]]
  end
end
