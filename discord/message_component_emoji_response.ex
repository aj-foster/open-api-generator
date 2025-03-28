defmodule MessageComponentEmojiResponse do
  @moduledoc """
  Provides struct and type for a MessageComponentEmojiResponse
  """

  @type t :: %__MODULE__{animated: boolean | nil, id: String.t() | nil, name: String.t()}

  defstruct [:animated, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      animated: {:union, [:boolean, :null]},
      id: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic}
    ]
  end
end
