defmodule Mollie.InvoicesAPI do
  @moduledoc """
  Provides API endpoints related to invoices api
  """

  @default_client Mollie.Client

  @doc """
  Get invoice

  Retrieve a single invoice by its ID.

  If you want to retrieve the details of an invoice by its invoice number,
  call the [List invoices](list-invoices) endpoint with the `reference` parameter.
  """
  @spec get_invoice(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityInvoice.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_invoice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Mollie.InvoicesAPI, :get_invoice},
      url: "/invoices/#{id}",
      method: :get,
      response: [{200, {Mollie.EntityInvoice, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_invoices_200__resp :: %{
          _embedded: Mollie.InvoicesAPI.list_invoices_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_invoices_200__resp_embedded :: %{invoices: [map]}

  @doc """
  List invoices

  Retrieve a list of all your invoices, optionally filtered by year or by
  invoice reference.

  The results are paginated.

  ## Options

    * `reference`: Filter for an invoice with a specific invoice reference, for example
      `2024.10000`.
    * `year`: Filter for invoices of a specific year, for example `2024`.
    * `month`: Filter for invoices of a specific month, for example `01`.
    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.

  """
  @spec list_invoices(opts :: keyword) ::
          {:ok, Mollie.InvoicesAPI.list_invoices_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_invoices(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :month, :reference, :sort, :year])

    client.request(%{
      args: [],
      call: {Mollie.InvoicesAPI, :list_invoices},
      url: "/invoices",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.InvoicesAPI, :list_invoices_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_invoices_200__resp) do
    [
      _embedded: {Mollie.InvoicesAPI, :list_invoices_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_invoices_200__resp_embedded) do
    [invoices: [:map]]
  end
end
