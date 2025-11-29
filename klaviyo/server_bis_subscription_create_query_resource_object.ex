defmodule ServerBISSubscriptionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ServerBISSubscriptionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ServerBISSubscriptionCreateQueryResourceObjectAttributes.t(),
          relationships: ServerBISSubscriptionCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ServerBISSubscriptionCreateQueryResourceObjectAttributes, :t},
      relationships: {ServerBISSubscriptionCreateQueryResourceObjectRelationships, :t},
      type: {:const, "back-in-stock-subscription"}
    ]
  end
end
