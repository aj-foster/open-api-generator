defmodule Spotify.PagingArtistObject do
  @moduledoc """
  Provides struct and type for a PagingArtistObject
  """

  @type t :: %__MODULE__{
          href: String.t() | nil,
          items: [Spotify.ArtistObject.t()] | nil,
          limit: integer | nil,
          next: String.t() | nil,
          offset: integer | nil,
          previous: String.t() | nil,
          total: integer | nil
        }

  defstruct [:href, :items, :limit, :next, :offset, :previous, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      href: :string,
      items: [{Spotify.ArtistObject, :t}],
      limit: :integer,
      next: :string,
      offset: :integer,
      previous: :string,
      total: :integer
    ]
  end
end
