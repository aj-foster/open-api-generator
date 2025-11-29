defmodule FieldDeprecated do
  @moduledoc """
  Provides struct and type for a FieldDeprecated
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number | nil,
          dataPoint: String.t(),
          dataSource: String.t() | nil,
          disabled: boolean | nil,
          displayEnumValue: boolean | nil,
          displayRawText: boolean | nil,
          dropNull: boolean | nil,
          fieldType: String.t(),
          fields: [FieldDeprecated.t()] | nil,
          label: String.t(),
          mandatory: boolean | nil,
          mapping: String.t() | nil,
          showDropdown: boolean | nil,
          slug: String.t() | nil
        }

  defstruct [
    :autoValidationThreshold,
    :dataPoint,
    :dataSource,
    :disabled,
    :displayEnumValue,
    :displayRawText,
    :dropNull,
    :fieldType,
    :fields,
    :label,
    :mandatory,
    :mapping,
    :showDropdown,
    :slug
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      autoValidationThreshold: :number,
      dataPoint: {:string, :generic},
      dataSource: {:string, :generic},
      disabled: :boolean,
      displayEnumValue: :boolean,
      displayRawText: :boolean,
      dropNull: :boolean,
      fieldType:
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
      fields: [{FieldDeprecated, :t}],
      label: {:string, :generic},
      mandatory: :boolean,
      mapping: {:string, :generic},
      showDropdown: :boolean,
      slug: {:string, :generic}
    ]
  end
end
