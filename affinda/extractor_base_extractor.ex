defmodule ExtractorBaseExtractor do
  @moduledoc """
  Provides struct and type for a ExtractorBaseExtractor
  """

  @type t :: %__MODULE__{
          createdDt: DateTime.t() | nil,
          identifier: String.t(),
          isCustom: boolean | nil,
          name: String.t(),
          namePlural: String.t(),
          validatable: boolean
        }

  defstruct [:createdDt, :identifier, :isCustom, :name, :namePlural, :validatable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdDt: {:string, :date_time},
      identifier: {:string, :generic},
      isCustom: :boolean,
      name: {:string, :generic},
      namePlural: {:string, :generic},
      validatable: :boolean
    ]
  end
end
