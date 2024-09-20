defmodule EmailSubscriptionParameters do
  @moduledoc """
  Provides struct and type for a EmailSubscriptionParameters
  """

  @type t :: %__MODULE__{marketing: MarketingSubscriptionParameters.t()}

  defstruct [:marketing]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [marketing: {MarketingSubscriptionParameters, :t}]
  end
end
