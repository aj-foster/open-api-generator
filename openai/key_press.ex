defmodule OpenAI.KeyPress do
  @moduledoc """
  Provides struct and type for a KeyPress
  """

  @type t :: %__MODULE__{keys: [String.t()], type: String.t()}

  defstruct [:keys, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [keys: [:string], type: {:const, "keypress"}]
  end
end
