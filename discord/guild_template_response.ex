defmodule GuildTemplateResponse do
  @moduledoc """
  Provides struct and type for a GuildTemplateResponse
  """

  @type t :: %__MODULE__{
          code: String.t(),
          created_at: DateTime.t(),
          creator: UserResponse.t() | nil,
          creator_id: String.t(),
          description: String.t() | nil,
          is_dirty: boolean | nil,
          name: String.t(),
          serialized_source_guild: GuildTemplateSnapshotResponse.t(),
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
      code: {:string, :generic},
      created_at: {:string, :date_time},
      creator: {:union, [{UserResponse, :t}, :null]},
      creator_id: {:string, :generic},
      description: {:union, [{:string, :generic}, :null]},
      is_dirty: {:union, [:boolean, :null]},
      name: {:string, :generic},
      serialized_source_guild: {GuildTemplateSnapshotResponse, :t},
      source_guild_id: {:string, :generic},
      updated_at: {:string, :date_time},
      usage_count: :integer
    ]
  end
end
