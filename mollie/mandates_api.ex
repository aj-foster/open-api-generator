defmodule Mollie.MandatesAPI do
  @moduledoc """
  Provides API endpoints related to mandates api
  """

  @default_client Mollie.Client

  @doc """
  Create mandate

  Create a mandate for a specific customer. Mandates allow you to charge a customer's card, PayPal account or bank
  account recurrently.

  It is only possible to create mandates for IBANs and PayPal billing agreements with this endpoint. To create
  mandates for cards, your customers need to perform a 'first payment' with their card.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_mandate(
          customerId :: String.t(),
          body :: Mollie.MandateRequest.t(),
          opts :: keyword
        ) :: {:ok, Mollie.MandateResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_mandate(customerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, body: body],
      call: {Mollie.MandatesAPI, :create_mandate},
      url: "/customers/#{customerId}/mandates",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.MandateRequest, :t}}],
      response: [{201, {Mollie.MandateResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get mandate

  Retrieve a single mandate by its ID. Depending on the type of mandate, the object will contain the customer's bank
  account details, card details, or PayPal account details.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_mandate(customerId :: String.t(), mandateId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.MandateResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_mandate(customerId, mandateId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [customerId: customerId, mandateId: mandateId],
      call: {Mollie.MandatesAPI, :get_mandate},
      url: "/customers/#{customerId}/mandates/#{mandateId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.MandateResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_mandates_200__resp :: %{
          _embedded: Mollie.MandatesAPI.list_mandates_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_mandates_200__resp_embedded :: %{mandates: [Mollie.MandateResponse.t()]}

  @doc """
  List mandates

  Retrieve a list of all mandates.

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
  @spec list_mandates(customerId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.MandatesAPI.list_mandates_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_mandates(customerId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [customerId: customerId],
      call: {Mollie.MandatesAPI, :list_mandates},
      url: "/customers/#{customerId}/mandates",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.MandatesAPI, :list_mandates_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Revoke mandate

  Revoke a customer's mandate. You will no longer be able to charge the customer's bank account or card with this
  mandate, and all connected subscriptions will be canceled.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec revoke_mandate(
          customerId :: String.t(),
          mandateId :: String.t(),
          body :: map,
          opts :: keyword
        ) :: :ok | {:error, Mollie.ErrorResponse.t()}
  def revoke_mandate(customerId, mandateId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [customerId: customerId, mandateId: mandateId, body: body],
      call: {Mollie.MandatesAPI, :revoke_mandate},
      url: "/customers/#{customerId}/mandates/#{mandateId}",
      body: body,
      method: :delete,
      request: [{"application/json", :map}],
      response: [{204, :null}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_mandates_200__resp) do
    [
      _embedded: {Mollie.MandatesAPI, :list_mandates_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_mandates_200__resp_embedded) do
    [mandates: [{Mollie.MandateResponse, :t}]]
  end
end
