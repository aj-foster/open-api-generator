defmodule DataFieldDataPoint do
  @moduledoc """
  Provides struct and type for a DataFieldDataPoint
  """

  @type t :: %__MODULE__{
          availableDataSources: [MappingDataSource.t()] | nil,
          children: [DataPoint.t()],
          description: String.t(),
          identifier: String.t(),
          manualEntry: boolean | nil,
          multiple: boolean,
          name: String.t(),
          noRect: boolean,
          parent: String.t(),
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
      availableDataSources: [{MappingDataSource, :t}],
      children: [{DataPoint, :t}],
      description: {:string, :generic},
      identifier: {:string, :generic},
      manualEntry: :boolean,
      multiple: :boolean,
      name: {:string, :generic},
      noRect: :boolean,
      parent: {:string, :generic},
      slug: {:string, :generic},
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
