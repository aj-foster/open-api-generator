defmodule ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariant do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariant
  """

  @type t :: %__MODULE__{
          data: ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariantData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ClientBISSubscriptionCreateQueryResourceObjectRelationshipsVariantData, :t}]
  end
end
