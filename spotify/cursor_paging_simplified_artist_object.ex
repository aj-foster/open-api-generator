defmodule CursorPagingSimplifiedArtistObject do
  @moduledoc """
  Provides struct and type for a CursorPagingSimplifiedArtistObject
  """

  @type t :: %__MODULE__{
          cursors: map | nil,
          href: String.t() | nil,
          items: [ArtistObject.t()] | nil,
          limit: integer | nil,
          next: String.t() | nil,
          total: integer | nil
        }

  defstruct [:cursors, :href, :items, :limit, :next, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cursors: :map,
      href: {:string, :generic},
      items: [{ArtistObject, :t}],
      limit: :integer,
      next: {:string, :generic},
      total: :integer
    ]
  end
end
