defmodule Affinda.Field do
  @moduledoc """
  Provides struct and type for a Field
  """

  @type t :: %__MODULE__{
          autoValidationThreshold: number | nil,
          dataPoint: String.t(),
          dataSource: String.t() | nil,
          disabledChildFields: [Affinda.Field.t()] | nil,
          displayEnumValue: boolean | nil,
          displayRawText: boolean | nil,
          dropNull: boolean | nil,
          enabledChildFields: [Affinda.Field.t()] | nil,
          fieldType: String.t(),
          fields: [map] | nil,
          hideEnumDetail: boolean | nil,
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
    :disabledChildFields,
    :displayEnumValue,
    :displayRawText,
    :dropNull,
    :enabledChildFields,
    :fieldType,
    :fields,
    :hideEnumDetail,
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
      dataPoint: :string,
      dataSource: :string,
      disabledChildFields: [{Affinda.Field, :t}],
      displayEnumValue: :boolean,
      displayRawText: :boolean,
      dropNull: :boolean,
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
      fields: [:map],
      hideEnumDetail: :boolean,
      label: :string,
      mandatory: :boolean,
      mapping: :string,
      showDropdown: :boolean,
      slug: :string
    ]
  end
end
