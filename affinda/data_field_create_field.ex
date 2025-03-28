defmodule DataFieldCreateField do
  @moduledoc """
  Provides struct and type for a DataFieldCreateField
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number | nil,
          dataSource: String.t() | nil,
          displayEnumValue: boolean | nil,
          displayRawText: boolean | nil,
          fieldType: String.t() | nil,
          label: String.t(),
          mandatory: boolean | nil,
          mapping: String.t() | nil,
          showDropdown: boolean | nil
        }

  defstruct [
    :autoValidationThreshold,
    :dataSource,
    :displayEnumValue,
    :displayRawText,
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
      displayEnumValue: :boolean,
      displayRawText: :boolean,
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
