defmodule Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a ServerBISSubscriptionCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          variant: Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariant.t()
        }

  defstruct [:variant]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variant: {Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariant, :t}]
  end
end
