defmodule WidgetResponse do
  @moduledoc """
  Provides struct and type for a WidgetResponse
  """

  @type t :: %__MODULE__{
          channels: [WidgetChannel.t()],
          id: String.t(),
          instant_invite: String.t() | nil,
          members: [WidgetMember.t()],
          name: String.t(),
          presence_count: integer
        }

  defstruct [:channels, :id, :instant_invite, :members, :name, :presence_count]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channels: [{WidgetChannel, :t}],
      id: {:string, :generic},
      instant_invite: {:union, [{:string, :generic}, :null]},
      members: [{WidgetMember, :t}],
      name: {:string, :generic},
      presence_count: :integer
    ]
  end
end
