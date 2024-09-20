defmodule DataPoint do
  @moduledoc """
  Provides struct and type for a DataPoint
  """

  @type t :: %__MODULE__{
          annotationContentType: String.t(),
          availableDataSources: [MappingDataSource.t()] | nil,
          children: [DataPoint.t()] | nil,
          description: String.t() | nil,
          extractor: String.t(),
          identifier: String.t(),
          manualEntry: boolean | nil,
          mappingDataSource: String.t() | nil,
          multiple: boolean | nil,
          name: String.t(),
          noRect: boolean | nil,
          organization: Organization.t(),
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
      availableDataSources: [{MappingDataSource, :t}],
      children: [{DataPoint, :t}],
      description: {:string, :generic},
      extractor: {:string, :generic},
      identifier: {:string, :generic},
      manualEntry: :boolean,
      mappingDataSource: {:string, :generic},
      multiple: :boolean,
      name: {:string, :generic},
      noRect: :boolean,
      organization: {Organization, :t},
      parent: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end
