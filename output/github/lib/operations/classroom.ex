defmodule GitHub.Classroom do
  @moduledoc """
  Provides API endpoints related to classroom
  """
  use GitHub.Encoder

  @default_client GitHub.Client

  @doc """
  Get a classroom

  Gets a GitHub Classroom classroom for the current user. Classroom will only be returned if the current user is an administrator of the GitHub Classroom.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#get-a-classroom)

  """
  @spec get_a_classroom(integer, keyword) ::
          {:ok, GitHub.Classroom.t()} | {:error, GitHub.Error.t()}
  def get_a_classroom(classroom_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [classroom_id: classroom_id],
      call: {GitHub.Classroom, :get_a_classroom},
      url: "/classrooms/#{classroom_id}",
      method: :get,
      response: [{200, {GitHub.Classroom, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get an assignment

  Gets a GitHub Classroom assignment. Assignment will only be returned if the current user is an administrator of the GitHub Classroom for the assignment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#get-an-assignment)

  """
  @spec get_an_assignment(integer, keyword) ::
          {:ok, GitHub.Classroom.Assignment.t()} | {:error, GitHub.Error.t()}
  def get_an_assignment(assignment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [assignment_id: assignment_id],
      call: {GitHub.Classroom, :get_an_assignment},
      url: "/assignments/#{assignment_id}",
      method: :get,
      response: [{200, {GitHub.Classroom.Assignment, :t}}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  Get assignment grades

  Gets grades for a GitHub Classroom assignment. Grades will only be returned if the current user is an administrator of the GitHub Classroom for the assignment.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#get-assignment-grades)

  """
  @spec get_assignment_grades(integer, keyword) ::
          {:ok, [GitHub.Classroom.AssignmentGrade.t()]} | {:error, GitHub.Error.t()}
  def get_assignment_grades(assignment_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [assignment_id: assignment_id],
      call: {GitHub.Classroom, :get_assignment_grades},
      url: "/assignments/#{assignment_id}/grades",
      method: :get,
      response: [{200, [{GitHub.Classroom.AssignmentGrade, :t}]}, {404, {GitHub.BasicError, :t}}],
      opts: opts
    })
  end

  @doc """
  List accepted assignments for an assignment

  Lists any assignment repositories that have been created by students accepting a GitHub Classroom assignment. Accepted assignments will only be returned if the current user is an administrator of the GitHub Classroom for the assignment.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#list-accepted-assignments-for-an-assignment)

  """
  @spec list_accepted_assigments_for_an_assignment(integer, keyword) ::
          {:ok, [GitHub.Classroom.AcceptedAssignment.t()]} | {:error, GitHub.Error.t()}
  def list_accepted_assigments_for_an_assignment(assignment_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [assignment_id: assignment_id],
      call: {GitHub.Classroom, :list_accepted_assigments_for_an_assignment},
      url: "/assignments/#{assignment_id}/accepted_assignments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Classroom.AcceptedAssignment, :t}]}],
      opts: opts
    })
  end

  @doc """
  List assignments for a classroom

  Lists GitHub Classroom assignments for a classroom. Assignments will only be returned if the current user is an administrator of the GitHub Classroom.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#list-assignments-for-a-classroom)

  """
  @spec list_assignments_for_a_classroom(integer, keyword) ::
          {:ok, [GitHub.Classroom.Assignment.simple()]} | {:error, GitHub.Error.t()}
  def list_assignments_for_a_classroom(classroom_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [classroom_id: classroom_id],
      call: {GitHub.Classroom, :list_assignments_for_a_classroom},
      url: "/classrooms/#{classroom_id}/assignments",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Classroom.Assignment, :simple}]}],
      opts: opts
    })
  end

  @doc """
  List classrooms

  Lists GitHub Classroom classrooms for the current user. Classrooms will only be returned if the current user is an administrator of one or more GitHub Classrooms.

  ## Options

    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/classroom/classroom#list-classrooms)

  """
  @spec list_classrooms(keyword) ::
          {:ok, [GitHub.Classroom.simple()]} | {:error, GitHub.Error.t()}
  def list_classrooms(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [],
      call: {GitHub.Classroom, :list_classrooms},
      url: "/classrooms",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Classroom, :simple}]}],
      opts: opts
    })
  end

  @type simple :: %__MODULE__{
          __info__: map,
          archived: boolean,
          id: integer,
          name: String.t(),
          url: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          archived: boolean,
          id: integer,
          name: String.t(),
          organization: GitHub.Classroom.Organization.simple(),
          url: String.t()
        }

  defstruct [:__info__, :archived, :id, :name, :organization, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [archived: :boolean, id: :integer, name: {:string, :generic}, url: {:string, :generic}]
  end

  def __fields__(:t) do
    [
      archived: :boolean,
      id: :integer,
      name: {:string, :generic},
      organization: {GitHub.Classroom.Organization, :simple},
      url: {:string, :generic}
    ]
  end
end
