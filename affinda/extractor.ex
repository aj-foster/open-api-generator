defmodule Affinda.Extractor do
  @moduledoc """
  Provides struct and type for a Extractor
  """

  @type t :: %__MODULE__{
          baseExtractor: Affinda.ExtractorBaseExtractor.t() | nil,
          category: String.t() | nil,
          createdDt: DateTime.t() | nil,
          fieldGroups: [Affinda.FieldGroup.t()] | nil,
          identifier: String.t(),
          isCustom: boolean | nil,
          lastTrainedDt: DateTime.t() | nil,
          name: String.t(),
          namePlural: String.t(),
          organization: Affinda.Organization.t() | nil,
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
      baseExtractor: {Affinda.ExtractorBaseExtractor, :t},
      category: :string,
      createdDt: {:string, "date-time"},
      fieldGroups: [{Affinda.FieldGroup, :t}],
      identifier: :string,
      isCustom: :boolean,
      lastTrainedDt: {:string, "date-time"},
      name: :string,
      namePlural: :string,
      organization: {Affinda.Organization, :t},
      validatable: :boolean
    ]
  end
end
