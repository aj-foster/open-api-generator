defmodule GitHub.RuleSuiteRuleEvaluationsRuleSource do
  @moduledoc """
  Provides struct and type for a RuleSuiteRuleEvaluationsRuleSource
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: integer | nil,
          name: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:union, [:integer, :null]},
      name: {:union, [{:string, :generic}, :null]},
      type: {:string, :generic}
    ]
  end
end
