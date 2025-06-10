defmodule CollectionAlias do
  @moduledoc """
  Provides struct and type for a CollectionAlias
  """

  @type t :: %__MODULE__{collection_name: String.t(), name: String.t()}

  defstruct [:collection_name, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [collection_name: {:string, :generic}, name: {:string, :generic}]
  end
end
