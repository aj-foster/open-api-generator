defmodule GitHub.Copilot.SeatDetails do
  @moduledoc """
  Provides struct and type for a Copilot.SeatDetails
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          assignee: GitHub.Organization.t() | GitHub.Team.t() | GitHub.User.simple(),
          assigning_team: GitHub.Team.t() | nil,
          created_at: DateTime.t(),
          last_activity_at: DateTime.t() | nil,
          last_activity_editor: String.t() | nil,
          pending_cancellation_date: Date.t() | nil,
          updated_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :assignee,
    :assigning_team,
    :created_at,
    :last_activity_at,
    :last_activity_editor,
    :pending_cancellation_date,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignee: {:union, [{GitHub.Organization, :t}, {GitHub.Team, :t}, {GitHub.User, :simple}]},
      assigning_team: {GitHub.Team, :t},
      created_at: {:string, :date_time},
      last_activity_at: {:union, [{:string, :date_time}, :null]},
      last_activity_editor: {:union, [{:string, :generic}, :null]},
      pending_cancellation_date: {:union, [{:string, :date}, :null]},
      updated_at: {:string, :date_time}
    ]
  end
end
