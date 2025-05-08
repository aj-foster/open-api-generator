defmodule VoiceScheduledEventResponse do
  @moduledoc """
  Provides struct and type for a VoiceScheduledEventResponse
  """

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          creator: UserResponse.t() | nil,
          creator_id: String.t() | nil,
          description: String.t() | nil,
          entity_id: String.t() | nil,
          entity_metadata: map | nil,
          entity_type: 2,
          guild_id: String.t(),
          id: String.t(),
          image: String.t() | nil,
          name: String.t(),
          privacy_level: integer,
          scheduled_end_time: DateTime.t() | nil,
          scheduled_start_time: DateTime.t(),
          status: integer,
          user_count: integer | nil,
          user_rsvp: ScheduledEventUserResponse.t() | nil
        }

  defstruct [
    :channel_id,
    :creator,
    :creator_id,
    :description,
    :entity_id,
    :entity_metadata,
    :entity_type,
    :guild_id,
    :id,
    :image,
    :name,
    :privacy_level,
    :scheduled_end_time,
    :scheduled_start_time,
    :status,
    :user_count,
    :user_rsvp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:union, [{:string, :generic}, :null]},
      creator: {:union, [{UserResponse, :t}, :null]},
      creator_id: {:union, [{:string, :generic}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      entity_id: {:union, [{:string, :generic}, :null]},
      entity_metadata: {:union, [:map, :null]},
      entity_type: {:const, 2},
      guild_id: {:string, :generic},
      id: {:string, :generic},
      image: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      privacy_level: :integer,
      scheduled_end_time: {:union, [{:string, :date_time}, :null]},
      scheduled_start_time: {:string, :date_time},
      status: :integer,
      user_count: {:union, [:integer, :null]},
      user_rsvp: {:union, [{ScheduledEventUserResponse, :t}, :null]}
    ]
  end
end
