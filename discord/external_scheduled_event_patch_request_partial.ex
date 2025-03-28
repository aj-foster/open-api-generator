defmodule ExternalScheduledEventPatchRequestPartial do
  @moduledoc """
  Provides struct and type for a ExternalScheduledEventPatchRequestPartial
  """

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          description: String.t() | nil,
          entity_metadata: EntityMetadataExternal.t() | nil,
          entity_type: 3 | nil,
          image: String.t() | nil,
          name: String.t() | nil,
          privacy_level: integer | nil,
          scheduled_end_time: DateTime.t() | nil,
          scheduled_start_time: DateTime.t() | nil,
          status: integer | nil
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
    :scheduled_start_time,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channel_id: {:union, [{:string, :generic}, :null]},
      description: {:union, [{:string, :generic}, :null]},
      entity_metadata: {EntityMetadataExternal, :t},
      entity_type: {:union, [{:const, 3}, :null]},
      image: {:union, [{:string, :generic}, :null]},
      name: {:string, :generic},
      privacy_level: :integer,
      scheduled_end_time: {:union, [{:string, :date_time}, :null]},
      scheduled_start_time: {:string, :date_time},
      status: {:union, [:integer, :null]}
    ]
  end
end
