defmodule UsageByWorkspace do
  @moduledoc """
  Provides struct and type for a UsageByWorkspace
  """

  @type t :: %__MODULE__{count: integer, month: String.t()}

  defstruct [:count, :month]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [count: :integer, month: {:string, :generic}]
  end
end
