defmodule Affinda.DocumentMetaCollection do
  @moduledoc """
  Provides struct and type for a DocumentMetaCollection
  """

  @type t :: %__MODULE__{
          extractor: Affinda.DocumentMetaCollectionExtractor.t() | nil,
          identifier: String.t(),
          name: String.t() | nil,
          validationRules: [Affinda.ValidationRule.t()] | nil
        }

  defstruct [:extractor, :identifier, :name, :validationRules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      extractor: {Affinda.DocumentMetaCollectionExtractor, :t},
      identifier: :string,
      name: :string,
      validationRules: [{Affinda.ValidationRule, :t}]
    ]
  end
end
