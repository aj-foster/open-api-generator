defmodule Discord.ApplicationCommandResponse do
  @moduledoc """
  Provides struct and type for a ApplicationCommandResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t(),
          default_member_permissions: String.t() | nil,
          description: String.t(),
          description_localizations: map | nil,
          description_localized: String.t() | nil,
          dm_permission: boolean | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          name: String.t(),
          name_localizations: map | nil,
          name_localized: String.t() | nil,
          nsfw: boolean | nil,
          options: [map] | nil,
          type: integer,
          version: String.t()
        }

  defstruct [
    :application_id,
    :default_member_permissions,
    :description,
    :description_localizations,
    :description_localized,
    :dm_permission,
    :guild_id,
    :id,
    :name,
    :name_localizations,
    :name_localized,
    :nsfw,
    :options,
    :type,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:string, "snowflake"},
      default_member_permissions: {:union, [:string, :null]},
      description: :string,
      description_localizations: {:union, [:map, :null]},
      description_localized: {:union, [:string, :null]},
      dm_permission: {:union, [:boolean, :null]},
      guild_id: {:union, [{:string, "snowflake"}, :null]},
      id: {:string, "snowflake"},
      name: :string,
      name_localizations: {:union, [:map, :null]},
      name_localized: {:union, [:string, :null]},
      nsfw: {:union, [:boolean, :null]},
      options: {:union, [[:map], :null]},
      type: {:integer, "int32"},
      version: {:string, "snowflake"}
    ]
  end
end
