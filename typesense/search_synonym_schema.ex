defmodule SearchSynonymSchema do
  @moduledoc """
  Provides struct and type for a SearchSynonymSchema
  """

  @type t :: %__MODULE__{root: String.t() | nil, synonyms: [String.t()]}

  defstruct [:root, :synonyms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [root: {:string, :generic}, synonyms: [string: :generic]]
  end
end
