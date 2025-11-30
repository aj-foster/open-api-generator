defmodule Affinda.Collection do
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
          extractor: Affinda.Extractor.t() | nil,
          extractorConfig: Affinda.ExtractorConfig.t() | nil,
          fields: [Affinda.FieldGroup.t()] | nil,
          fieldsConfigured: boolean | nil,
          fieldsLayout: Affinda.FieldsLayout.t() | nil,
          identifier: String.t(),
          ingestEmail: String.t() | nil,
          name: String.t() | nil,
          tailoredExtractorRequested: boolean | nil,
          trainsExtractor: boolean | nil,
          unvalidatedDocsCount: integer | nil,
          workspace: Affinda.CollectionWorkspace.t() | nil
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
      extractor: {Affinda.Extractor, :t},
      extractorConfig: {Affinda.ExtractorConfig, :t},
      fields: [{Affinda.FieldGroup, :t}],
      fieldsConfigured: :boolean,
      fieldsLayout: {Affinda.FieldsLayout, :t},
      identifier: :string,
      ingestEmail: :string,
      name: :string,
      tailoredExtractorRequested: :boolean,
      trainsExtractor: :boolean,
      unvalidatedDocsCount: :integer,
      workspace: {Affinda.CollectionWorkspace, :t}
    ]
  end
end
