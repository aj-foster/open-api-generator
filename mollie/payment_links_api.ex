defmodule Mollie.PaymentLinksAPI do
  @moduledoc """
  Provides API endpoints related to payment links api
  """

  @default_client Mollie.Client

  @doc """
  Create payment link

  With the Payment links API you can generate payment links that by default, unlike regular payments, do not expire.
  The payment link can be shared with your customers and will redirect them to them the payment page where they can
  complete the payment. A [payment](get-payment) will only be created once the customer initiates the payment.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_payment_link(body :: map, opts :: keyword) ::
          {:ok, Mollie.PaymentLinkResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_payment_link(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.PaymentLinksAPI, :create_payment_link},
      url: "/payment-links",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Mollie.PaymentLinkResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete payment link

  Payment links which have not been opened and no payments have been made yet can be deleted entirely.
  This can be useful for removing payment links that have been incorrectly configured or that are no longer relevant.

  Once deleted, the payment link will no longer show up in the API or Mollie dashboard.

  To simply disable a payment link without fully deleting it, you can use the `archived` parameter on the
  [Update payment link](update-payment-link) endpoint instead.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_payment_link(paymentLinkId :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def delete_payment_link(paymentLinkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentLinkId: paymentLinkId, body: body],
      call: {Mollie.PaymentLinksAPI, :delete_payment_link},
      url: "/payment-links/#{paymentLinkId}",
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
  Get payment link

  Retrieve a single payment link by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_payment_link(paymentLinkId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.PaymentLinkResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_payment_link(paymentLinkId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [paymentLinkId: paymentLinkId],
      call: {Mollie.PaymentLinksAPI, :get_payment_link},
      url: "/payment-links/#{paymentLinkId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.PaymentLinkResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type get_payment_link_payments_200__resp :: %{
          _embedded: Mollie.PaymentLinksAPI.get_payment_link_payments_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type get_payment_link_payments_200__resp_embedded :: %{
          payments: [Mollie.PaymentResponse.t()] | nil
        }

  @doc """
  Get payment link payments

  Retrieve the list of payments for a specific payment link.

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
  @spec get_payment_link_payments(paymentLinkId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.PaymentLinksAPI.get_payment_link_payments_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def get_payment_link_payments(paymentLinkId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [paymentLinkId: paymentLinkId],
      call: {Mollie.PaymentLinksAPI, :get_payment_link_payments},
      url: "/payment-links/#{paymentLinkId}/payments",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.PaymentLinksAPI, :get_payment_link_payments_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_payment_links_200__resp :: %{
          _embedded: Mollie.PaymentLinksAPI.list_payment_links_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_payment_links_200__resp_embedded :: %{
          payment_links: [Mollie.PaymentLinkResponse.t()] | nil
        }

  @doc """
  List payment links

  Retrieve a list of all payment links.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_payment_links(opts :: keyword) ::
          {:ok, Mollie.PaymentLinksAPI.list_payment_links_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_payment_links(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.PaymentLinksAPI, :list_payment_links},
      url: "/payment-links",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.PaymentLinksAPI, :list_payment_links_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update payment link

  Certain details of an existing payment link can be updated.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_payment_link(paymentLinkId :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Mollie.PaymentLinkResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_payment_link(paymentLinkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentLinkId: paymentLinkId, body: body],
      call: {Mollie.PaymentLinksAPI, :update_payment_link},
      url: "/payment-links/#{paymentLinkId}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Mollie.PaymentLinkResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_payment_link_payments_200__resp) do
    [
      _embedded: {Mollie.PaymentLinksAPI, :get_payment_link_payments_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:get_payment_link_payments_200__resp_embedded) do
    [payments: [{Mollie.PaymentResponse, :t}]]
  end

  def __fields__(:list_payment_links_200__resp) do
    [
      _embedded: {Mollie.PaymentLinksAPI, :list_payment_links_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_payment_links_200__resp_embedded) do
    [payment_links: [{Mollie.PaymentLinkResponse, :t}]]
  end
end
