defmodule Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          list: Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsList.t() | nil
        }

  defstruct [:list]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [list: {Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectRelationshipsList, :t}]
  end
end
