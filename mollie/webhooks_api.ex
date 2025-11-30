defmodule Mollie.WebhooksAPI do
  @moduledoc """
  Provides API endpoints related to webhooks api
  """

  @default_client Mollie.Client

  @doc """
  Create a webhook

  A webhook must have a name, an url and a list of event types. You can also create webhooks in the webhooks settings section of the Dashboard.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_webhook(body :: map, opts :: keyword) ::
          {:ok, Mollie.CreateWebhook.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_webhook(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.WebhooksAPI, :create_webhook},
      url: "/webhooks",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {Mollie.CreateWebhook, :t}}, {422, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a webhook

  Delete a single webhook object by its webhook ID.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_webhook(id :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def delete_webhook(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.WebhooksAPI, :delete_webhook},
      url: "/webhooks/#{id}",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {204, :null},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a webhook

  Retrieve a single webhook object by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_webhook(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityWebhook.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_webhook(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.WebhooksAPI, :get_webhook},
      url: "/webhooks/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.EntityWebhook, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_webhooks_200__resp :: %{
          _embedded: Mollie.WebhooksAPI.list_webhooks_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_webhooks_200__resp_embedded :: %{webhooks: [Mollie.EntityWebhook.t()]}

  @doc """
  List all webhooks

  Returns a paginated list of your webhooks. If no webhook endpoints are available, the resulting array will be empty. This request should never throw an error.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `eventTypes`: Used to filter out only the webhooks that are subscribed to certain types of events.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_webhooks(opts :: keyword) ::
          {:ok, Mollie.WebhooksAPI.list_webhooks_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_webhooks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:eventTypes, :from, :limit, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.WebhooksAPI, :list_webhooks},
      url: "/webhooks",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.WebhooksAPI, :list_webhooks_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Test a webhook

  Sends a test event to the webhook to verify the endpoint is working as expected.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec test_webhook(id :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def test_webhook(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.WebhooksAPI, :test_webhook},
      url: "/webhooks/#{id}/ping",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {202, :null},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a webhook

  Updates the webhook. You may edit the name, url and the list of subscribed event types.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_webhook(id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Mollie.EntityWebhook.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_webhook(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.WebhooksAPI, :update_webhook},
      url: "/webhooks/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Mollie.EntityWebhook, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_webhooks_200__resp) do
    [
      _embedded: {Mollie.WebhooksAPI, :list_webhooks_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_webhooks_200__resp_embedded) do
    [webhooks: [{Mollie.EntityWebhook, :t}]]
  end
end
