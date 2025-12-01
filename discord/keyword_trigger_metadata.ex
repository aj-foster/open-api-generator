defmodule Discord.KeywordTriggerMetadata do
  @moduledoc """
  Provides struct and type for a KeywordTriggerMetadata
  """

  @type t :: %__MODULE__{
          allow_list: [String.t()] | nil,
          keyword_filter: [String.t()] | nil,
          regex_patterns: [String.t()] | nil
        }

  defstruct [:allow_list, :keyword_filter, :regex_patterns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow_list: {:union, [[:string], :null]},
      keyword_filter: {:union, [[:string], :null]},
      regex_patterns: {:union, [[:string], :null]}
    ]
  end
end
