defmodule ExtractorUpdate do
  @moduledoc """
  Provides struct and type for a ExtractorUpdate
  """

  @type t :: %__MODULE__{
          baseExtractor: String.t() | nil,
          category: String.t() | nil,
          fieldGroups: [FieldGroup.t()] | nil,
          name: String.t() | nil,
          namePlural: String.t() | nil,
          validatable: boolean | nil
        }

  defstruct [:baseExtractor, :category, :fieldGroups, :name, :namePlural, :validatable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      baseExtractor: {:string, :generic},
      category: {:string, :generic},
      fieldGroups: [{FieldGroup, :t}],
      name: {:string, :generic},
      namePlural: {:string, :generic},
      validatable: :boolean
    ]
  end
end
