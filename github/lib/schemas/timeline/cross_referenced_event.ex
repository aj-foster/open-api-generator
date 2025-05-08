defmodule GitHub.Timeline.CrossReferencedEvent do
  @moduledoc """
  Provides struct and type for a Timeline.CrossReferencedEvent
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHub.User.simple() | nil,
          created_at: DateTime.t(),
          event: String.t(),
          source: GitHub.Timeline.CrossReferencedEventSource.t(),
          updated_at: DateTime.t()
        }

  defstruct [:__info__, :actor, :created_at, :event, :source, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHub.User, :simple},
      created_at: {:string, :date_time},
      event: {:string, :generic},
      source: {GitHub.Timeline.CrossReferencedEventSource, :t},
      updated_at: {:string, :date_time}
    ]
  end
end
