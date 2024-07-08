defmodule KeywordTriggerMetadataResponse do
  @moduledoc """
  Provides struct and type for a KeywordTriggerMetadataResponse
  """

  @type t :: %__MODULE__{
          allow_list: [String.t()],
          keyword_filter: [String.t()],
          regex_patterns: [String.t()]
        }

  defstruct [:allow_list, :keyword_filter, :regex_patterns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_list: [string: :generic],
      keyword_filter: [string: :generic],
      regex_patterns: [string: :generic]
    ]
  end
end
