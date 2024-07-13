defmodule SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList
  """

  @type t :: %__MODULE__{
          data: SubscriptionCreateJobCreateQueryResourceObjectRelationshipsListData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SubscriptionCreateJobCreateQueryResourceObjectRelationshipsListData, :t}]
  end
end
