defmodule Extractor do
  @moduledoc """
  Provides struct and type for a Extractor
  """

  @type t :: %__MODULE__{
          baseExtractor: ExtractorBaseExtractor.t() | nil,
          category: String.t() | nil,
          createdDt: DateTime.t() | nil,
          fieldGroups: [FieldGroup.t()] | nil,
          identifier: String.t(),
          isCustom: boolean | nil,
          lastTrainedDt: DateTime.t() | nil,
          name: String.t(),
          namePlural: String.t(),
          organization: Organization.t() | nil,
          validatable: boolean
        }

  defstruct [
    :baseExtractor,
    :category,
    :createdDt,
    :fieldGroups,
    :identifier,
    :isCustom,
    :lastTrainedDt,
    :name,
    :namePlural,
    :organization,
    :validatable
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      baseExtractor: {ExtractorBaseExtractor, :t},
      category: {:string, :generic},
      createdDt: {:string, :date_time},
      fieldGroups: [{FieldGroup, :t}],
      identifier: {:string, :generic},
      isCustom: :boolean,
      lastTrainedDt: {:string, :date_time},
      name: {:string, :generic},
      namePlural: {:string, :generic},
      organization: {Organization, :t},
      validatable: :boolean
    ]
  end
end
