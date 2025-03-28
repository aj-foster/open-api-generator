defmodule StageInstanceResponse do
  @moduledoc """
  Provides struct and type for a StageInstanceResponse
  """

  @type t :: %__MODULE__{
          channel_id: String.t(),
          discoverable_disabled: boolean | nil,
          guild_id: String.t(),
          guild_scheduled_event_id: String.t() | nil,
          id: String.t(),
          privacy_level: integer,
          topic: String.t()
        }

  defstruct [
    :channel_id,
    :discoverable_disabled,
    :guild_id,
    :guild_scheduled_event_id,
    :id,
    :privacy_level,
    :topic
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:string, :generic},
      discoverable_disabled: {:union, [:boolean, :null]},
      guild_id: {:string, :generic},
      guild_scheduled_event_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      privacy_level: :integer,
      topic: {:string, :generic}
    ]
  end
end
