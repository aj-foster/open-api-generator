defmodule Affinda.ExtractorCreate do
  @moduledoc """
  Provides struct and type for a ExtractorCreate
  """

  @type t :: %__MODULE__{
          baseExtractor: String.t() | nil,
          category: String.t() | nil,
          fieldGroups: [Affinda.FieldGroup.t()] | nil,
          name: String.t(),
          namePlural: String.t() | nil,
          organization: String.t(),
          validatable: boolean | nil
        }

  defstruct [
    :baseExtractor,
    :category,
    :fieldGroups,
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
      baseExtractor: :string,
      category: :string,
      fieldGroups: [{Affinda.FieldGroup, :t}],
      name: :string,
      namePlural: :string,
      organization: :string,
      validatable: :boolean
    ]
  end
end
