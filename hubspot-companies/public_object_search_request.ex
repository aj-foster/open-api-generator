defmodule HubSpot.Companies.PublicObjectSearchRequest do
  @moduledoc """
  Provides struct and type for a PublicObjectSearchRequest
  """

  @type t :: %__MODULE__{
          after: String.t(),
          filterGroups: [HubSpot.Companies.FilterGroup.t()],
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
      after: :string,
      filterGroups: [{HubSpot.Companies.FilterGroup, :t}],
      limit: {:integer, "int32"},
      properties: [:string],
      query: :string,
      sorts: [:string]
    ]
  end
end
