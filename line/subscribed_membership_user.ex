defmodule SubscribedMembershipUser do
  @moduledoc """
  Provides struct and type for a SubscribedMembershipUser
  """

  @type t :: %__MODULE__{
          joinedTime: integer,
          membershipNo: integer,
          nextBillingDate: String.t(),
          totalSubscriptionMonths: integer
        }

  defstruct [:joinedTime, :membershipNo, :nextBillingDate, :totalSubscriptionMonths]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      joinedTime: :integer,
      membershipNo: :integer,
      nextBillingDate: {:string, :generic},
      totalSubscriptionMonths: :integer
    ]
  end
end
