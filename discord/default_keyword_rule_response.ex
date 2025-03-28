defmodule DefaultKeywordRuleResponse do
  @moduledoc """
  Provides struct and type for a DefaultKeywordRuleResponse
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
          trigger_metadata: DefaultKeywordListTriggerMetadataResponse.t(),
          trigger_type: 4
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
      creator_id: {:string, "snowflake"},
      enabled: {:union, [:boolean, :null]},
      event_type: {:integer, :int32},
      exempt_channels: {:union, [[string: "snowflake"], :null]},
      exempt_roles: {:union, [[string: "snowflake"], :null]},
      guild_id: {:string, "snowflake"},
      id: {:string, "snowflake"},
      name: {:string, :generic},
      trigger_metadata: {DefaultKeywordListTriggerMetadataResponse, :t},
      trigger_type: {:const, 4}
    ]
  end
end
