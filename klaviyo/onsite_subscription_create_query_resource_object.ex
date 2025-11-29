defmodule OnsiteSubscriptionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: OnsiteSubscriptionCreateQueryResourceObjectAttributes.t(),
          relationships: OnsiteSubscriptionCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {OnsiteSubscriptionCreateQueryResourceObjectAttributes, :t},
      relationships: {OnsiteSubscriptionCreateQueryResourceObjectRelationships, :t},
      type: {:const, "subscription"}
    ]
  end
end
