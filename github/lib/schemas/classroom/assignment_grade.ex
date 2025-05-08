defmodule GitHub.Classroom.AssignmentGrade do
  @moduledoc """
  Provides struct and type for a Classroom.AssignmentGrade
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          assignment_name: String.t(),
          assignment_url: String.t(),
          github_username: String.t(),
          group_name: String.t() | nil,
          points_available: integer,
          points_awarded: integer,
          roster_identifier: String.t(),
          starter_code_url: String.t(),
          student_repository_name: String.t(),
          student_repository_url: String.t(),
          submission_timestamp: String.t()
        }

  defstruct [
    :__info__,
    :assignment_name,
    :assignment_url,
    :github_username,
    :group_name,
    :points_available,
    :points_awarded,
    :roster_identifier,
    :starter_code_url,
    :student_repository_name,
    :student_repository_url,
    :submission_timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignment_name: {:string, :generic},
      assignment_url: {:string, :generic},
      github_username: {:string, :generic},
      group_name: {:string, :generic},
      points_available: :integer,
      points_awarded: :integer,
      roster_identifier: {:string, :generic},
      starter_code_url: {:string, :generic},
      student_repository_name: {:string, :generic},
      student_repository_url: {:string, :generic},
      submission_timestamp: {:string, :generic}
    ]
  end
end
