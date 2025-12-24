defmodule Mollie.PaymentsAPI do
  @moduledoc """
  Provides API endpoints related to payments api
  """

  @default_client Mollie.Client

  @doc """
  Cancel payment

  Depending on the payment method, you may be able to cancel a payment for a certain amount of time — usually until
  the next business day or as long as the payment status is open.

  Payments may also be canceled manually from the Mollie Dashboard.

  The `isCancelable` property on the [Payment object](get-payment) will indicate if the payment can be canceled.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec cancel_payment(paymentId :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Mollie.PaymentResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def cancel_payment(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.PaymentsAPI, :cancel_payment},
      url: "/payments/#{paymentId}",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [
        {200, {Mollie.PaymentResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create payment

  Payment creation is elemental to the Mollie API: this is where most payment
  implementations start off.

  Once you have created a payment, you should redirect your customer to the
  URL in the `_links.checkout` property from the response.

  To wrap your head around the payment process, an explanation and flow charts
  can be found in the 'Accepting payments' guide.

  If you specify the `method` parameter when creating a payment, optional
  additional parameters may be available for the payment method that are not listed below. Please refer to the
  guide on [method-specific parameters](extra-payment-parameters).

  ## Options

    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_payment(body :: Mollie.PaymentRequest.t(), opts :: keyword) ::
          {:ok, Mollie.PaymentResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_payment(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [body: body],
      call: {Mollie.PaymentsAPI, :create_payment},
      url: "/payments",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Mollie.PaymentRequest, :t}}],
      response: [
        {201, {Mollie.PaymentResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}},
        {503, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get payment

  Retrieve a single payment object by its payment ID.

  ## Options

    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_payment(paymentId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.PaymentResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_payment(paymentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :include, :testmode])

    client.request(%{
      args: [paymentId: paymentId],
      call: {Mollie.PaymentsAPI, :get_payment},
      url: "/payments/#{paymentId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.PaymentResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_payments_200__resp :: %{
          _embedded: Mollie.PaymentsAPI.list_payments_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_payments_200__resp_embedded :: %{payments: [Mollie.PaymentResponse.t()] | nil}

  @doc """
  List payments

  Retrieve all payments created with the current website profile.

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
  @spec list_payments(opts :: keyword) ::
          {:ok, Mollie.PaymentsAPI.list_payments_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_payments(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.PaymentsAPI, :list_payments},
      url: "/payments",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.PaymentsAPI, :list_payments_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Release payment authorization

  Releases the full remaining authorized amount. Call this endpoint when you will not be making any additional
  captures. Payment authorizations may also be released manually from the Mollie Dashboard.

  Mollie will do its best to process release requests, but it is not guaranteed that it will succeed. It is up to
  the issuing bank if and when the hold will be released.

  If the request does succeed, the payment status will change to `canceled` for payments without captures.
  If there is a successful capture, the payment will transition to `paid`.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec release_authorization(paymentId :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def release_authorization(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.PaymentsAPI, :release_authorization},
      url: "/payments/#{paymentId}/release-authorization",
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
  Update payment

  Certain details of an existing payment can be updated.

  Updating the payment details will not result in a webhook call.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_payment(paymentId :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Mollie.PaymentResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_payment(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.PaymentsAPI, :update_payment},
      url: "/payments/#{paymentId}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Mollie.PaymentResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_payments_200__resp) do
    [
      _embedded: {Mollie.PaymentsAPI, :list_payments_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_payments_200__resp_embedded) do
    [payments: [{Mollie.PaymentResponse, :t}]]
  end
end
