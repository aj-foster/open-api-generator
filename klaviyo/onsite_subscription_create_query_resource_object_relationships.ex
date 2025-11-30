defmodule Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          list: Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList.t()
        }

  defstruct [:list]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [list: {Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectRelationshipsList, :t}]
  end
end
