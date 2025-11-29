defmodule SimplePublicObjectWithAssociations do
  @moduledoc """
  Provides struct and type for a SimplePublicObjectWithAssociations
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          archivedAt: DateTime.t() | nil,
          associations: SimplePublicObjectWithAssociationsAssociations.t() | nil,
          createdAt: DateTime.t(),
          id: String.t(),
          properties: SimplePublicObjectWithAssociationsProperties.t(),
          propertiesWithHistory:
            SimplePublicObjectWithAssociationsPropertiesWithHistory.t() | nil,
          updatedAt: DateTime.t()
        }

  defstruct [
    :archived,
    :archivedAt,
    :associations,
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
      archivedAt: {:string, :date_time},
      associations: {SimplePublicObjectWithAssociationsAssociations, :t},
      createdAt: {:string, :date_time},
      id: {:string, :generic},
      properties: {SimplePublicObjectWithAssociationsProperties, :t},
      propertiesWithHistory: {SimplePublicObjectWithAssociationsPropertiesWithHistory, :t},
      updatedAt: {:string, :date_time}
    ]
  end
end
