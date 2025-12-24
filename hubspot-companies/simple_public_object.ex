defmodule HubSpot.Companies.SimplePublicObject do
  @moduledoc """
  Provides struct and type for a SimplePublicObject
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          archivedAt: DateTime.t() | nil,
          createdAt: DateTime.t(),
          id: String.t(),
          properties: map,
          propertiesWithHistory: map | nil,
          updatedAt: DateTime.t()
        }

  defstruct [
    :archived,
    :archivedAt,
    :createdAt,
    :id,
    :properties,
    :propertiesWithHistory,
    :updatedAt
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archived: :boolean,
      archivedAt: {:string, "date-time"},
      createdAt: {:string, "date-time"},
      id: :string,
      properties: :map,
      propertiesWithHistory: :map,
      updatedAt: {:string, "date-time"}
    ]
  end
end
