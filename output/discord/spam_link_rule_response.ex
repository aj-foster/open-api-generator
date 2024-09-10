defmodule SpamLinkRuleResponse do
  @moduledoc """
  Provides struct and type for a SpamLinkRuleResponse
  """

  @type t :: %__MODULE__{
          actions: [
            BlockMessageActionResponse.t()
            | FlagToChannelActionResponse.t()
            | QuarantineUserActionResponse.t()
            | UserCommunicationDisabledActionResponse.t()
          ],
          creator_id: String.t(),
          enabled: boolean | nil,
          event_type: integer,
          exempt_channels: [String.t()] | nil,
          exempt_roles: [String.t()] | nil,
          guild_id: String.t(),
          id: String.t(),
          name: String.t(),
          trigger_metadata: map,
          trigger_type: 2
        }

  defstruct [
    :actions,
    :creator_id,
    :enabled,
    :event_type,
    :exempt_channels,
    :exempt_roles,
    :guild_id,
    :id,
    :name,
    :trigger_metadata,
    :trigger_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [
        union: [
          {BlockMessageActionResponse, :t},
          {FlagToChannelActionResponse, :t},
          {QuarantineUserActionResponse, :t},
          {UserCommunicationDisabledActionResponse, :t}
        ]
      ],
      creator_id: {:string, :generic},
      enabled: {:union, [:boolean, :null]},
      event_type: :integer,
      exempt_channels: {:union, [[string: :generic], :null]},
      exempt_roles: {:union, [[string: :generic], :null]},
      guild_id: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      trigger_metadata: :map,
      trigger_type: {:const, 2}
    ]
  end
end
