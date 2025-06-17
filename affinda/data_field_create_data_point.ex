defmodule DataFieldCreateDataPoint do
  @moduledoc """
  Provides struct and type for a DataFieldCreateDataPoint
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          manualEntry: boolean | nil,
          mappingDataSource: String.t() | nil,
          multiple: boolean | nil,
          name: String.t(),
          noRect: boolean | nil,
          parent: String.t() | nil,
          slug: String.t(),
          type: String.t()
        }

  defstruct [
    :description,
    :manualEntry,
    :mappingDataSource,
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
      description: {:string, :generic},
      manualEntry: :boolean,
      mappingDataSource: {:string, :generic},
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
