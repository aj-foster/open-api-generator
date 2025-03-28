defmodule SearchHighlight do
  @moduledoc """
  Provides struct and type for a SearchHighlight
  """

  @type t :: %__MODULE__{
          field: String.t() | nil,
          indices: [integer] | nil,
          matched_tokens: [map] | nil,
          snippet: String.t() | nil,
          snippets: [String.t()] | nil,
          value: String.t() | nil,
          values: [String.t()] | nil
        }

  defstruct [:field, :indices, :matched_tokens, :snippet, :snippets, :value, :values]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      field: {:string, :generic},
      indices: [:integer],
      matched_tokens: [:map],
      snippet: {:string, :generic},
      snippets: [string: :generic],
      value: {:string, :generic},
      values: [string: :generic]
    ]
  end
end
