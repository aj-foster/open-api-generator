defmodule Klaviyo.EmailMarketingSuppression do
  @moduledoc """
  Provides struct and type for a EmailMarketingSuppression
  """

  @type t :: %__MODULE__{reason: String.t(), timestamp: DateTime.t()}

  defstruct [:reason, :timestamp]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reason: :string, timestamp: {:string, "date-time"}]
  end
end
