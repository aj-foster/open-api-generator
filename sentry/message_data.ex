defmodule MessageData do
  @moduledoc """
  Provides struct and type for a MessageData
  """

  @type t :: %__MODULE__{formatted: String.t()}

  defstruct [:formatted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [formatted: {:string, :generic}]
  end
end
