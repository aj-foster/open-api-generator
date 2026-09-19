defmodule Discord.StageScheduledEventCreateRequest do
  @moduledoc """
  Provides struct and type for a StageScheduledEventCreateRequest
  """

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          description: String.t() | nil,
          entity_metadata: map | nil,
          entity_type: 1,
          image: String.t() | nil,
          name: String.t(),
          privacy_level: integer,
          scheduled_end_time: DateTime.t() | nil,
          scheduled_start_time: DateTime.t()
        }

  defstruct [
    :channel_id,
    :description,
    :entity_metadata,
    :entity_type,
    :image,
    :name,
    :privacy_level,
    :scheduled_end_time,
    :scheduled_start_time
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:union, [{:string, "snowflake"}, :null]},
      description: {:union, [:string, :null]},
      entity_metadata: {:union, [:map, :null]},
      entity_type: {:const, 1},
      image: {:union, [:string, :null]},
      name: :string,
      privacy_level: {:integer, "int32"},
      scheduled_end_time: {:union, [{:string, "date-time"}, :null]},
      scheduled_start_time: {:string, "date-time"}
    ]
  end
end
