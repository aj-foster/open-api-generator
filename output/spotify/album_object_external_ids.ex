defmodule AlbumObjectExternalIds do
  @moduledoc """
  Provides struct and type for a AlbumObjectExternalIds
  """

  @type t :: %__MODULE__{ean: String.t() | nil, isrc: String.t() | nil, upc: String.t() | nil}

  defstruct [:ean, :isrc, :upc]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ean: {:string, :generic}, isrc: {:string, :generic}, upc: {:string, :generic}]
  end
end
