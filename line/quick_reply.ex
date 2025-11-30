defmodule Line.QuickReply do
  @moduledoc """
  Provides struct and type for a QuickReply
  """

  @type t :: %__MODULE__{items: [Line.QuickReplyItem.t()] | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{Line.QuickReplyItem, :t}]]
  end
end
