defmodule Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SubscriptionDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {Klaviyo.SubscriptionDeleteJobCreateQueryResourceObjectAttributesProfiles, :t}]
  end
end
