defmodule Typesense.AnalyticsRuleSchema do
  @moduledoc """
  Provides struct and type for a AnalyticsRuleSchema
  """

  @type t :: %__MODULE__{
          name: String.t(),
          params: Typesense.AnalyticsRuleParameters.t(),
          type: String.t()
        }

  defstruct [:name, :params, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      params: {Typesense.AnalyticsRuleParameters, :t},
      type: {:string, :generic}
    ]
  end
end
