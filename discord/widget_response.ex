defmodule Discord.WidgetResponse do
  @moduledoc """
  Provides struct and type for a WidgetResponse
  """

  @type t :: %__MODULE__{
          channels: [Discord.WidgetChannel.t()],
          id: String.t(),
          instant_invite: String.t() | nil,
          members: [Discord.WidgetMember.t()],
          name: String.t(),
          presence_count: integer
        }

  defstruct [:channels, :id, :instant_invite, :members, :name, :presence_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channels: [{Discord.WidgetChannel, :t}],
      id: {:string, "snowflake"},
      instant_invite: {:union, [:string, :null]},
      members: [{Discord.WidgetMember, :t}],
      name: :string,
      presence_count: {:integer, "int32"}
    ]
  end
end
