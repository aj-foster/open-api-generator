defmodule SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles
  """

  @type t :: %__MODULE__{data: [ProfileSubscriptionCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{ProfileSubscriptionCreateQueryResourceObject, :t}]]
  end
end
