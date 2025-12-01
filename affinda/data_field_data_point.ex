defmodule Affinda.DataFieldDataPoint do
  @moduledoc """
  Provides struct and type for a DataFieldDataPoint
  """

  @type t :: %__MODULE__{
          availableDataSources: [Affinda.MappingDataSource.t()] | nil,
          children: [Affinda.DataPoint.t()],
          description: String.t() | nil,
          identifier: String.t(),
          manualEntry: boolean | nil,
          multiple: boolean,
          name: String.t(),
          noRect: boolean,
          parent: String.t() | nil,
          slug: String.t(),
          type: String.t()
        }

  defstruct [
    :availableDataSources,
    :children,
    :description,
    :identifier,
    :manualEntry,
    :multiple,
    :name,
    :noRect,
    :parent,
    :slug,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      availableDataSources: [{Affinda.MappingDataSource, :t}],
      children: [{Affinda.DataPoint, :t}],
      description: :string,
      identifier: :string,
      manualEntry: :boolean,
      multiple: :boolean,
      name: :string,
      noRect: :boolean,
      parent: :string,
      slug: :string,
      type:
        {:enum,
         [
           "text",
           "integer",
           "float",
           "decimal",
           "date",
           "datetime",
           "daterange",
           "boolean",
           "enum",
           "location",
           "phonenumber",
           "json",
           "table",
           "expectedremuneration",
           "jobtitle",
           "language",
           "skill",
           "yearsexperience",
           "group",
           "table_deprecated",
           "url",
           "image"
         ]}
    ]
  end
end
