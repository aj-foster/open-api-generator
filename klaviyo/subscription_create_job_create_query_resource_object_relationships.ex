defmodule SubscriptionCreateJobCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          list: SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList.t() | nil
        }

  defstruct [:list]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [list: {SubscriptionCreateJobCreateQueryResourceObjectRelationshipsList, :t}]
  end
end
