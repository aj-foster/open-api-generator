defmodule Klaviyo.PushTokenUnregisterQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a PushTokenUnregisterQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          platform: String.t(),
          profile: Klaviyo.PushTokenUnregisterQueryResourceObjectAttributesProfile.t(),
          token: String.t(),
          vendor: String.t() | nil
        }

  defstruct [:platform, :profile, :token, :vendor]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      platform: {:enum, ["android", "ios"]},
      profile: {Klaviyo.PushTokenUnregisterQueryResourceObjectAttributesProfile, :t},
      token: :string,
      vendor: {:enum, ["apns", "fcm"]}
    ]
  end
end
