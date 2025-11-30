defmodule GitHub.RuleSuiteRuleEvaluations do
  @moduledoc """
  Provides struct and type for a RuleSuiteRuleEvaluations
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          details: String.t() | nil,
          enforcement: String.t() | nil,
          result: String.t() | nil,
          rule_source: GitHub.RuleSuiteRuleEvaluationsRuleSource.t() | nil,
          rule_type: String.t() | nil
        }

  defstruct [:__info__, :details, :enforcement, :result, :rule_source, :rule_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details: {:string, :generic},
      enforcement: {:enum, ["active", "evaluate", "deleted ruleset"]},
      result: {:enum, ["pass", "fail"]},
      rule_source: {GitHub.RuleSuiteRuleEvaluationsRuleSource, :t},
      rule_type: {:string, :generic}
    ]
  end
end
