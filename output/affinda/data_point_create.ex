defmodule DataPointCreate do
  @moduledoc """
  Provides struct and type for a DataPointCreate
  """

  @type t :: %__MODULE__{
          annotationContentType: String.t(),
          description: String.t() | nil,
          extractor: String.t(),
          manualEntry: boolean | nil,
          mappingDataSource: String.t() | nil,
          multiple: boolean | nil,
          name: String.t(),
          noRect: boolean | nil,
          organization: String.t(),
          parent: String.t() | nil,
          slug: String.t()
        }

  defstruct [
    :annotationContentType,
    :description,
    :extractor,
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
      description: {:string, :generic},
      extractor: {:string, :generic},
      manualEntry: :boolean,
      mappingDataSource: {:string, :generic},
      multiple: :boolean,
      name: {:string, :generic},
      noRect: :boolean,
      organization: {:string, :generic},
      parent: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end
