defmodule QuotaConsumptionResponse do
  @moduledoc """
  Provides struct and type for a QuotaConsumptionResponse
  """

  @type t :: %__MODULE__{totalUsage: integer}

  defstruct [:totalUsage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [totalUsage: :integer]
  end
end
