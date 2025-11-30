defmodule Klaviyo.PushTokenCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a PushTokenCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          background: String.t() | nil,
          device_metadata: Klaviyo.DeviceMetadata.t() | nil,
          enablement_status: String.t() | nil,
          platform: String.t(),
          profile: Klaviyo.PushTokenCreateQueryResourceObjectAttributesProfile.t(),
          token: String.t(),
          vendor: String.t()
        }

  defstruct [
    :background,
    :device_metadata,
    :enablement_status,
    :platform,
    :profile,
    :token,
    :vendor
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      background: {:enum, ["AVAILABLE", "DENIED", "RESTRICTED"]},
      device_metadata: {Klaviyo.DeviceMetadata, :t},
      enablement_status:
        {:enum, ["AUTHORIZED", "DENIED", "NOT_DETERMINED", "PROVISIONAL", "UNAUTHORIZED"]},
      platform: {:enum, ["android", "ios"]},
      profile: {Klaviyo.PushTokenCreateQueryResourceObjectAttributesProfile, :t},
      token: :string,
      vendor: {:enum, ["apns", "fcm"]}
    ]
  end
end
