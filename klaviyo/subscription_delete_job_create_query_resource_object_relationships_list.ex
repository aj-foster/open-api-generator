defmodule SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsList do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsList
  """

  @type t :: %__MODULE__{
          data: SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsListData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsListData, :t}]
  end
end
