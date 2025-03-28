defmodule DataFieldField do
  @moduledoc """
  Provides struct and type for a DataFieldField
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number,
          dataSource: String.t() | nil,
          disabledChildFields: [Field.t()],
          displayEnumValue: boolean,
          displayRawText: boolean | nil,
          enabledChildFields: [Field.t()],
          fieldType: String.t() | nil,
          label: String.t(),
          mandatory: boolean,
          mapping: String.t() | nil,
          showDropdown: boolean | nil
        }

  defstruct [
    :autoValidationThreshold,
    :dataSource,
    :disabledChildFields,
    :displayEnumValue,
    :displayRawText,
    :enabledChildFields,
    :fieldType,
    :label,
    :mandatory,
    :mapping,
    :showDropdown
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      autoValidationThreshold: :number,
      dataSource: {:string, :generic},
      disabledChildFields: [{Field, :t}],
      displayEnumValue: :boolean,
      displayRawText: :boolean,
      enabledChildFields: [{Field, :t}],
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
      label: {:string, :generic},
      mandatory: :boolean,
      mapping: {:string, :generic},
      showDropdown: :boolean
    ]
  end
end
