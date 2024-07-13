defmodule GitHub.Interactions do
  @moduledoc """
  Provides API endpoints related to interactions
  """

  @default_client GitHub.Client

  @type get_restrictions_for_authenticated_user_200_json_resp :: %{__info__: map}

  @doc """
  Get interaction restrictions for your public repositories

  Shows which type of GitHub user can interact with your public repositories and when the restriction expires.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/user#get-interaction-restrictions-for-your-public-repositories)

  """
  @spec get_restrictions_for_authenticated_user(keyword) ::
          {:ok, map | GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def get_restrictions_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Interactions, :get_restrictions_for_authenticated_user},
      url: "/user/interaction-limits",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {GitHub.Interaction.Limit.Response, :t},
            {GitHub.Interactions, :get_restrictions_for_authenticated_user_200_json_resp}
          ]}},
        {204, :null}
      ],
      opts: opts
    })
  end

  @type get_restrictions_for_org_200_json_resp :: %{__info__: map}

  @doc """
  Get interaction restrictions for an organization

  Shows which type of GitHub user can interact with this organization and when the restriction expires. If there is no restrictions, you will see an empty response.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/orgs#get-interaction-restrictions-for-an-organization)

  """
  @spec get_restrictions_for_org(String.t(), keyword) ::
          {:ok, map | GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def get_restrictions_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Interactions, :get_restrictions_for_org},
      url: "/orgs/#{org}/interaction-limits",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {GitHub.Interaction.Limit.Response, :t},
            {GitHub.Interactions, :get_restrictions_for_org_200_json_resp}
          ]}}
      ],
      opts: opts
    })
  end

  @type get_restrictions_for_repo_200_json_resp :: %{__info__: map}

  @doc """
  Get interaction restrictions for a repository

  Shows which type of GitHub user can interact with this repository and when the restriction expires. If there are no restrictions, you will see an empty response.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/repos#get-interaction-restrictions-for-a-repository)

  """
  @spec get_restrictions_for_repo(String.t(), String.t(), keyword) ::
          {:ok, map | GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def get_restrictions_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Interactions, :get_restrictions_for_repo},
      url: "/repos/#{owner}/#{repo}/interaction-limits",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {GitHub.Interaction.Limit.Response, :t},
            {GitHub.Interactions, :get_restrictions_for_repo_200_json_resp}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Remove interaction restrictions from your public repositories

  Removes any interaction restrictions from your public repositories.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/user#remove-interaction-restrictions-from-your-public-repositories)

  """
  @spec remove_restrictions_for_authenticated_user(keyword) :: :ok | {:error, GitHub.Error.t()}
  def remove_restrictions_for_authenticated_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Interactions, :remove_restrictions_for_authenticated_user},
      url: "/user/interaction-limits",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove interaction restrictions for an organization

  Removes all interaction restrictions from public repositories in the given organization. You must be an organization owner to remove restrictions.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/orgs#remove-interaction-restrictions-for-an-organization)

  """
  @spec remove_restrictions_for_org(String.t(), keyword) :: :ok | {:error, GitHub.Error.t()}
  def remove_restrictions_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Interactions, :remove_restrictions_for_org},
      url: "/orgs/#{org}/interaction-limits",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Remove interaction restrictions for a repository

  Removes all interaction restrictions from the given repository. You must have owner or admin access to remove restrictions. If the interaction limit is set for the user or organization that owns this repository, you will receive a `409 Conflict` response and will not be able to use this endpoint to change the interaction limit for a single repository.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/repos#remove-interaction-restrictions-for-a-repository)

  """
  @spec remove_restrictions_for_repo(String.t(), String.t(), keyword) ::
          :ok | {:error, GitHub.Error.t()}
  def remove_restrictions_for_repo(owner, repo, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo],
      call: {GitHub.Interactions, :remove_restrictions_for_repo},
      url: "/repos/#{owner}/#{repo}/interaction-limits",
      method: :delete,
      response: [{204, :null}, {409, :null}],
      opts: opts
    })
  end

  @doc """
  Set interaction restrictions for your public repositories

  Temporarily restricts which type of GitHub user can interact with your public repositories. Setting the interaction limit at the user level will overwrite any interaction limits that are set for individual repositories owned by the user.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/user#set-interaction-restrictions-for-your-public-repositories)

  """
  @spec set_restrictions_for_authenticated_user(GitHub.Interaction.Limit.t(), keyword) ::
          {:ok, GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def set_restrictions_for_authenticated_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GitHub.Interactions, :set_restrictions_for_authenticated_user},
      url: "/user/interaction-limits",
      body: body,
      method: :put,
      request: [{"application/json", {GitHub.Interaction.Limit, :t}}],
      response: [
        {200, {GitHub.Interaction.Limit.Response, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set interaction restrictions for an organization

  Temporarily restricts interactions to a certain type of GitHub user in any public repository in the given organization. You must be an organization owner to set these restrictions. Setting the interaction limit at the organization level will overwrite any interaction limits that are set for individual repositories owned by the organization.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/orgs#set-interaction-restrictions-for-an-organization)

  """
  @spec set_restrictions_for_org(String.t(), GitHub.Interaction.Limit.t(), keyword) ::
          {:ok, GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def set_restrictions_for_org(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHub.Interactions, :set_restrictions_for_org},
      url: "/orgs/#{org}/interaction-limits",
      body: body,
      method: :put,
      request: [{"application/json", {GitHub.Interaction.Limit, :t}}],
      response: [
        {200, {GitHub.Interaction.Limit.Response, :t}},
        {422, {GitHub.ValidationError, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Set interaction restrictions for a repository

  Temporarily restricts interactions to a certain type of GitHub user within the given repository. You must have owner or admin access to set these restrictions. If an interaction limit is set for the user or organization that owns this repository, you will receive a `409 Conflict` response and will not be able to use this endpoint to change the interaction limit for a single repository.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/interactions/repos#set-interaction-restrictions-for-a-repository)

  """
  @spec set_restrictions_for_repo(String.t(), String.t(), GitHub.Interaction.Limit.t(), keyword) ::
          {:ok, GitHub.Interaction.Limit.Response.t()} | {:error, GitHub.Error.t()}
  def set_restrictions_for_repo(owner, repo, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [owner: owner, repo: repo, body: body],
      call: {GitHub.Interactions, :set_restrictions_for_repo},
      url: "/repos/#{owner}/#{repo}/interaction-limits",
      body: body,
      method: :put,
      request: [{"application/json", {GitHub.Interaction.Limit, :t}}],
      response: [{200, {GitHub.Interaction.Limit.Response, :t}}, {409, :null}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_restrictions_for_authenticated_user_200_json_resp) do
    []
  end

  def __fields__(:get_restrictions_for_org_200_json_resp) do
    []
  end

  def __fields__(:get_restrictions_for_repo_200_json_resp) do
    []
  end
end
