defmodule DocumentMetaCollectionExtractor do
  @moduledoc """
  Provides struct and type for a DocumentMetaCollectionExtractor
  """

  @type t :: %__MODULE__{
          baseExtractor: String.t() | nil,
          identifier: String.t() | nil,
          name: String.t() | nil,
          validatable: boolean | nil
        }

  defstruct [:baseExtractor, :identifier, :name, :validatable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      baseExtractor: {:string, :generic},
      identifier: {:string, :generic},
      name: {:string, :generic},
      validatable: :boolean
    ]
  end
end
