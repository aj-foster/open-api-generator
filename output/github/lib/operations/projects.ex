defmodule GitHub.Projects do
  @moduledoc """
  Provides API endpoints related to projects
  """

  @default_client GitHub.Client

  @doc """
  Add project collaborator

  Adds a collaborator to an organization project and sets their permission level. You must be an organization owner or a project `admin` to add a collaborator.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/collaborators#add-project-collaborator)

  """
  @spec add_collaborator(integer, String.t(), map | nil, keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def add_collaborator(project_id, username, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, username: username, body: body],
      call: {GitHub.Projects, :add_collaborator},
      url: "/projects/#{project_id}/collaborators/#{username}",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [:map, :null]}}],
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @type create_card_503_json_resp :: %{
          __info__: map,
          code: String.t() | nil,
          documentation_url: String.t() | nil,
          errors: [GitHub.ProjectsErrors.create_card_503_json_resp()] | nil,
          message: String.t() | nil
        }

  @doc """
  Create a project card

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#create-a-project-card)

  """
  @spec create_card(integer, map, keyword) ::
          {:ok, GitHub.Project.Card.t()} | {:error, GitHub.Error.t()}
  def create_card(column_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [column_id: column_id, body: body],
      call: {GitHub.Projects, :create_card},
      url: "/projects/columns/#{column_id}/cards",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Project.Card, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {:union, [{GitHub.ValidationError, :simple}, {GitHub.ValidationError, :t}]}},
        {503, {GitHub.Projects, :create_card_503_json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a project column

  Creates a new project column.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#create-a-project-column)

  """
  @spec create_column(integer, map, keyword) ::
          {:ok, GitHub.Project.Column.t()} | {:error, GitHub.Error.t()}
  def create_column(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {GitHub.Projects, :create_column},
      url: "/projects/#{project_id}/columns",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Project.Column, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a user project

  Creates a user project board. Returns a `410 Gone` status if the user does not have existing classic projects. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#create-a-user-project)

  """
  @spec create_for_authenticated_user(map, keyword) ::
          {:ok, GitHub.Project.t()} | {:error, GitHub.Error.t()}
  def create_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Projects, :create_for_authenticated_user},
      url: "/user/projects",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Project, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Create an organization project

  Creates an organization project board. Returns a `410 Gone` status if projects are disabled in the organization or if the organization does not have existing classic projects. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#create-an-organization-project)

  """
  @spec create_for_org(String.t(), map, keyword) ::
          {:ok, GitHub.Project.t()} | {:error, GitHub.Error.t()}
  def create_for_org(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHub.Projects, :create_for_org},
      url: "/orgs/#{org}/projects",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Project, :t}},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Create a repository project

  Creates a repository project board. Returns a `410 Gone` status if projects are disabled in the repository or if the repository does not have existing classic projects. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#create-a-repository-project)

  """
  @spec create_for_repo(String.t(), String.t(), map, keyword) ::
          {:ok, GitHub.Project.t()} | {:error, GitHub.Error.t()}
  def create_for_repo(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Projects, :create_for_repo},
      url: "/repos/#{owner}/#{repo}/projects",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Project, :t}},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @type delete_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          errors: [String.t()] | nil,
          message: String.t() | nil
        }

  @doc """
  Delete a project

  Deletes a project board. Returns a `404 Not Found` status if projects are disabled.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#delete-a-project)

  """
  @spec delete(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete(project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id],
      call: {GitHub.Projects, :delete},
      url: "/projects/#{project_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.Projects, :delete_403_json_resp}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @type delete_card_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          errors: [String.t()] | nil,
          message: String.t() | nil
        }

  @doc """
  Delete a project card

  Deletes a project card

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#delete-a-project-card)

  """
  @spec delete_card(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_card(card_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [card_id: card_id],
      call: {GitHub.Projects, :delete_card},
      url: "/projects/columns/cards/#{card_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.Projects, :delete_card_403_json_resp}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a project column

  Deletes a project column.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#delete-a-project-column)

  """
  @spec delete_column(integer, keyword) :: :ok | {:error, GitHub.Error.t()}
  def delete_column(column_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [column_id: column_id],
      call: {GitHub.Projects, :delete_column},
      url: "/projects/columns/#{column_id}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a project

  Gets a project by its `id`. Returns a `404 Not Found` status if projects are disabled. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#get-a-project)

  """
  @spec get(integer, keyword) :: {:ok, GitHub.Project.t()} | {:error, GitHub.Error.t()}
  def get(project_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id],
      call: {GitHub.Projects, :get},
      url: "/projects/#{project_id}",
      method: :get,
      response: [
        {200, {GitHub.Project, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a project card

  Gets information about a project card.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#get-a-project-card)

  """
  @spec get_card(integer, keyword) :: {:ok, GitHub.Project.Card.t()} | {:error, GitHub.Error.t()}
  def get_card(card_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [card_id: card_id],
      call: {GitHub.Projects, :get_card},
      url: "/projects/columns/cards/#{card_id}",
      method: :get,
      response: [
        {200, {GitHub.Project.Card, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a project column

  Gets information about a project column.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#get-a-project-column)

  """
  @spec get_column(integer, keyword) ::
          {:ok, GitHub.Project.Column.t()} | {:error, GitHub.Error.t()}
  def get_column(column_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [column_id: column_id],
      call: {GitHub.Projects, :get_column},
      url: "/projects/columns/#{column_id}",
      method: :get,
      response: [
        {200, {GitHub.Project.Column, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get project permission for a user

  Returns the collaborator's permission level for an organization project. Possible values for the `permission` key: `admin`, `write`, `read`, `none`. You must be an organization owner or a project `admin` to review a user's permission level.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/collaborators#get-project-permission-for-a-user)

  """
  @spec get_permission_for_user(integer, String.t(), keyword) ::
          {:ok, GitHub.Project.CollaboratorPermission.t()} | {:error, GitHub.Error.t()}
  def get_permission_for_user(project_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, username: username],
      call: {GitHub.Projects, :get_permission_for_user},
      url: "/projects/#{project_id}/collaborators/#{username}/permission",
      method: :get,
      response: [
        {200, {GitHub.Project.CollaboratorPermission, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List project cards

  Lists the project cards in a project.

  ## Options

    * `archived_state`: Filters the project cards that are returned by the card's state.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#list-project-cards)

  """
  @spec list_cards(integer, keyword) ::
          {:ok, [GitHub.Project.Card.t()]} | {:error, GitHub.Error.t()}
  def list_cards(column_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived_state, :page, :per_page])

    client.request(%{
      args: [column_id: column_id],
      call: {GitHub.Projects, :list_cards},
      url: "/projects/columns/#{column_id}/cards",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Project.Card, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List project collaborators

  Lists the collaborators for an organization project. For a project, the list of collaborators includes outside collaborators, organization members that are direct collaborators, organization members with access through team memberships, organization members with access through default organization permissions, and organization owners. You must be an organization owner or a project `admin` to list collaborators.

  ## Options

    * `affiliation`: Filters the collaborators by their affiliation. `outside` means outside collaborators of a project that are not a member of the project's organization. `direct` means collaborators with permissions to a project, regardless of organization membership status. `all` means all collaborators the authenticated user can see.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/collaborators#list-project-collaborators)

  """
  @spec list_collaborators(integer, keyword) ::
          {:ok, [GitHub.User.simple()]} | {:error, GitHub.Error.t()}
  def list_collaborators(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:affiliation, :page, :per_page])

    client.request(%{
      args: [project_id: project_id],
      call: {GitHub.Projects, :list_collaborators},
      url: "/projects/#{project_id}/collaborators",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.User, :simple}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List project columns

  Lists the project columns in a project.

  ## Options

    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#list-project-columns)

  """
  @spec list_columns(integer, keyword) ::
          {:ok, [GitHub.Project.Column.t()]} | {:error, GitHub.Error.t()}
  def list_columns(project_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page])

    client.request(%{
      args: [project_id: project_id],
      call: {GitHub.Projects, :list_columns},
      url: "/projects/#{project_id}/columns",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Project.Column, :t}]},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  List organization projects

  Lists the projects in an organization. Returns a `404 Not Found` status if projects are disabled in the organization. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Options

    * `state`: Indicates the state of the projects to return.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#list-organization-projects)

  """
  @spec list_for_org(String.t(), keyword) ::
          {:ok, [GitHub.Project.t()]} | {:error, GitHub.Error.t()}
  def list_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :state])

    client.request(%{
      args: [org: org],
      call: {GitHub.Projects, :list_for_org},
      url: "/orgs/#{org}/projects",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Project, :t}]}, {422, {GitHub.ValidationError, :simple}}],
      opts: opts
    })
  end

  @doc """
  List repository projects

  Lists the projects in a repository. Returns a `404 Not Found` status if projects are disabled in the repository. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Options

    * `state`: Indicates the state of the projects to return.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#list-repository-projects)

  """
  @spec list_for_repo(String.t(), String.t(), keyword) ::
          {:ok, [GitHub.Project.t()]} | {:error, GitHub.Error.t()}
  def list_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :state])

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Projects, :list_for_repo},
      url: "/repos/#{owner}/#{repo}/projects",
      method: :get,
      query: query,
      response: [
        {200, [{GitHub.Project, :t}]},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  List user projects

  Lists projects for a user.

  ## Options

    * `state`: Indicates the state of the projects to return.
    * `per_page`: The number of results per page (max 100). For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."
    * `page`: The page number of the results to fetch. For more information, see "[Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api)."

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#list-user-projects)

  """
  @spec list_for_user(String.t(), keyword) ::
          {:ok, [GitHub.Project.t()]} | {:error, GitHub.Error.t()}
  def list_for_user(username, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page, :per_page, :state])

    client.request(%{
      args: [username: username],
      call: {GitHub.Projects, :list_for_user},
      url: "/users/#{username}/projects",
      method: :get,
      query: query,
      response: [{200, [{GitHub.Project, :t}]}, {422, {GitHub.ValidationError, :t}}],
      opts: opts
    })
  end

  @type move_card_201_json_resp :: %{__info__: map}

  @type move_card_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          errors: [GitHub.ProjectsErrors.move_card_403_json_resp()] | nil,
          message: String.t() | nil
        }

  @type move_card_503_json_resp :: %{
          __info__: map,
          code: String.t() | nil,
          documentation_url: String.t() | nil,
          errors: [GitHub.ProjectsErrors.move_card_503_json_resp()] | nil,
          message: String.t() | nil
        }

  @doc """
  Move a project card

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#move-a-project-card)

  """
  @spec move_card(integer, map, keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def move_card(card_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [card_id: card_id, body: body],
      call: {GitHub.Projects, :move_card},
      url: "/projects/columns/cards/#{card_id}/moves",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Projects, :move_card_201_json_resp}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.Projects, :move_card_403_json_resp}},
        {422, {GitHub.ValidationError, :t}},
        {503, {GitHub.Projects, :move_card_503_json_resp}}
      ],
      opts: opts
    })
  end

  @type move_column_201_json_resp :: %{__info__: map}

  @doc """
  Move a project column

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#move-a-project-column)

  """
  @spec move_column(integer, map, keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def move_column(column_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [column_id: column_id, body: body],
      call: {GitHub.Projects, :move_column},
      url: "/projects/columns/#{column_id}/moves",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {GitHub.Projects, :move_column_201_json_resp}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove user as a collaborator

  Removes a collaborator from an organization project. You must be an organization owner or a project `admin` to remove a collaborator.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/collaborators#remove-user-as-a-collaborator)

  """
  @spec remove_collaborator(integer, String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def remove_collaborator(project_id, username, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, username: username],
      call: {GitHub.Projects, :remove_collaborator},
      url: "/projects/#{project_id}/collaborators/#{username}",
      method: :delete,
      response: [
        {204, :null},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @type update_403_json_resp :: %{
          __info__: map,
          documentation_url: String.t() | nil,
          errors: [String.t()] | nil,
          message: String.t() | nil
        }

  @doc """
  Update a project

  Updates a project board's information. Returns a `404 Not Found` status if projects are disabled. If you do not have sufficient privileges to perform this action, a `401 Unauthorized` or `410 Gone` status is returned.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/projects#update-a-project)

  """
  @spec update(integer, map, keyword) :: {:ok, GitHub.Project.t()} | {:error, GitHub.Error.t()}
  def update(project_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [project_id: project_id, body: body],
      call: {GitHub.Projects, :update},
      url: "/projects/#{project_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Project, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.Projects, :update_403_json_resp}},
        {404, :null},
        {410, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an existing project card

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/cards#update-an-existing-project-card)

  """
  @spec update_card(integer, map, keyword) ::
          {:ok, GitHub.Project.Card.t()} | {:error, GitHub.Error.t()}
  def update_card(card_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [card_id: card_id, body: body],
      call: {GitHub.Projects, :update_card},
      url: "/projects/columns/cards/#{card_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Project.Card, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}},
        {422, {GitHub.ValidationError, :simple}}
      ],
      opts: opts
    })
  end

  @doc """
  Update an existing project column

  ## Resources

    * [API method documentation](https://docs.github.com/rest/projects/columns#update-an-existing-project-column)

  """
  @spec update_column(integer, map, keyword) ::
          {:ok, GitHub.Project.Column.t()} | {:error, GitHub.Error.t()}
  def update_column(column_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [column_id: column_id, body: body],
      call: {GitHub.Projects, :update_column},
      url: "/projects/columns/#{column_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {GitHub.Project.Column, :t}},
        {304, :null},
        {401, {GitHub.BasicError, :t}},
        {403, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_card_503_json_resp) do
    [
      code: {:string, :generic},
      documentation_url: {:string, :generic},
      errors: [{GitHub.ProjectsErrors, :create_card_503_json_resp}],
      message: {:string, :generic}
    ]
  end

  def __fields__(:delete_403_json_resp) do
    [
      documentation_url: {:string, :generic},
      errors: [string: :generic],
      message: {:string, :generic}
    ]
  end

  def __fields__(:delete_card_403_json_resp) do
    [
      documentation_url: {:string, :generic},
      errors: [string: :generic],
      message: {:string, :generic}
    ]
  end

  def __fields__(:move_card_201_json_resp) do
    []
  end

  def __fields__(:move_card_403_json_resp) do
    [
      documentation_url: {:string, :generic},
      errors: [{GitHub.ProjectsErrors, :move_card_403_json_resp}],
      message: {:string, :generic}
    ]
  end

  def __fields__(:move_card_503_json_resp) do
    [
      code: {:string, :generic},
      documentation_url: {:string, :generic},
      errors: [{GitHub.ProjectsErrors, :move_card_503_json_resp}],
      message: {:string, :generic}
    ]
  end

  def __fields__(:move_column_201_json_resp) do
    []
  end

  def __fields__(:update_403_json_resp) do
    [
      documentation_url: {:string, :generic},
      errors: [string: :generic],
      message: {:string, :generic}
    ]
  end
end
