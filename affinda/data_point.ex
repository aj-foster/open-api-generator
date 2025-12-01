defmodule Affinda.DataPoint do
  @moduledoc """
  Provides struct and type for a DataPoint
  """

  @type t :: %__MODULE__{
          annotationContentType: String.t(),
          availableDataSources: [Affinda.MappingDataSource.t()] | nil,
          children: [Affinda.DataPoint.t()] | nil,
          description: String.t() | nil,
          extractor: String.t(),
          identifier: String.t(),
          manualEntry: boolean | nil,
          mappingDataSource: String.t() | nil,
          multiple: boolean | nil,
          name: String.t(),
          noRect: boolean | nil,
          organization: Affinda.Organization.t(),
          parent: String.t() | nil,
          slug: String.t()
        }

  defstruct [
    :annotationContentType,
    :availableDataSources,
    :children,
    :description,
    :extractor,
    :identifier,
    :manualEntry,
    :mappingDataSource,
    :multiple,
    :name,
    :noRect,
    :organization,
    :parent,
    :slug
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotationContentType:
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
         ]},
      availableDataSources: [{Affinda.MappingDataSource, :t}],
      children: [{Affinda.DataPoint, :t}],
      description: :string,
      extractor: :string,
      identifier: :string,
      manualEntry: :boolean,
      mappingDataSource: :string,
      multiple: :boolean,
      name: :string,
      noRect: :boolean,
      organization: {Affinda.Organization, :t},
      parent: :string,
      slug: :string
    ]
  end
end
