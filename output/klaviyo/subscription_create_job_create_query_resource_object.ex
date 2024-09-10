defmodule SubscriptionCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: SubscriptionCreateJobCreateQueryResourceObjectAttributes.t(),
          relationships: SubscriptionCreateJobCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {SubscriptionCreateJobCreateQueryResourceObjectAttributes, :t},
      relationships: {SubscriptionCreateJobCreateQueryResourceObjectRelationships, :t},
      type: {:const, "profile-subscription-bulk-create-job"}
    ]
  end
end
