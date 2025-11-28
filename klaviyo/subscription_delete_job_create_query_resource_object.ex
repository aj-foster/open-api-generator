defmodule SubscriptionDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: SubscriptionDeleteJobCreateQueryResourceObjectAttributes.t(),
          relationships: SubscriptionDeleteJobCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {SubscriptionDeleteJobCreateQueryResourceObjectAttributes, :t},
      relationships: {SubscriptionDeleteJobCreateQueryResourceObjectRelationships, :t},
      type: {:const, "profile-subscription-bulk-delete-job"}
    ]
  end
end
