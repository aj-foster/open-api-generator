defmodule OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList
  """

  @type t :: %__MODULE__{
          data: OnsiteSubscriptionCreateQueryResourceObjectRelationshipsListData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OnsiteSubscriptionCreateQueryResourceObjectRelationshipsListData, :t}]
  end
end
