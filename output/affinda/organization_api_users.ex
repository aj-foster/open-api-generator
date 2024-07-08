defmodule OrganizationAPIUsers do
  @moduledoc """
  Provides API endpoints related to organization api users
  """

  @default_client Client

  @doc """
  Create an API user

  Create an API user
  """
  @spec create_api_user(ApiUserCreate.t(), keyword) ::
          {:ok, ApiUserWithKey.t()} | {:error, RequestError.t()}
  def create_api_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OrganizationAPIUsers, :create_api_user},
      url: "/v3/api_users",
      body: body,
      method: :post,
      request: [{"application/json", {ApiUserCreate, :t}}],
      response: [
        {201, {ApiUserWithKey, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an API user

  Deletes the specified API user from the database.
  """
  @spec delete_api_user(integer, keyword) :: :ok | {:error, RequestError.t()}
  def delete_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {OrganizationAPIUsers, :delete_api_user},
      url: "/v3/api_users/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_api_users_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [ApiUserWithoutKey.t()]
        }

  @doc """
  Get list of all API users

  Returns your API users.

  ## Options

    * `organization`: Filter by organization.

  """
  @spec get_all_api_users(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_all_api_users(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:organization])

    client.request(%{
      args: [],
      call: {OrganizationAPIUsers, :get_all_api_users},
      url: "/v3/api_users",
      method: :get,
      query: query,
      response: [
        {200, {OrganizationAPIUsers, :get_all_api_users_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific API user

  Return a specific API user.
  """
  @spec get_api_user(integer, keyword) ::
          {:ok, ApiUserWithoutKey.t()} | {:error, RequestError.t()}
  def get_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {OrganizationAPIUsers, :get_api_user},
      url: "/v3/api_users/#{id}",
      method: :get,
      response: [
        {200, {ApiUserWithoutKey, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Regenerate API key for an API user

  Regenerate API key for an API user.
  """
  @spec regenerate_api_key_for_api_user(integer, keyword) ::
          {:ok, ApiUserWithKey.t()} | {:error, RequestError.t()}
  def regenerate_api_key_for_api_user(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {OrganizationAPIUsers, :regenerate_api_key_for_api_user},
      url: "/v3/api_users/#{id}/regenerate_api_key",
      method: :post,
      response: [
        {200, {ApiUserWithKey, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an API user

  Update data of an API user.
  """
  @spec update_api_user(integer, ApiUserUpdate.t(), keyword) ::
          {:ok, ApiUserWithoutKey.t()} | {:error, RequestError.t()}
  def update_api_user(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {OrganizationAPIUsers, :update_api_user},
      url: "/v3/api_users/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ApiUserUpdate, :t}}],
      response: [
        {200, {ApiUserWithoutKey, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_api_users_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{ApiUserWithoutKey, :t}]
    ]
  end
end
