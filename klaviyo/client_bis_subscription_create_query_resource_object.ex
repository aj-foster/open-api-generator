defmodule Klaviyo.ClientBISSubscriptionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectAttributes.t(),
          relationships: Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectRelationships, :t},
      type: {:const, "back-in-stock-subscription"}
    ]
  end
end
