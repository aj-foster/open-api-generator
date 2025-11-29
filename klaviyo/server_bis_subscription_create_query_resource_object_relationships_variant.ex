defmodule ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariant do
  @moduledoc """
  Provides struct and type for a ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariant
  """

  @type t :: %__MODULE__{
          data: ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariantData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {ServerBISSubscriptionCreateQueryResourceObjectRelationshipsVariantData, :t}]
  end
end
