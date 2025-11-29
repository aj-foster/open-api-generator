defmodule SimplePublicObject do
  @moduledoc """
  Provides struct and type for a SimplePublicObject
  """

  @type t :: %__MODULE__{
          archived: boolean | nil,
          archivedAt: DateTime.t() | nil,
          createdAt: DateTime.t(),
          id: String.t(),
          properties: SimplePublicObjectProperties.t(),
          propertiesWithHistory: SimplePublicObjectPropertiesWithHistory.t() | nil,
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
      archivedAt: {:string, :date_time},
      createdAt: {:string, :date_time},
      id: {:string, :generic},
      properties: {SimplePublicObjectProperties, :t},
      propertiesWithHistory: {SimplePublicObjectPropertiesWithHistory, :t},
      updatedAt: {:string, :date_time}
    ]
  end
end
