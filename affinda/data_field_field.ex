defmodule Affinda.DataFieldField do
  @moduledoc """
  Provides struct and type for a DataFieldField
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number | nil,
          dataSource: String.t() | nil,
          disabledChildFields: [Affinda.Field.t()],
          displayEnumValue: boolean,
          displayRawText: boolean | nil,
          enabledChildFields: [Affinda.Field.t()],
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
      dataSource: :string,
      disabledChildFields: [{Affinda.Field, :t}],
      displayEnumValue: :boolean,
      displayRawText: :boolean,
      enabledChildFields: [{Affinda.Field, :t}],
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
      label: :string,
      mandatory: :boolean,
      mapping: :string,
      showDropdown: :boolean
    ]
  end
end
