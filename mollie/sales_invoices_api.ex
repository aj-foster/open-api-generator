defmodule Mollie.SalesInvoicesAPI do
  @moduledoc """
  Provides API endpoints related to sales invoices api
  """

  @default_client Mollie.Client

  @doc """
  Create sales invoice

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  With the Sales Invoice API you can generate sales invoices to send to your customers.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_sales_invoice(body :: Mollie.SalesInvoiceRequest.t(), opts :: keyword) ::
          {:ok, Mollie.SalesInvoiceResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_sales_invoice(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.SalesInvoicesAPI, :create_sales_invoice},
      url: "/sales-invoices",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.SalesInvoiceRequest, :t}}],
      response: [
        {201, {Mollie.SalesInvoiceResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete sales invoice

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  Sales invoices which are in status `draft` can be deleted. For all other statuses, please use the
  [Update sales invoice](update-sales-invoice) endpoint instead.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec delete_sales_invoice(
          id :: String.t(),
          body :: Mollie.DeleteValuesSalesInvoice.t(),
          opts :: keyword
        ) :: :ok | {:error, Mollie.ErrorResponse.t()}
  def delete_sales_invoice(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.SalesInvoicesAPI, :delete_sales_invoice},
      url: "/sales-invoices/#{id}",
      body: body,
      method: :delete,
      request: [{"application/json", {Mollie.DeleteValuesSalesInvoice, :t}}],
      response: [
        {204, :null},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get sales invoice

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  Retrieve a single sales invoice by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_sales_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SalesInvoiceResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_sales_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.SalesInvoicesAPI, :get_sales_invoice},
      url: "/sales-invoices/#{id}",
      method: :get,
      query: query,
      response: [{200, {Mollie.SalesInvoiceResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_sales_invoices_200__resp :: %{
          _embedded: Mollie.SalesInvoicesAPI.list_sales_invoices_200__resp_embedded() | nil,
          _links: Mollie.ListLinks.t() | nil,
          count: integer | nil
        }

  @type list_sales_invoices_200__resp_embedded :: %{
          sales_invoices: [Mollie.SalesInvoiceResponse.t()] | nil
        }

  @doc """
  List sales invoices

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  Retrieve a list of all sales invoices created through the API.

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
  @spec list_sales_invoices(opts :: keyword) ::
          {:ok, Mollie.SalesInvoicesAPI.list_sales_invoices_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_sales_invoices(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.SalesInvoicesAPI, :list_sales_invoices},
      url: "/sales-invoices",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SalesInvoicesAPI, :list_sales_invoices_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update sales invoice

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  Certain details of an existing sales invoice can be updated. For `draft` it is all values listed below, but for
  statuses `paid` and `issued` there are certain additional requirements (`paymentDetails` and `emailDetails`,
  respectively).

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_sales_invoice(
          id :: String.t(),
          body :: Mollie.UpdateValuesSalesInvoice.t(),
          opts :: keyword
        ) :: {:ok, Mollie.SalesInvoiceResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_sales_invoice(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.SalesInvoicesAPI, :update_sales_invoice},
      url: "/sales-invoices/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Mollie.UpdateValuesSalesInvoice, :t}}],
      response: [
        {200, {Mollie.SalesInvoiceResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_sales_invoices_200__resp) do
    [
      _embedded: {Mollie.SalesInvoicesAPI, :list_sales_invoices_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_sales_invoices_200__resp_embedded) do
    [sales_invoices: [{Mollie.SalesInvoiceResponse, :t}]]
  end
end
