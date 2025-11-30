defmodule Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ServerBISSubscriptionCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          channels: [String.t()],
          profile:
            Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectAttributesProfile.t() | nil
        }

  defstruct [:channels, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channels: [enum: ["EMAIL", "PUSH", "SMS"]],
      profile: {Klaviyo.ServerBISSubscriptionCreateQueryResourceObjectAttributesProfile, :t}
    ]
  end
end
