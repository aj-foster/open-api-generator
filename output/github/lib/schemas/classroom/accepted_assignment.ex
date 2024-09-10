defmodule GitHub.Classroom.AcceptedAssignment do
  @moduledoc """
  Provides struct and type for a Classroom.AcceptedAssignment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          assignment: GitHub.Classroom.Assignment.simple(),
          commit_count: integer,
          grade: String.t(),
          id: integer,
          passing: boolean,
          repository: GitHub.Classroom.Repository.simple(),
          students: [GitHub.Classroom.User.simple()],
          submitted: boolean
        }

  defstruct [
    :__info__,
    :assignment,
    :commit_count,
    :grade,
    :id,
    :passing,
    :repository,
    :students,
    :submitted
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assignment: {GitHub.Classroom.Assignment, :simple},
      commit_count: :integer,
      grade: {:string, :generic},
      id: :integer,
      passing: :boolean,
      repository: {GitHub.Classroom.Repository, :simple},
      students: [{GitHub.Classroom.User, :simple}],
      submitted: :boolean
    ]
  end
end
