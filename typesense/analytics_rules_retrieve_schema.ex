defmodule AnalyticsRulesRetrieveSchema do
  @moduledoc """
  Provides struct and type for a AnalyticsRulesRetrieveSchema
  """

  @type t :: %__MODULE__{rules: [AnalyticsRuleSchema.t()] | nil}

  defstruct [:rules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [rules: [{AnalyticsRuleSchema, :t}]]
  end
end
