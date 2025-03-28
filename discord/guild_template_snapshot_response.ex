defmodule GuildTemplateSnapshotResponse do
  @moduledoc """
  Provides struct and type for a GuildTemplateSnapshotResponse
  """

  @type t :: %__MODULE__{
          afk_channel_id: String.t() | nil,
          afk_timeout: integer,
          channels: [GuildTemplateChannelResponse.t()],
          default_message_notifications: integer,
          description: String.t() | nil,
          explicit_content_filter: integer,
          name: String.t(),
          preferred_locale: String.t(),
          region: String.t() | nil,
          roles: [GuildTemplateRoleResponse.t()],
          system_channel_flags: integer,
          system_channel_id: String.t() | nil,
          verification_level: integer
        }

  defstruct [
    :afk_channel_id,
    :afk_timeout,
    :channels,
    :default_message_notifications,
    :description,
    :explicit_content_filter,
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
      afk_channel_id: {:union, [{:string, "snowflake"}, :null]},
      afk_timeout: {:integer, :int32},
      channels: [{GuildTemplateChannelResponse, :t}],
      default_message_notifications: {:integer, :int32},
      description: {:union, [{:string, :generic}, :null]},
      explicit_content_filter: {:integer, :int32},
      name: {:string, :generic},
      preferred_locale: {:string, :generic},
      region: {:union, [{:string, :generic}, :null]},
      roles: [{GuildTemplateRoleResponse, :t}],
      system_channel_flags: {:integer, :int32},
      system_channel_id: {:union, [{:string, "snowflake"}, :null]},
      verification_level: {:integer, :int32}
    ]
  end
end
