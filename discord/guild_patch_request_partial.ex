defmodule Discord.GuildPatchRequestPartial do
  @moduledoc """
  Provides struct and type for a GuildPatchRequestPartial
  """

  @type t :: %__MODULE__{
          afk_channel_id: String.t() | nil,
          afk_timeout: integer | nil,
          banner: String.t() | nil,
          default_message_notifications: integer | nil,
          description: String.t() | nil,
          discovery_splash: String.t() | nil,
          explicit_content_filter: integer | nil,
          features: [String.t() | nil] | nil,
          home_header: String.t() | nil,
          icon: String.t() | nil,
          name: String.t() | nil,
          owner_id: String.t() | nil,
          preferred_locale: String.t() | nil,
          premium_progress_bar_enabled: boolean | nil,
          public_updates_channel_id: String.t() | nil,
          region: String.t() | nil,
          rules_channel_id: String.t() | nil,
          safety_alerts_channel_id: String.t() | nil,
          splash: String.t() | nil,
          system_channel_flags: integer | nil,
          system_channel_id: String.t() | nil,
          verification_level: integer | nil
        }

  defstruct [
    :afk_channel_id,
    :afk_timeout,
    :banner,
    :default_message_notifications,
    :description,
    :discovery_splash,
    :explicit_content_filter,
    :features,
    :home_header,
    :icon,
    :name,
    :owner_id,
    :preferred_locale,
    :premium_progress_bar_enabled,
    :public_updates_channel_id,
    :region,
    :rules_channel_id,
    :safety_alerts_channel_id,
    :splash,
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
      afk_timeout: {:union, [{:integer, "int32"}, :null]},
      banner: {:union, [:string, :null]},
      default_message_notifications: {:union, [{:integer, "int32"}, :null]},
      description: {:union, [:string, :null]},
      discovery_splash: {:union, [:string, :null]},
      explicit_content_filter: {:union, [{:integer, "int32"}, :null]},
      features: {:union, [[union: [:string, :null]], :null]},
      home_header: {:union, [:string, :null]},
      icon: {:union, [:string, :null]},
      name: :string,
      owner_id: {:string, "snowflake"},
      preferred_locale: {:union, [:string, :null]},
      premium_progress_bar_enabled: {:union, [:boolean, :null]},
      public_updates_channel_id: {:union, [{:string, "snowflake"}, :null]},
      region: {:union, [:string, :null]},
      rules_channel_id: {:union, [{:string, "snowflake"}, :null]},
      safety_alerts_channel_id: {:union, [{:string, "snowflake"}, :null]},
      splash: {:union, [:string, :null]},
      system_channel_flags: {:union, [:integer, :null]},
      system_channel_id: {:union, [{:string, "snowflake"}, :null]},
      verification_level: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
