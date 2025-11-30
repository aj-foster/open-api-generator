defmodule Klaviyo.Client do
  @moduledoc """
  Provides API endpoints related to client
  """

  @default_client Klaviyo.Client

  @doc """
  Bulk Create Client Events

  Create new events to track a profile's activity.

  This endpoint is specifically designed to be called from publicly-browseable, client-side environments only.

  Accepts a maximum of `1000` events per request.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `events:write`

  ## Options

    * `company_id`: Your Public API Key / Site ID. See [this article](https://help.klaviyo.com/hc/en-us/articles/115005062267) for more details.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_create_client_events(body :: Klaviyo.EventsBulkCreateQuery.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def bulk_create_client_events(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :bulk_create_client_events},
      url: "/client/event-bulk-create/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.EventsBulkCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_client_back_in_stock_subscription(
          body :: Klaviyo.ClientBISSubscriptionCreateQuery.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_client_back_in_stock_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :create_client_back_in_stock_subscription},
      url: "/client/back-in-stock-subscriptions/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.ClientBISSubscriptionCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_client_event(body :: Klaviyo.EventCreateQueryV2.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_client_event(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :create_client_event},
      url: "/client/events/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.EventCreateQueryV2, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_client_profile(body :: Klaviyo.OnsiteProfileCreateQuery.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_client_profile(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :create_client_profile},
      url: "/client/profiles/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.OnsiteProfileCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_client_push_token(body :: Klaviyo.PushTokenCreateQuery.t(), opts :: keyword) ::
          :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def create_client_push_token(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :create_client_push_token},
      url: "/client/push-tokens/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.PushTokenCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
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

  ## Request Body

  **Content Types**: `application/json`

  Creates a subscription and consent records for Email and or SMS channels based on the provided email and phone_number
  attributes respectively. One of either email or phone_number must be provided. To create a subscription and consent
  record for only one channel but still include the other channel as a profile property the consent channel can
  be provided as a top level attribute and the other channel can be included in the properties object.
  """
  @spec create_client_subscription(
          body :: Klaviyo.OnsiteSubscriptionCreateQuery.t(),
          opts :: keyword
        ) :: :ok | :error
  def create_client_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :create_client_subscription},
      url: "/client/subscriptions/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.OnsiteSubscriptionCreateQuery, :t}}],
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

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec unregister_client_push_token(
          body :: Klaviyo.PushTokenUnregisterQuery.t(),
          opts :: keyword
        ) :: :ok | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def unregister_client_push_token(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:company_id])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Client, :unregister_client_push_token},
      url: "/client/push-token-unregister/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.PushTokenUnregisterQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
