defmodule Discord.MentionSpamUpsertRequest do
  @moduledoc """
  Provides struct and type for a MentionSpamUpsertRequest
  """

  @type t :: %__MODULE__{
          actions: [map] | nil,
          enabled: boolean | nil,
          event_type: integer,
          exempt_channels: [String.t()] | nil,
          exempt_roles: [String.t()] | nil,
          name: String.t(),
          trigger_metadata: Discord.MentionSpamTriggerMetadata.t() | nil,
          trigger_type: 5
        }

  defstruct [
    :actions,
    :enabled,
    :event_type,
    :exempt_channels,
    :exempt_roles,
    :name,
    :trigger_metadata,
    :trigger_type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: {:union, [[:map], :null]},
      enabled: {:union, [:boolean, :null]},
      event_type: {:integer, "int32"},
      exempt_channels: {:union, [[string: "snowflake"], :null]},
      exempt_roles: {:union, [[string: "snowflake"], :null]},
      name: :string,
      trigger_metadata: {:union, [{Discord.MentionSpamTriggerMetadata, :t}, :null]},
      trigger_type: {:const, 5}
    ]
  end
end
