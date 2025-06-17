defmodule StopwordsSetUpsertSchema do
  @moduledoc """
  Provides struct and type for a StopwordsSetUpsertSchema
  """

  @type t :: %__MODULE__{locale: String.t() | nil, stopwords: [String.t()]}

  defstruct [:locale, :stopwords]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [locale: {:string, :generic}, stopwords: [string: :generic]]
  end
end
