defmodule StaticScheduleOptions do
  @moduledoc """
  Provides struct and type for a StaticScheduleOptions
  """

  @type t :: %__MODULE__{
          datetime: DateTime.t(),
          is_local: boolean | nil,
          send_past_recipients_immediately: boolean | nil
        }

  defstruct [:datetime, :is_local, :send_past_recipients_immediately]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      datetime: {:string, :date_time},
      is_local: :boolean,
      send_past_recipients_immediately: :boolean
    ]
  end
end
