defmodule CursorPagedArtists do
  @moduledoc """
  Provides struct and type for a CursorPagedArtists
  """

  @type json_resp :: %__MODULE__{artists: CursorPagingSimplifiedArtistObject.t()}

  defstruct [:artists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [artists: {CursorPagingSimplifiedArtistObject, :t}]
  end
end
