defmodule Mollie.DelayedRoutingAPI do
  @moduledoc """
  Provides API endpoints related to delayed routing api
  """

  @default_client Mollie.Client

  @doc """
  Create a delayed route

  Create a route for a specific payment.
  The routed amount is credited to the account of your customer.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec payment_create_route(
          paymentId :: String.t(),
          body :: Mollie.EntityRoute.t(),
          opts :: keyword
        ) :: {:ok, Mollie.RouteCreateResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def payment_create_route(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.DelayedRoutingAPI, :payment_create_route},
      url: "/payments/#{paymentId}/routes",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.EntityRoute, :t}}],
      response: [{201, {Mollie.RouteCreateResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type payment_list_routes_200__resp :: %{
          _embedded: Mollie.DelayedRoutingAPI.payment_list_routes_200__resp_embedded(),
          _links: Mollie.DelayedRoutingAPI.payment_list_routes_200__resp_links(),
          count: integer
        }

  @type payment_list_routes_200__resp_embedded :: %{routes: [Mollie.RouteGetResponse.t()]}

  @type payment_list_routes_200__resp_links :: %{
          documentation: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  @doc """
  List payment routes

  Retrieve a list of all routes created for a specific payment.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec payment_list_routes(paymentId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.DelayedRoutingAPI.payment_list_routes_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def payment_list_routes(paymentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [paymentId: paymentId],
      call: {Mollie.DelayedRoutingAPI, :payment_list_routes},
      url: "/payments/#{paymentId}/routes",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.DelayedRoutingAPI, :payment_list_routes_200__resp}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:payment_list_routes_200__resp) do
    [
      _embedded: {Mollie.DelayedRoutingAPI, :payment_list_routes_200__resp_embedded},
      _links: {Mollie.DelayedRoutingAPI, :payment_list_routes_200__resp_links},
      count: :integer
    ]
  end

  def __fields__(:payment_list_routes_200__resp_embedded) do
    [routes: [{Mollie.RouteGetResponse, :t}]]
  end

  def __fields__(:payment_list_routes_200__resp_links) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
