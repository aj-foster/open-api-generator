defmodule TagCreate do
  @moduledoc """
  Provides struct and type for a TagCreate
  """

  @type t :: %__MODULE__{name: String.t(), workspace: String.t()}

  defstruct [:name, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, workspace: {:string, :generic}]
  end
end
