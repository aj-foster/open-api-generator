defmodule Discord.ThreadMetadataResponse do
  @moduledoc """
  Provides struct and type for a ThreadMetadataResponse
  """

  @type t :: %__MODULE__{
          archive_timestamp: DateTime.t() | nil,
          archived: boolean,
          auto_archive_duration: integer,
          create_timestamp: DateTime.t() | nil,
          invitable: boolean | nil,
          locked: boolean
        }

  defstruct [
    :archive_timestamp,
    :archived,
    :auto_archive_duration,
    :create_timestamp,
    :invitable,
    :locked
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      archive_timestamp: {:union, [{:string, "date-time"}, :null]},
      archived: :boolean,
      auto_archive_duration: {:integer, "int32"},
      create_timestamp: {:union, [{:string, "date-time"}, :null]},
      invitable: {:union, [:boolean, :null]},
      locked: :boolean
    ]
  end
end
