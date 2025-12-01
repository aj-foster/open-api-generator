defmodule OpenAI.Operations do
  @moduledoc """
  Provides API endpoints related to operations
  """

  @default_client OpenAI.Client

  @doc """
  Create an organization admin API key

  Create a new admin-level API key for the organization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec admin_api_keys_create(body :: map, opts :: keyword) ::
          {:ok, OpenAI.AdminApiKey.t()} | :error
  def admin_api_keys_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Operations, :admin_api_keys_create},
      url: "/organization/admin_api_keys",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {OpenAI.AdminApiKey, :t}}],
      opts: opts
    })
  end

  @type admin_api_keys_delete_200_json_resp :: %{
          deleted: boolean | nil,
          id: String.t() | nil,
          object: String.t() | nil
        }

  @doc """
  Delete an organization admin API key

  Delete the specified admin API key.
  """
  @spec admin_api_keys_delete(key_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.Operations.admin_api_keys_delete_200_json_resp()} | :error
  def admin_api_keys_delete(key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key_id: key_id],
      call: {OpenAI.Operations, :admin_api_keys_delete},
      url: "/organization/admin_api_keys/#{key_id}",
      method: :delete,
      response: [{200, {OpenAI.Operations, :admin_api_keys_delete_200_json_resp}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a single organization API key

  Get details for a specific organization API key by its ID.
  """
  @spec admin_api_keys_get(key_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.AdminApiKey.t()} | :error
  def admin_api_keys_get(key_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [key_id: key_id],
      call: {OpenAI.Operations, :admin_api_keys_get},
      url: "/organization/admin_api_keys/#{key_id}",
      method: :get,
      response: [{200, {OpenAI.AdminApiKey, :t}}],
      opts: opts
    })
  end

  @doc """
  List organization API keys

  Retrieve a paginated list of organization admin API keys.

  ## Options

    * `after`
    * `order`
    * `limit`

  """
  @spec admin_api_keys_list(opts :: keyword) :: {:ok, OpenAI.ApiKeyList.t()} | :error
  def admin_api_keys_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order])

    client.request(%{
      args: [],
      call: {OpenAI.Operations, :admin_api_keys_list},
      url: "/organization/admin_api_keys",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ApiKeyList, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:admin_api_keys_delete_200_json_resp) do
    [deleted: :boolean, id: :string, object: :string]
  end
end
