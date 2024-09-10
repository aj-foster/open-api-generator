defmodule HashMetadata do
  @moduledoc """
  Provides struct and types for a HashMetadata
  """

  @type t :: %__MODULE__{title: String.t(), type: String.t(), value: String.t()}

  defstruct [:title, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [title: {:string, :generic}, type: {:string, :generic}, value: {:string, :generic}]
  end
end
