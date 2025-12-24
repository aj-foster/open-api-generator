defmodule Affinda.DocumentAPIWorkspace do
  @moduledoc """
  Provides API endpoints related to document api workspace
  """

  @default_client Affinda.Client

  @doc """
  Create a workspace

  Create a workspace

  ## Request Body

  **Content Types**: `application/json`

  Workspace to create
  """
  @spec create_workspace(body :: Affinda.WorkspaceCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Workspace.t()} | {:error, Affinda.RequestError.t()}
  def create_workspace(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIWorkspace, :create_workspace},
      url: "/v3/workspaces",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.WorkspaceCreate, :t}}],
      response: [
        {201, {Affinda.Workspace, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a workspace membership

  Create a workspace membership.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_workspace_membership(
          body :: Affinda.WorkspaceMembershipCreate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.WorkspaceMembership.t()} | {:error, Affinda.RequestError.t()}
  def create_workspace_membership(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIWorkspace, :create_workspace_membership},
      url: "/v3/workspace_memberships",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.WorkspaceMembershipCreate, :t}}],
      response: [
        {201, {Affinda.WorkspaceMembership, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a workspace

  Deletes the specified workspace from the database.
  """
  @spec delete_workspace(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_workspace(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIWorkspace, :delete_workspace},
      url: "/v3/workspaces/#{identifier}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a workspace membership

  Remove an user from a workspace.
  """
  @spec delete_workspace_membership(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_workspace_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIWorkspace, :delete_workspace_membership},
      url: "/v3/workspace_memberships/#{identifier}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_workspace_memberships_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.WorkspaceMembership.t()]
        }

  @doc """
  Get list of all workspace memberships

  Returns the memberships of your workspaces.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `workspace`: Filter by workspace.
    * `user`: Partial text match on user's email, case-insensitive.

  """
  @spec get_all_workspace_memberships(opts :: keyword) ::
          {:ok, Affinda.DocumentAPIWorkspace.get_all_workspace_memberships_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_workspace_memberships(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :user, :workspace])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIWorkspace, :get_all_workspace_memberships},
      url: "/v3/workspace_memberships",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.DocumentAPIWorkspace, :get_all_workspace_memberships_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get list of all workspaces

  Returns your workspaces.

  ## Options

    * `organization`: Filter by organization.
    * `name`: Filter by name.

  """
  @spec get_all_workspaces(opts :: keyword) ::
          {:ok, [Affinda.Workspace.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_workspaces(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name, :organization])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIWorkspace, :get_all_workspaces},
      url: "/v3/workspaces",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.Workspace, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get usage by workspace

  Return monthly credits consumption of a workspace.

  ## Options

    * `start`: Start date of the period to retrieve. Format: YYYY-MM
    * `end`: End date of the period to retrieve. Format: YYYY-MM

  """
  @spec get_usage_by_workspace(identifier :: String.t(), opts :: keyword) ::
          {:ok, [Affinda.UsageByWorkspace.t()]} | {:error, Affinda.RequestError.t()}
  def get_usage_by_workspace(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:end, :start])

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIWorkspace, :get_usage_by_workspace},
      url: "/v3/workspaces/#{identifier}/usage",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.UsageByWorkspace, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific workspace

  Return a specific workspace.
  """
  @spec get_workspace(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.Workspace.t()} | {:error, Affinda.RequestError.t()}
  def get_workspace(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIWorkspace, :get_workspace},
      url: "/v3/workspaces/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.Workspace, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific workspace membership

  Return a specific workspace membership.
  """
  @spec get_workspace_membership(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.WorkspaceMembership.t()} | {:error, Affinda.RequestError.t()}
  def get_workspace_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIWorkspace, :get_workspace_membership},
      url: "/v3/workspace_memberships/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.WorkspaceMembership, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a workspace

  Update a workspace.

  ## Request Body

  **Content Types**: `application/json`

  Workspace data to update
  """
  @spec update_workspace(
          identifier :: String.t(),
          body :: Affinda.WorkspaceUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.Workspace.t()} | {:error, Affinda.RequestError.t()}
  def update_workspace(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIWorkspace, :update_workspace},
      url: "/v3/workspaces/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.WorkspaceUpdate, :t}}],
      response: [
        {200, {Affinda.Workspace, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_workspace_memberships_200_json_resp) do
    [
      count: :integer,
      next: :string,
      previous: :string,
      results: [{Affinda.WorkspaceMembership, :t}]
    ]
  end
end
