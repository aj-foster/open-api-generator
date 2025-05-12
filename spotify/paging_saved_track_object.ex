defmodule PagingSavedTrackObject do
  @moduledoc """
  Provides struct and type for a PagingSavedTrackObject
  """

  @type t :: %__MODULE__{
          href: String.t() | nil,
          items: [SavedTrackObject.t()] | nil,
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
      href: {:string, :generic},
      items: [{SavedTrackObject, :t}],
      limit: :integer,
      next: {:string, :generic},
      offset: :integer,
      previous: {:string, :generic},
      total: :integer
    ]
  end
end
