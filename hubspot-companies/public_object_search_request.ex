defmodule PublicObjectSearchRequest do
  @moduledoc """
  Provides struct and type for a PublicObjectSearchRequest
  """

  @type t :: %__MODULE__{
          after: String.t(),
          filterGroups: [FilterGroup.t()],
          limit: integer,
          properties: [String.t()],
          query: String.t() | nil,
          sorts: [String.t()]
        }

  defstruct [:after, :filterGroups, :limit, :properties, :query, :sorts]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      after: {:string, :generic},
      filterGroups: [{FilterGroup, :t}],
      limit: :integer,
      properties: [string: :generic],
      query: {:string, :generic},
      sorts: [string: :generic]
    ]
  end
end
