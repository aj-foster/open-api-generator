defmodule Mollie.SubscriptionsAPI do
  @moduledoc """
  Provides API endpoints related to subscriptions api
  """

  @default_client Mollie.Client

  @doc """
  Cancel subscription

  Cancel an existing subscription. Canceling a subscription has no effect on the mandates of the customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec cancel_subscription(
          customerId :: String.t(),
          subscriptionId :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Mollie.SubscriptionResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def cancel_subscription(customerId, subscriptionId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, subscriptionId: subscriptionId, body: body],
      call: {Mollie.SubscriptionsAPI, :cancel_subscription},
      url: "/customers/#{customerId}/subscriptions/#{subscriptionId}",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{200, {Mollie.SubscriptionResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create subscription

  With subscriptions, you can schedule recurring payments to take place at regular intervals.

  For example, by simply specifying an `amount` and an `interval`, you can create an endless subscription to charge a
  monthly fee, until you cancel the subscription.

  Or, you could use the times parameter to only charge a limited number of times, for example to split a big
  transaction in multiple parts.

  A few example usages:

  `amount[currency]="EUR"` `amount[value]="5.00"` `interval="2 weeks"`
  Your customer will be charged €5 once every two weeks.

  `amount[currency]="EUR"` `amount[value]="20.00"` `interval="1 day" times=5`
  Your customer will be charged €20 every day, for five consecutive days.

  `amount[currency]="EUR"` `amount[value]="10.00"` `interval="1 month"`
  `startDate="2018-04-30"`
  Your customer will be charged €10 on the last day of each month, starting in April 2018.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_subscription(
          customerId :: String.t(),
          body :: Mollie.SubscriptionRequest.t(),
          opts :: keyword
        ) :: {:ok, Mollie.SubscriptionResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_subscription(customerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, body: body],
      call: {Mollie.SubscriptionsAPI, :create_subscription},
      url: "/customers/#{customerId}/subscriptions",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.SubscriptionRequest, :t}}],
      response: [{201, {Mollie.SubscriptionResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get subscription

  Retrieve a single subscription by its ID and the ID of its parent customer.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_subscription(customerId :: String.t(), subscriptionId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SubscriptionResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_subscription(customerId, subscriptionId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [customerId: customerId, subscriptionId: subscriptionId],
      call: {Mollie.SubscriptionsAPI, :get_subscription},
      url: "/customers/#{customerId}/subscriptions/#{subscriptionId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.SubscriptionResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_all_subscriptions_200__resp :: %{
          _embedded: Mollie.SubscriptionsAPI.list_all_subscriptions_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_all_subscriptions_200__resp_embedded :: %{
          subscriptions: [Mollie.SubscriptionResponse.t()] | nil
        }

  @doc """
  List all subscriptions

  Retrieve all subscriptions initiated across all your customers.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to retrieve subscriptions for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` is already implied.
      
      To retrieve all subscriptions across the organization, use an organization-level API credential and omit the
      `profileId` parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_all_subscriptions(opts :: keyword) ::
          {:ok, Mollie.SubscriptionsAPI.list_all_subscriptions_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_all_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :profileId, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.SubscriptionsAPI, :list_all_subscriptions},
      url: "/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SubscriptionsAPI, :list_all_subscriptions_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_subscription_payments_200__resp :: %{
          _embedded: Mollie.SubscriptionsAPI.list_subscription_payments_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_subscription_payments_200__resp_embedded :: %{
          payments: [Mollie.PaymentResponse.t()] | nil
        }

  @doc """
  List subscription payments

  Retrieve all payments of a specific subscription.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate
      the result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve the resources for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` can be omitted. For
      organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_subscription_payments(
          customerId :: String.t(),
          subscriptionId :: String.t(),
          opts :: keyword
        ) ::
          {:ok, Mollie.SubscriptionsAPI.list_subscription_payments_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_subscription_payments(customerId, subscriptionId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [customerId: customerId, subscriptionId: subscriptionId],
      call: {Mollie.SubscriptionsAPI, :list_subscription_payments},
      url: "/customers/#{customerId}/subscriptions/#{subscriptionId}/payments",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SubscriptionsAPI, :list_subscription_payments_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_subscriptions_200__resp :: %{
          _embedded: Mollie.SubscriptionsAPI.list_subscriptions_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_subscriptions_200__resp_embedded :: %{
          subscriptions: [Mollie.SubscriptionResponse.t()] | nil
        }

  @doc """
  List customer subscriptions

  Retrieve all subscriptions of a customer.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_subscriptions(customerId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SubscriptionsAPI.list_subscriptions_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_subscriptions(customerId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [customerId: customerId],
      call: {Mollie.SubscriptionsAPI, :list_subscriptions},
      url: "/customers/#{customerId}/subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SubscriptionsAPI, :list_subscriptions_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update subscription

  Update an existing subscription.

  Canceled subscriptions cannot be updated.

  For an in-depth explanation of each parameter, refer to the [Create subscription](create-subscription) endpoint.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_subscription(
          customerId :: String.t(),
          subscriptionId :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Mollie.SubscriptionResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_subscription(customerId, subscriptionId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, subscriptionId: subscriptionId, body: body],
      call: {Mollie.SubscriptionsAPI, :update_subscription},
      url: "/customers/#{customerId}/subscriptions/#{subscriptionId}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Mollie.SubscriptionResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_all_subscriptions_200__resp) do
    [
      _embedded: {Mollie.SubscriptionsAPI, :list_all_subscriptions_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_all_subscriptions_200__resp_embedded) do
    [subscriptions: [{Mollie.SubscriptionResponse, :t}]]
  end

  def __fields__(:list_subscription_payments_200__resp) do
    [
      _embedded: {Mollie.SubscriptionsAPI, :list_subscription_payments_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_subscription_payments_200__resp_embedded) do
    [payments: [{Mollie.PaymentResponse, :t}]]
  end

  def __fields__(:list_subscriptions_200__resp) do
    [
      _embedded: {Mollie.SubscriptionsAPI, :list_subscriptions_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_subscriptions_200__resp_embedded) do
    [subscriptions: [{Mollie.SubscriptionResponse, :t}]]
  end
end
