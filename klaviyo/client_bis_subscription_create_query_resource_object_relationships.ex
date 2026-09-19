defmodule Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          variant: Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariant.t()
        }

  defstruct [:variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variant: {Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariant, :t}]
  end
end
