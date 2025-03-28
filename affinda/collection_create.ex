defmodule CollectionCreate do
  @moduledoc """
  Provides struct and type for a CollectionCreate
  """

  @type t :: %__MODULE__{
          allowOpenai: boolean | nil,
          autoValidationThreshold: number | nil,
          baseExtractor: String.t() | nil,
          dateFormatFromDocument: boolean | nil,
          dateFormatPreference: String.t() | nil,
          disableConfirmationIfValidationRulesFail: boolean | nil,
          extractor: String.t() | nil,
          extractorConfig: ExtractorConfig.t() | nil,
          fields: [FieldGroup.t()] | nil,
          fieldsLayout: FieldsLayout.t() | nil,
          name: String.t(),
          trainsExtractor: boolean | nil,
          workspace: String.t()
        }

  defstruct [
    :allowOpenai,
    :autoValidationThreshold,
    :baseExtractor,
    :dateFormatFromDocument,
    :dateFormatPreference,
    :disableConfirmationIfValidationRulesFail,
    :extractor,
    :extractorConfig,
    :fields,
    :fieldsLayout,
    :name,
    :trainsExtractor,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowOpenai: :boolean,
      autoValidationThreshold: :number,
      baseExtractor: {:string, :generic},
      dateFormatFromDocument: :boolean,
      dateFormatPreference: {:enum, ["DMY", "MDY", "YMD"]},
      disableConfirmationIfValidationRulesFail: :boolean,
      extractor: {:string, :generic},
      extractorConfig: {ExtractorConfig, :t},
      fields: [{FieldGroup, :t}],
      fieldsLayout: {FieldsLayout, :t},
      name: {:string, :generic},
      trainsExtractor: :boolean,
      workspace: {:string, :generic}
    ]
  end
end
