defmodule Spotify.CursorPagingPlayHistoryObject do
  @moduledoc """
  Provides struct and type for a CursorPagingPlayHistoryObject
  """

  @type t :: %__MODULE__{
          cursors: map | nil,
          href: String.t() | nil,
          items: [Spotify.PlayHistoryObject.t()] | nil,
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
      href: :string,
      items: [{Spotify.PlayHistoryObject, :t}],
      limit: :integer,
      next: :string,
      total: :integer
    ]
  end
end
