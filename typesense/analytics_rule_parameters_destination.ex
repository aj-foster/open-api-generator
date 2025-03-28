defmodule AnalyticsRuleParametersDestination do
  @moduledoc """
  Provides struct and type for a AnalyticsRuleParametersDestination
  """

  @type t :: %__MODULE__{collection: String.t() | nil}

  defstruct [:collection]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [collection: {:string, :generic}]
  end
end
