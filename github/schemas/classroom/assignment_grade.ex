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
      assignment_name: :string,
      assignment_url: :string,
      github_username: :string,
      group_name: :string,
      points_available: :integer,
      points_awarded: :integer,
      roster_identifier: :string,
      starter_code_url: :string,
      student_repository_name: :string,
      student_repository_url: :string,
      submission_timestamp: :string
    ]
  end
end
