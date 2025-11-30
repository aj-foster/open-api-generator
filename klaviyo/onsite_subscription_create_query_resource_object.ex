defmodule Klaviyo.OnsiteSubscriptionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectAttributes.t(),
          relationships: Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationships, :t},
      type: {:const, "subscription"}
    ]
  end
end
