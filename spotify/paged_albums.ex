defmodule PagedAlbums do
  @moduledoc """
  Provides struct and type for a PagedAlbums
  """

  @type json_resp :: %__MODULE__{albums: PagingSimplifiedAlbumObject.t()}

  defstruct [:albums]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [albums: {PagingSimplifiedAlbumObject, :t}]
  end
end
