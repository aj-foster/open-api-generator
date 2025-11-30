defmodule Affinda.CollectionUpdate do
  @moduledoc """
  Provides struct and type for a CollectionUpdate
  """

  @type t :: %__MODULE__{
          allowOpenai: boolean | nil,
          autoValidationThreshold: number | nil,
          dateFormatFromDocument: boolean | nil,
          dateFormatPreference: String.t() | nil,
          disableConfirmationIfValidationRulesFail: boolean | nil,
          extractorConfig: Affinda.ExtractorConfig.t() | nil,
          fields: [Affinda.FieldGroup.t()] | nil,
          fieldsLayout: Affinda.FieldsLayout.t() | nil,
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
      extractorConfig: {Affinda.ExtractorConfig, :t},
      fields: [{Affinda.FieldGroup, :t}],
      fieldsLayout: {Affinda.FieldsLayout, :t},
      name: :string,
      trainsExtractor: :boolean
    ]
  end
end
