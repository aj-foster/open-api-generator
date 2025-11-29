defmodule Collection do
  @moduledoc """
  Provides struct and type for a Collection
  """

  @type t :: %__MODULE__{
          allowOpenai: boolean | nil,
          autoValidateIfValidationRulesPass: boolean | nil,
          autoValidationThreshold: number | nil,
          confirmedDocsCount: integer | nil,
          dateFormatFromDocument: boolean | nil,
          dateFormatPreference: String.t() | nil,
          disableConfirmationIfValidationRulesFail: boolean | nil,
          extractor: Extractor.t() | nil,
          extractorConfig: ExtractorConfig.t() | nil,
          fields: [FieldGroup.t()] | nil,
          fieldsConfigured: boolean | nil,
          fieldsLayout: FieldsLayout.t() | nil,
          identifier: String.t(),
          ingestEmail: String.t() | nil,
          name: String.t() | nil,
          tailoredExtractorRequested: boolean | nil,
          trainsExtractor: boolean | nil,
          unvalidatedDocsCount: integer | nil,
          workspace: CollectionWorkspace.t() | nil
        }

  defstruct [
    :allowOpenai,
    :autoValidateIfValidationRulesPass,
    :autoValidationThreshold,
    :confirmedDocsCount,
    :dateFormatFromDocument,
    :dateFormatPreference,
    :disableConfirmationIfValidationRulesFail,
    :extractor,
    :extractorConfig,
    :fields,
    :fieldsConfigured,
    :fieldsLayout,
    :identifier,
    :ingestEmail,
    :name,
    :tailoredExtractorRequested,
    :trainsExtractor,
    :unvalidatedDocsCount,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowOpenai: :boolean,
      autoValidateIfValidationRulesPass: :boolean,
      autoValidationThreshold: :number,
      confirmedDocsCount: :integer,
      dateFormatFromDocument: :boolean,
      dateFormatPreference: {:enum, ["DMY", "MDY", "YMD"]},
      disableConfirmationIfValidationRulesFail: :boolean,
      extractor: {Extractor, :t},
      extractorConfig: {ExtractorConfig, :t},
      fields: [{FieldGroup, :t}],
      fieldsConfigured: :boolean,
      fieldsLayout: {FieldsLayout, :t},
      identifier: {:string, :generic},
      ingestEmail: {:string, :generic},
      name: {:string, :generic},
      tailoredExtractorRequested: :boolean,
      trainsExtractor: :boolean,
      unvalidatedDocsCount: :integer,
      workspace: {CollectionWorkspace, :t}
    ]
  end
end
