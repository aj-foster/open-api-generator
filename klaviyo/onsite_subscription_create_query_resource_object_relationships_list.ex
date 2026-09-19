defmodule Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList
  """

  @type t :: %__MODULE__{
          data: Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationshipsListData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationshipsListData, :t}]
  end
end
