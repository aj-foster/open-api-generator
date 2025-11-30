defmodule Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList
  """

  @type t :: %__MODULE__{
          data: Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectRelationshipsListData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectRelationshipsListData, :t}]
  end
end
