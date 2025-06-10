defmodule SubscriptionDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profiles: SubscriptionDeleteJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {SubscriptionDeleteJobCreateQueryResourceObjectAttributesProfiles, :t}]
  end
end
