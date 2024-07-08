defmodule GetMembershipSubscriptionResponse do
  @moduledoc """
  Provides struct and type for a GetMembershipSubscriptionResponse
  """

  @type t :: %__MODULE__{subscriptions: [Subscription.t()]}

  defstruct [:subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [subscriptions: [{Subscription, :t}]]
  end
end
