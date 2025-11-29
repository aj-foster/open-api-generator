defmodule GuildRoleResponse do
  @moduledoc """
  Provides struct and type for a GuildRoleResponse
  """

  @type t :: %__MODULE__{
          color: integer,
          description: String.t() | nil,
          hoist: boolean,
          icon: String.t() | nil,
          id: String.t(),
          managed: boolean,
          mentionable: boolean,
          name: String.t(),
          permissions: String.t(),
          position: integer,
          tags: GuildRoleTagsResponse.t() | nil,
          unicode_emoji: String.t() | nil
        }

  defstruct [
    :color,
    :description,
    :hoist,
    :icon,
    :id,
    :managed,
    :mentionable,
    :name,
    :permissions,
    :position,
    :tags,
    :unicode_emoji
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: :integer,
      description: {:union, [{:string, :generic}, :null]},
      hoist: :boolean,
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      managed: :boolean,
      mentionable: :boolean,
      name: {:string, :generic},
      permissions: {:string, :generic},
      position: :integer,
      tags: {:union, [{GuildRoleTagsResponse, :t}, :null]},
      unicode_emoji: {:union, [{:string, :generic}, :null]}
    ]
  end
end
