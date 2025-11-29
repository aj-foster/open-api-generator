defmodule GitHub.Classroom.Assignment do
  @moduledoc """
  Provides struct and types for a Classroom.Assignment
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          accepted: integer,
          classroom: GitHub.Classroom.simple(),
          deadline: DateTime.t() | nil,
          editor: String.t(),
          feedback_pull_requests_enabled: boolean,
          id: integer,
          invitations_enabled: boolean,
          invite_link: String.t(),
          language: String.t(),
          max_members: integer | nil,
          max_teams: integer | nil,
          passing: integer,
          public_repo: boolean,
          slug: String.t(),
          students_are_repo_admins: boolean,
          submitted: integer,
          title: String.t(),
          type: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          accepted: integer,
          classroom: GitHub.Classroom.t(),
          deadline: DateTime.t() | nil,
          editor: String.t(),
          feedback_pull_requests_enabled: boolean,
          id: integer,
          invitations_enabled: boolean,
          invite_link: String.t(),
          language: String.t(),
          max_members: integer | nil,
          max_teams: integer | nil,
          passing: integer,
          public_repo: boolean,
          slug: String.t(),
          starter_code_repository: GitHub.Classroom.Repository.simple(),
          students_are_repo_admins: boolean,
          submitted: integer,
          title: String.t(),
          type: String.t()
        }

  defstruct [
    :__info__,
    :accepted,
    :classroom,
    :deadline,
    :editor,
    :feedback_pull_requests_enabled,
    :id,
    :invitations_enabled,
    :invite_link,
    :language,
    :max_members,
    :max_teams,
    :passing,
    :public_repo,
    :slug,
    :starter_code_repository,
    :students_are_repo_admins,
    :submitted,
    :title,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [
      accepted: :integer,
      classroom: {GitHub.Classroom, :simple},
      deadline: {:union, [{:string, :date_time}, :null]},
      editor: {:string, :generic},
      feedback_pull_requests_enabled: :boolean,
      id: :integer,
      invitations_enabled: :boolean,
      invite_link: {:string, :generic},
      language: {:string, :generic},
      max_members: {:union, [:integer, :null]},
      max_teams: {:union, [:integer, :null]},
      passing: :integer,
      public_repo: :boolean,
      slug: {:string, :generic},
      students_are_repo_admins: :boolean,
      submitted: :integer,
      title: {:string, :generic},
      type: {:enum, ["individual", "group"]}
    ]
  end

  def __fields__(:t) do
    [
      accepted: :integer,
      classroom: {GitHub.Classroom, :t},
      deadline: {:union, [{:string, :date_time}, :null]},
      editor: {:string, :generic},
      feedback_pull_requests_enabled: :boolean,
      id: :integer,
      invitations_enabled: :boolean,
      invite_link: {:string, :generic},
      language: {:string, :generic},
      max_members: {:union, [:integer, :null]},
      max_teams: {:union, [:integer, :null]},
      passing: :integer,
      public_repo: :boolean,
      slug: {:string, :generic},
      starter_code_repository: {GitHub.Classroom.Repository, :simple},
      students_are_repo_admins: :boolean,
      submitted: :integer,
      title: {:string, :generic},
      type: {:enum, ["individual", "group"]}
    ]
  end
end
