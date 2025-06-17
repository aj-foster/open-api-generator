defmodule GuildTemplateRoleResponse do
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
      color: :integer,
      hoist: :boolean,
      icon: {:union, [{:string, :generic}, :null]},
      id: :integer,
      mentionable: :boolean,
      name: {:string, :generic},
      permissions: {:string, :generic},
      unicode_emoji: {:union, [{:string, :generic}, :null]}
    ]
  end
end
