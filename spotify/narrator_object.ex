defmodule NarratorObject do
  @moduledoc """
  Provides struct and type for a NarratorObject
  """

  @type t :: %__MODULE__{name: String.t() | nil}

  defstruct [:name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}]
  end
end
