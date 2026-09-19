defmodule Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ClientBISSubscriptionCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          channels: [String.t()],
          profile: Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectAttributesProfile.t()
        }

  defstruct [:channels, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channels: [enum: ["EMAIL", "PUSH", "SMS"]],
      profile: {Klaviyo.ClientBISSubscriptionCreateQueryResourceObjectAttributesProfile, :t}
    ]
  end
end
