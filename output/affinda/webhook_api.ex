defmodule WebhookAPI do
  @moduledoc """
  Provides API endpoints related to webhook api
  """

  @default_client Client

  @doc """
  Activate a resthook subscription

  After creating a subscription, we'll send a POST request to your target URL with a `X-Hook-Secret` header. <br />
  You should response to this with a 200 status code, and use the value of the `X-Hook-Secret` header that you received to activate the subscription using this endpoint.
  """
  @spec activate_resthook_subscription(keyword) ::
          {:ok, ResthookSubscription.t()} | {:error, RequestError.t()}
  def activate_resthook_subscription(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {WebhookAPI, :activate_resthook_subscription},
      url: "/v3/resthook_subscriptions/activate",
      method: :post,
      response: [
        {200, {ResthookSubscription, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a resthook subscription

  After a subscription is successfully created, we'll send a POST request to your target URL with a `X-Hook-Secret` header. <br />
  You need to response to this request with a 200 status code to confirm your subscribe intention. <br />
  Then, you need to use the `X-Hook-Secret` to activate the subscription using the [/resthook_subscriptions/activate](#post-/v3/resthook_subscriptions/activate) endpoint. <br />
  For more information and detailed instructions, [see our webhooks documentation here.](https://docs.affinda.com/docs/webhooks)
  """
  @spec create_resthook_subscription(ResthookSubscriptionCreate.t(), keyword) ::
          {:ok, ResthookSubscription.t()} | {:error, RequestError.t()}
  def create_resthook_subscription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {WebhookAPI, :create_resthook_subscription},
      url: "/v3/resthook_subscriptions",
      body: body,
      method: :post,
      request: [{"application/json", {ResthookSubscriptionCreate, :t}}],
      response: [
        {201, {ResthookSubscription, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a resthook subscription

  Deletes the specified resthook subscription from the database.
  """
  @spec delete_resthook_subscription(integer, keyword) :: :ok | {:error, RequestError.t()}
  def delete_resthook_subscription(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {WebhookAPI, :delete_resthook_subscription},
      url: "/v3/resthook_subscriptions/#{id}",
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

  @type get_all_resthook_subscriptions_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [ResthookSubscription.t()]
        }

  @doc """
  Get list of all resthook subscriptions

  Returns your resthook subscriptions.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.

  """
  @spec get_all_resthook_subscriptions(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_all_resthook_subscriptions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [],
      call: {WebhookAPI, :get_all_resthook_subscriptions},
      url: "/v3/resthook_subscriptions",
      method: :get,
      query: query,
      response: [
        {200, {WebhookAPI, :get_all_resthook_subscriptions_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific resthook subscription

  Return a specific resthook subscription.
  """
  @spec get_resthook_subscription(integer, keyword) ::
          {:ok, ResthookSubscription.t()} | {:error, RequestError.t()}
  def get_resthook_subscription(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {WebhookAPI, :get_resthook_subscription},
      url: "/v3/resthook_subscriptions/#{id}",
      method: :get,
      response: [
        {200, {ResthookSubscription, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a resthook subscription

  Update data of a resthook subscription.
  """
  @spec update_resthook_subscription(integer, ResthookSubscriptionUpdate.t(), keyword) ::
          {:ok, ResthookSubscription.t()} | {:error, RequestError.t()}
  def update_resthook_subscription(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {WebhookAPI, :update_resthook_subscription},
      url: "/v3/resthook_subscriptions/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ResthookSubscriptionUpdate, :t}}],
      response: [
        {200, {ResthookSubscription, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_resthook_subscriptions_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{ResthookSubscription, :t}]
    ]
  end
end
