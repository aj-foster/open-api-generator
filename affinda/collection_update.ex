defmodule CollectionUpdate do
  @moduledoc """
  Provides struct and type for a CollectionUpdate
  """

  @type t :: %__MODULE__{
          allowOpenai: boolean | nil,
          autoValidationThreshold: number | nil,
          dateFormatFromDocument: boolean | nil,
          dateFormatPreference: String.t() | nil,
          disableConfirmationIfValidationRulesFail: boolean | nil,
          extractorConfig: ExtractorConfig.t() | nil,
          fields: [FieldGroup.t()] | nil,
          fieldsLayout: FieldsLayout.t() | nil,
          name: String.t() | nil,
          trainsExtractor: boolean | nil
        }

  defstruct [
    :allowOpenai,
    :autoValidationThreshold,
    :dateFormatFromDocument,
    :dateFormatPreference,
    :disableConfirmationIfValidationRulesFail,
    :extractorConfig,
    :fields,
    :fieldsLayout,
    :name,
    :trainsExtractor
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allowOpenai: :boolean,
      autoValidationThreshold: :number,
      dateFormatFromDocument: :boolean,
      dateFormatPreference: {:enum, ["DMY", "MDY", "YMD"]},
      disableConfirmationIfValidationRulesFail: :boolean,
      extractorConfig: {ExtractorConfig, :t},
      fields: [{FieldGroup, :t}],
      fieldsLayout: {FieldsLayout, :t},
      name: {:string, :generic},
      trainsExtractor: :boolean
    ]
  end
end
