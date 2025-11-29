defmodule AnalyticsRuleParameters do
  @moduledoc """
  Provides struct and type for a AnalyticsRuleParameters
  """

  @type t :: %__MODULE__{
          destination: AnalyticsRuleParametersDestination.t(),
          limit: integer,
          source: AnalyticsRuleParametersSource.t()
        }

  defstruct [:destination, :limit, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      destination: {AnalyticsRuleParametersDestination, :t},
      limit: :integer,
      source: {AnalyticsRuleParametersSource, :t}
    ]
  end
end
