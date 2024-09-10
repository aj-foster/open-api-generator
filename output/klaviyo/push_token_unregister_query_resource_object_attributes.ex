defmodule PushTokenUnregisterQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a PushTokenUnregisterQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          platform: String.t(),
          profile: PushTokenUnregisterQueryResourceObjectAttributesProfile.t(),
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
      profile: {PushTokenUnregisterQueryResourceObjectAttributesProfile, :t},
      token: {:string, :generic},
      vendor: {:enum, ["apns", "fcm"]}
    ]
  end
end
