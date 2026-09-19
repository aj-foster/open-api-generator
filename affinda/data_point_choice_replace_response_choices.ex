defmodule Affinda.DataPointChoiceReplaceResponseChoices do
  @moduledoc """
  Provides struct and type for a DataPointChoiceReplaceResponseChoices
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: integer,
          label: String.t(),
          synonyms: [String.t()] | nil,
          value: String.t()
        }

  defstruct [:description, :id, :label, :synonyms, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, id: :integer, label: :string, synonyms: [:string], value: :string]
  end
end
