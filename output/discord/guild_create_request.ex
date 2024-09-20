defmodule GuildCreateRequest do
  @moduledoc """
  Provides struct and type for a GuildCreateRequest
  """

  @type t :: %__MODULE__{
          afk_channel_id: String.t() | nil,
          afk_timeout: integer | nil,
          channels: [map] | nil,
          default_message_notifications: integer | nil,
          description: String.t() | nil,
          explicit_content_filter: integer | nil,
          icon: String.t() | nil,
          name: String.t(),
          preferred_locale: String.t() | nil,
          region: String.t() | nil,
          roles: [map] | nil,
          system_channel_flags: integer | nil,
          system_channel_id: String.t() | nil,
          verification_level: integer | nil
        }

  defstruct [
    :afk_channel_id,
    :afk_timeout,
    :channels,
    :default_message_notifications,
    :description,
    :explicit_content_filter,
    :icon,
    :name,
    :preferred_locale,
    :region,
    :roles,
    :system_channel_flags,
    :system_channel_id,
    :verification_level
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      afk_channel_id: {:union, [{:string, :generic}, :null]},
      afk_timeout: {:union, [:integer, :null]},
      channels: {:union, [[:map], :null]},
      default_message_notifications: {:union, [:integer, :null]},
      description: {:union, [{:string, :generic}, :null]},
      explicit_content_filter: {:union, [:integer, :null]},
      icon: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      preferred_locale: {:union, [{:string, :generic}, :null]},
      region: {:union, [{:string, :generic}, :null]},
      roles: {:union, [[:map], :null]},
      system_channel_flags: {:union, [:integer, :null]},
      system_channel_id: {:union, [{:string, :generic}, :null]},
      verification_level: {:union, [:integer, :null]}
    ]
  end
end
