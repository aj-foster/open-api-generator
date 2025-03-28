defmodule Subscription do
  @moduledoc """
  Provides struct and type for a Subscription
  """

  @type t :: %__MODULE__{
          membership: SubscribedMembershipPlan.t(),
          user: SubscribedMembershipUser.t()
        }

  defstruct [:membership, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [membership: {SubscribedMembershipPlan, :t}, user: {SubscribedMembershipUser, :t}]
  end
end
