defmodule DeviceMetadata do
  @moduledoc """
  Provides struct and type for a DeviceMetadata
  """

  @type t :: %__MODULE__{
          app_build: String.t() | nil,
          app_id: String.t() | nil,
          app_name: String.t() | nil,
          app_version: String.t() | nil,
          device_id: String.t() | nil,
          device_model: String.t() | nil,
          environment: String.t() | nil,
          klaviyo_sdk: String.t() | nil,
          manufacturer: String.t() | nil,
          os_name: String.t() | nil,
          os_version: String.t() | nil,
          sdk_version: String.t() | nil
        }

  defstruct [
    :app_build,
    :app_id,
    :app_name,
    :app_version,
    :device_id,
    :device_model,
    :environment,
    :klaviyo_sdk,
    :manufacturer,
    :os_name,
    :os_version,
    :sdk_version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app_build: {:string, :generic},
      app_id: {:string, :generic},
      app_name: {:string, :generic},
      app_version: {:string, :generic},
      device_id: {:string, :generic},
      device_model: {:string, :generic},
      environment: {:enum, ["debug", "release"]},
      klaviyo_sdk: {:enum, ["android", "swift"]},
      manufacturer: {:string, :generic},
      os_name: {:enum, ["android", "ios", "ipados", "macos", "tvos"]},
      os_version: {:string, :generic},
      sdk_version: {:string, :generic}
    ]
  end
end
