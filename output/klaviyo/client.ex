defmodule Client do
  @moduledoc """
  Provides API endpoints related to client
  """

  @default_client Client

  @doc """
  Bulk Create Client Events

  Create new events to track a profile's activity.

  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only.

  Accepts a maximum of `1000` events per request.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `events:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec bulk_create_client_events(EventsBulkCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def bulk_create_client_events(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :bulk_create_client_events},
      url: "/client/event-bulk-create/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {EventsBulkCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client Back In Stock Subscription

  Subscribe a profile to receive back in stock notifications. Check out [our Back in Stock API guide](https://developers.klaviyo.com/en/docs/how_to_set_up_custom_back_in_stock) for more details.

  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create subscriptions from server-based applications, please use [POST /api/back-in-stock-subscriptions](https://developers.klaviyo.com/en/reference/create_back_in_stock_subscription).<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `catalogs:write`
  `profiles:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec create_client_back_in_stock_subscription(ClientBISSubscriptionCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_client_back_in_stock_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :create_client_back_in_stock_subscription},
      url: "/client/back-in-stock-subscriptions/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {ClientBISSubscriptionCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client Event

  Create a new event to track a profile's activity.

  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create events from server-based applications, please use [POST /api/events](https://developers.klaviyo.com/en/reference/create_event)<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec create_client_event(EventCreateQueryV2.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_client_event(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :create_client_event},
      url: "/client/events/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {EventCreateQueryV2, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or Update Client Profile

  Create and update properties about a profile without tracking an associated event.

  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only. To create profiles from server applications (e.g. custom server-side scripts / applications), please use [POST /api/profiles](https://developers.klaviyo.com/en/reference/create_profile)<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `profiles:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec create_client_profile(OnsiteProfileCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_client_profile(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :create_client_profile},
      url: "/client/profiles/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {OnsiteProfileCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or Update Client Push Token

  Create or update a push token.

  This endpoint is designed to be called from our mobile SDKs ([iOS](https://github.com/klaviyo/klaviyo-swift-sdk) and [Android](https://github.com/klaviyo/klaviyo-android-sdk)).
  You must have push notifications enabled to use this endpoint.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec create_client_push_token(PushTokenCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_client_push_token(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :create_client_push_token},
      url: "/client/push-tokens/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {PushTokenCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Client Subscription

  *Rate limits*:<br>Burst: `100/s`<br>Steady: `700/m`

  **Scopes:**
  `subscriptions:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec create_client_subscription(OnsiteSubscriptionCreateQuery.t(), keyword) :: :ok | :error
  def create_client_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :create_client_subscription},
      url: "/client/subscriptions/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {OnsiteSubscriptionCreateQuery, :t}}],
      response: [{202, :null}],
      opts: opts
    })
  end

  @doc """
  Unregister Client Push Token

  Unregister a push token.

  This endpoint is designed to be called from our mobile SDKs ([iOS](https://github.com/klaviyo/klaviyo-swift-sdk) and [Android](https://github.com/klaviyo/klaviyo-android-sdk)).
  You must have push notifications enabled to use this endpoint.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  """
  @spec unregister_client_push_token(PushTokenUnregisterQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def unregister_client_push_token(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Client, :unregister_client_push_token},
      url: "/client/push-token-unregister/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {PushTokenUnregisterQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
