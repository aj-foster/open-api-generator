defmodule DefaultKeywordListUpsertRequest do
  @moduledoc """
  Provides struct and type for a DefaultKeywordListUpsertRequest
  """

  @type t :: %__MODULE__{
          actions: [map] | nil,
          enabled: boolean | nil,
          event_type: integer,
          exempt_channels: [String.t()] | nil,
          exempt_roles: [String.t()] | nil,
          name: String.t(),
          trigger_metadata: DefaultKeywordListTriggerMetadata.t(),
          trigger_type: 4
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
      event_type: :integer,
      exempt_channels: {:union, [[string: :generic], :null]},
      exempt_roles: {:union, [[string: :generic], :null]},
      name: {:string, :generic},
      trigger_metadata: {DefaultKeywordListTriggerMetadata, :t},
      trigger_type: {:const, 4}
    ]
  end
end
