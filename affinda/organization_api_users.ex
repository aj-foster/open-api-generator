defmodule Affinda.OrganizationAPIUsers do
  @moduledoc """
  Provides API endpoints related to organization api users
  """

  @default_client Affinda.Client

  @doc """
  Create an API user

  Create an API user

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_api_user(body :: Affinda.ApiUserCreate.t(), opts :: keyword) ::
          {:ok, Affinda.ApiUserWithKey.t()} | {:error, Affinda.RequestError.t()}
  def create_api_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.OrganizationAPIUsers, :create_api_user},
      url: "/v3/api_users",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.ApiUserCreate, :t}}],
      response: [
        {201, {Affinda.ApiUserWithKey, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an API user

  Deletes the specified API user from the database.
  """
  @spec delete_api_user(id :: integer, opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.OrganizationAPIUsers, :delete_api_user},
      url: "/v3/api_users/#{id}",
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

  @type get_all_api_users_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.ApiUserWithoutKey.t()]
        }

  @doc """
  Get list of all API users

  Returns your API users.

  ## Options

    * `organization`: Filter by organization.

  """
  @spec get_all_api_users(opts :: keyword) ::
          {:ok, Affinda.OrganizationAPIUsers.get_all_api_users_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_api_users(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization])

    client.request(%{
      args: [],
      call: {Affinda.OrganizationAPIUsers, :get_all_api_users},
      url: "/v3/api_users",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.OrganizationAPIUsers, :get_all_api_users_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific API user

  Return a specific API user.
  """
  @spec get_api_user(id :: integer, opts :: keyword) ::
          {:ok, Affinda.ApiUserWithoutKey.t()} | {:error, Affinda.RequestError.t()}
  def get_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.OrganizationAPIUsers, :get_api_user},
      url: "/v3/api_users/#{id}",
      method: :get,
      response: [
        {200, {Affinda.ApiUserWithoutKey, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Regenerate API key for an API user

  Regenerate API key for an API user.
  """
  @spec regenerate_api_key_for_api_user(id :: integer, opts :: keyword) ::
          {:ok, Affinda.ApiUserWithKey.t()} | {:error, Affinda.RequestError.t()}
  def regenerate_api_key_for_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.OrganizationAPIUsers, :regenerate_api_key_for_api_user},
      url: "/v3/api_users/#{id}/regenerate_api_key",
      method: :post,
      response: [
        {200, {Affinda.ApiUserWithKey, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an API user

  Update data of an API user.

  ## Request Body

  **Content Types**: `application/json`

  API user to update
  """
  @spec update_api_user(id :: integer, body :: Affinda.ApiUserUpdate.t(), opts :: keyword) ::
          {:ok, Affinda.ApiUserWithoutKey.t()} | {:error, Affinda.RequestError.t()}
  def update_api_user(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Affinda.OrganizationAPIUsers, :update_api_user},
      url: "/v3/api_users/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.ApiUserUpdate, :t}}],
      response: [
        {200, {Affinda.ApiUserWithoutKey, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_api_users_200_json_resp) do
    [
      count: :integer,
      next: :string,
      previous: :string,
      results: [{Affinda.ApiUserWithoutKey, :t}]
    ]
  end
end
