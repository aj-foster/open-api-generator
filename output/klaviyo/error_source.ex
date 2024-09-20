defmodule ErrorSource do
  @moduledoc """
  Provides struct and type for a ErrorSource
  """

  @type t :: %__MODULE__{pointer: String.t()}

  defstruct [:pointer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [pointer: {:string, :generic}]
  end
end
