defmodule SearchOverride do
  @moduledoc """
  Provides struct and type for a SearchOverride
  """

  @type t :: %__MODULE__{
          excludes: [SearchOverrideExclude.t()] | nil,
          filter_by: String.t() | nil,
          id: String.t() | nil,
          includes: [SearchOverrideInclude.t()] | nil,
          remove_matched_tokens: boolean | nil,
          rule: SearchOverrideRule.t() | nil
        }

  defstruct [:excludes, :filter_by, :id, :includes, :remove_matched_tokens, :rule]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      excludes: [{SearchOverrideExclude, :t}],
      filter_by: {:string, :generic},
      id: {:string, :generic},
      includes: [{SearchOverrideInclude, :t}],
      remove_matched_tokens: :boolean,
      rule: {SearchOverrideRule, :t}
    ]
  end
end
