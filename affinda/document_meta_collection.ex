defmodule DocumentMetaCollection do
  @moduledoc """
  Provides struct and type for a DocumentMetaCollection
  """

  @type t :: %__MODULE__{
          extractor: DocumentMetaCollectionExtractor.t() | nil,
          identifier: String.t(),
          name: String.t() | nil,
          validationRules: [ValidationRule.t()] | nil
        }

  defstruct [:extractor, :identifier, :name, :validationRules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      extractor: {DocumentMetaCollectionExtractor, :t},
      identifier: {:string, :generic},
      name: {:string, :generic},
      validationRules: [{ValidationRule, :t}]
    ]
  end
end
