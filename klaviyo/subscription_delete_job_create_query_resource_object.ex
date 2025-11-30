defmodule Klaviyo.SubscriptionDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectAttributes.t(),
          relationships:
            Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectRelationships, :t},
      type: {:const, "profile-subscription-bulk-delete-job"}
    ]
  end
end
