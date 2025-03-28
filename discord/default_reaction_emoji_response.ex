defmodule DefaultReactionEmojiResponse do
  @moduledoc """
  Provides struct and type for a DefaultReactionEmojiResponse
  """

  @type t :: %__MODULE__{emoji_id: String.t() | nil, emoji_name: String.t() | nil}

  defstruct [:emoji_id, :emoji_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      emoji_id: {:union, [{:string, :generic}, :null]},
      emoji_name: {:union, [{:string, :generic}, :null]}
    ]
  end
end
