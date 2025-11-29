defmodule CursorPagingPlayHistoryObject do
  @moduledoc """
  Provides struct and type for a CursorPagingPlayHistoryObject
  """

  @type t :: %__MODULE__{
          cursors: map | nil,
          href: String.t() | nil,
          items: [PlayHistoryObject.t()] | nil,
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
      items: [{PlayHistoryObject, :t}],
      limit: :integer,
      next: {:string, :generic},
      total: :integer
    ]
  end
end
