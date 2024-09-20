defmodule PagedCategoriesCategories do
  @moduledoc """
  Provides struct and type for a PagedCategoriesCategories
  """

  @type json_resp :: %__MODULE__{
          href: String.t() | nil,
          items: [CategoryObject.t()] | nil,
          limit: integer | nil,
          next: String.t() | nil,
          offset: integer | nil,
          previous: String.t() | nil,
          total: integer | nil
        }

  defstruct [:href, :items, :limit, :next, :offset, :previous, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      href: {:string, :generic},
      items: [{CategoryObject, :t}],
      limit: :integer,
      next: {:string, :generic},
      offset: :integer,
      previous: {:string, :generic},
      total: :integer
    ]
  end
end
