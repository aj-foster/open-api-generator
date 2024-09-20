defmodule AnalyticsRuleParametersSource do
  @moduledoc """
  Provides struct and type for a AnalyticsRuleParametersSource
  """

  @type t :: %__MODULE__{collections: [String.t()] | nil}

  defstruct [:collections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [collections: [string: :generic]]
  end
end
