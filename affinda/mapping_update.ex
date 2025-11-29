defmodule MappingUpdate do
  @moduledoc """
  Provides struct and type for a MappingUpdate
  """

  @type t :: %__MODULE__{orderBy: String.t() | nil, scoreCutoff: number | nil}

  defstruct [:orderBy, :scoreCutoff]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [orderBy: {:string, :generic}, scoreCutoff: :number]
  end
end
