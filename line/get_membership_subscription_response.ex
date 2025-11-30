defmodule Line.GetMembershipSubscriptionResponse do
  @moduledoc """
  Provides struct and type for a GetMembershipSubscriptionResponse
  """

  @type t :: %__MODULE__{subscriptions: [Line.Subscription.t()]}

  defstruct [:subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [subscriptions: [{Line.Subscription, :t}]]
  end
end
