defmodule Discord.GuildTemplateRoleResponse do
  @moduledoc """
  Provides struct and type for a GuildTemplateRoleResponse
  """

  @type t :: %__MODULE__{
          color: integer,
          hoist: boolean,
          icon: String.t() | nil,
          id: integer,
          mentionable: boolean,
          name: String.t(),
          permissions: String.t(),
          unicode_emoji: String.t() | nil
        }

  defstruct [:color, :hoist, :icon, :id, :mentionable, :name, :permissions, :unicode_emoji]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: {:integer, "int32"},
      hoist: :boolean,
      icon: {:union, [:string, :null]},
      id: {:integer, "int32"},
      mentionable: :boolean,
      name: :string,
      permissions: :string,
      unicode_emoji: {:union, [:string, :null]}
    ]
  end
end
