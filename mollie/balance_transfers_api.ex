defmodule Mollie.BalanceTransfersAPI do
  @moduledoc """
  Provides API endpoints related to balance transfers api
  """

  @default_client Mollie.Client

  @doc """
  Create a Connect balance transfer

  This API endpoint allows you to create a balance transfer from your organization's balance to a connected organization's balance, or vice versa.
  You can also create a balance transfer between two connected organizations.
  To create a balance transfer, you must be authenticated as the source organization, and the destination organization must be a connected organization
  that has authorized the `balance-transfers.write` scope for your organization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_connect_balance_transfer(body :: Mollie.EntityBalanceTransfer.t(), opts :: keyword) ::
          {:ok, Mollie.EntityBalanceTransferResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_connect_balance_transfer(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.BalanceTransfersAPI, :create_connect_balance_transfer},
      url: "/connect/balance-transfers",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.EntityBalanceTransfer, :t}}],
      response: [
        {201, {Mollie.EntityBalanceTransferResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get a Connect balance transfer

  Retrieve a single Connect balance transfer object by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_connect_balance_transfer(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityBalanceTransferResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_connect_balance_transfer(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.BalanceTransfersAPI, :get_connect_balance_transfer},
      url: "/connect/balance-transfers/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.EntityBalanceTransferResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_connect_balance_transfers_200__resp :: %{
          _embedded:
            Mollie.BalanceTransfersAPI.list_connect_balance_transfers_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_connect_balance_transfers_200__resp_embedded :: %{
          connect_balance_transfers: [Mollie.EntityBalanceTransferResponse.t()]
        }

  @doc """
  List all Connect balance transfers

  Returns a paginated list of balance transfers associated with your organization. These may be a balance transfer that was received or sent from your balance, or a balance transfer that you initiated on behalf of your clients. If no balance transfers are available, the resulting array will be empty. This request should never throw an error.

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
  @spec list_connect_balance_transfers(opts :: keyword) ::
          {:ok, Mollie.BalanceTransfersAPI.list_connect_balance_transfers_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_connect_balance_transfers(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.BalanceTransfersAPI, :list_connect_balance_transfers},
      url: "/connect/balance-transfers",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.BalanceTransfersAPI, :list_connect_balance_transfers_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_connect_balance_transfers_200__resp) do
    [
      _embedded: {Mollie.BalanceTransfersAPI, :list_connect_balance_transfers_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_connect_balance_transfers_200__resp_embedded) do
    [connect_balance_transfers: [{Mollie.EntityBalanceTransferResponse, :t}]]
  end
end
