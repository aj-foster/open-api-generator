defmodule Discord.GuildTemplateResponse do
  @moduledoc """
  Provides struct and type for a GuildTemplateResponse
  """

  @type t :: %__MODULE__{
          code: String.t(),
          created_at: DateTime.t(),
          creator: Discord.UserResponse.t() | nil,
          creator_id: String.t(),
          description: String.t() | nil,
          is_dirty: boolean | nil,
          name: String.t(),
          serialized_source_guild: Discord.GuildTemplateSnapshotResponse.t(),
          source_guild_id: String.t(),
          updated_at: DateTime.t(),
          usage_count: integer
        }

  defstruct [
    :code,
    :created_at,
    :creator,
    :creator_id,
    :description,
    :is_dirty,
    :name,
    :serialized_source_guild,
    :source_guild_id,
    :updated_at,
    :usage_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      created_at: {:string, "date-time"},
      creator: {:union, [{Discord.UserResponse, :t}, :null]},
      creator_id: {:string, "snowflake"},
      description: {:union, [:string, :null]},
      is_dirty: {:union, [:boolean, :null]},
      name: :string,
      serialized_source_guild: {Discord.GuildTemplateSnapshotResponse, :t},
      source_guild_id: {:string, "snowflake"},
      updated_at: {:string, "date-time"},
      usage_count: {:integer, "int32"}
    ]
  end
end
