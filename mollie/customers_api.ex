defmodule Mollie.CustomersAPI do
  @moduledoc """
  Provides API endpoints related to customers api
  """

  @default_client Mollie.Client

  @doc """
  Create customer

  Creates a simple minimal representation of a customer. Payments, recurring mandates, and subscriptions can be linked
  to this customer object, which simplifies management of recurring payments.

  Once registered, customers will also appear in your Mollie dashboard.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_customer(body :: Mollie.EntityCustomer.t(), opts :: keyword) ::
          {:ok, Mollie.CustomerResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_customer(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.CustomersAPI, :create_customer},
      url: "/customers",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.EntityCustomer, :t}}],
      response: [{201, {Mollie.CustomerResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create customer payment

  Creates a payment for the customer.

  Linking customers to payments enables you to:

  * Keep track of payment preferences for your customers
  * Allow your customers to charge a previously used credit card with a single click in our hosted checkout
  * Improve payment insights in the Mollie dashboard
  * Use recurring payments

  This endpoint is effectively an alias of the [Create payment endpoint](create-payment) with the `customerId`
  parameter predefined.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_customer_payment(
          customerId :: String.t(),
          body :: Mollie.PaymentRequest.t(),
          opts :: keyword
        ) :: {:ok, Mollie.PaymentResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_customer_payment(customerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, body: body],
      call: {Mollie.CustomersAPI, :create_customer_payment},
      url: "/customers/#{customerId}/payments",
      body: body,
      method: :post,
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
  Delete customer

  Delete a customer. All mandates and subscriptions created for this customer will be canceled as well.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_customer(customerId :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def delete_customer(customerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, body: body],
      call: {Mollie.CustomersAPI, :delete_customer},
      url: "/customers/#{customerId}",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{204, :null}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type get_customer_200__resp :: %{events: [Mollie.EntityEvent.t()] | nil}

  @doc """
  Get customer

  Retrieve a single customer by its ID.

  ## Options

    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_customer(customerId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.CustomersAPI.get_customer_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def get_customer(customerId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include, :testmode])

    client.request(%{
      args: [customerId: customerId],
      call: {Mollie.CustomersAPI, :get_customer},
      url: "/customers/#{customerId}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.CustomersAPI, :get_customer_200__resp}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_customer_payments_200__resp :: %{
          _embedded: Mollie.CustomersAPI.list_customer_payments_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_customer_payments_200__resp_embedded :: %{
          payments: [Mollie.PaymentResponse.t()] | nil
        }

  @doc """
  List customer payments

  Retrieve all payments linked to the customer.

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
  @spec list_customer_payments(customerId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.CustomersAPI.list_customer_payments_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_customer_payments(customerId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [customerId: customerId],
      call: {Mollie.CustomersAPI, :list_customer_payments},
      url: "/customers/#{customerId}/payments",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.CustomersAPI, :list_customer_payments_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_customers_200__resp :: %{
          _embedded: Mollie.CustomersAPI.list_customers_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_customers_200__resp_embedded :: %{customers: [Mollie.CustomerResponse.t()]}

  @doc """
  List customers

  Retrieve a list of all customers.

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
  @spec list_customers(opts :: keyword) ::
          {:ok, Mollie.CustomersAPI.list_customers_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_customers(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.CustomersAPI, :list_customers},
      url: "/customers",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.CustomersAPI, :list_customers_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update customer

  Update an existing customer.

  For an in-depth explanation of each parameter, refer to the [Create customer](create-customer) endpoint.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_customer(
          customerId :: String.t(),
          body :: Mollie.EntityCustomer.t(),
          opts :: keyword
        ) :: {:ok, Mollie.CustomerResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_customer(customerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, body: body],
      call: {Mollie.CustomersAPI, :update_customer},
      url: "/customers/#{customerId}",
      body: body,
      method: :patch,
      request: [{"application/json", {Mollie.EntityCustomer, :t}}],
      response: [{200, {Mollie.CustomerResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_customer_200__resp) do
    [events: [{Mollie.EntityEvent, :t}]]
  end

  def __fields__(:list_customer_payments_200__resp) do
    [
      _embedded: {Mollie.CustomersAPI, :list_customer_payments_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_customer_payments_200__resp_embedded) do
    [payments: [{Mollie.PaymentResponse, :t}]]
  end

  def __fields__(:list_customers_200__resp) do
    [
      _embedded: {Mollie.CustomersAPI, :list_customers_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_customers_200__resp_embedded) do
    [customers: [{Mollie.CustomerResponse, :t}]]
  end
end
