defmodule Line.Subscription do
  @moduledoc """
  Provides struct and type for a Subscription
  """

  @type t :: %__MODULE__{
          membership: Line.SubscribedMembershipPlan.t(),
          user: Line.SubscribedMembershipUser.t()
        }

  defstruct [:membership, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [membership: {Line.SubscribedMembershipPlan, :t}, user: {Line.SubscribedMembershipUser, :t}]
  end
end
