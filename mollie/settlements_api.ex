defmodule Mollie.SettlementsAPI do
  @moduledoc """
  Provides API endpoints related to settlements api
  """

  @default_client Mollie.Client

  @doc """
  Get next settlement

  Retrieve the details of the current settlement, that has not yet been paid out.

  For a complete reference of the settlement object, refer to the [Get settlement endpoint](get-settlement)
  documentation.

  For more accurate bookkeeping, refer to the [balance report](get-balance-report) endpoint or the
  [balance transactions](list-balance-transactions) endpoint.
  """
  @spec get_next_settlement(opts :: keyword) :: {:ok, Mollie.EntitySettlement.t()} | :error
  def get_next_settlement(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.SettlementsAPI, :get_next_settlement},
      url: "/settlements/next",
      method: :get,
      response: [{200, {Mollie.EntitySettlement, :t}}],
      opts: opts
    })
  end

  @doc """
  Get open settlement

  Retrieve the details of the open balance of the organization. This will return a settlement object representing your
  organization's balance.

  For a complete reference of the settlement object, refer to the [Get settlement endpoint](get-settlement)
  documentation.

  For more accurate bookkeeping, refer to the [balance report](get-balance-report) endpoint or the
  [balance transactions](list-balance-transactions) endpoint.
  """
  @spec get_open_settlement(opts :: keyword) :: {:ok, Mollie.EntitySettlement.t()} | :error
  def get_open_settlement(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.SettlementsAPI, :get_open_settlement},
      url: "/settlements/open",
      method: :get,
      response: [{200, {Mollie.EntitySettlement, :t}}],
      opts: opts
    })
  end

  @doc """
  Get settlement

  Retrieve a single settlement by its ID.

  To lookup settlements by their bank reference, replace the ID in the URL by
  a reference. For example: `1234567.2404.03`.

  A settlement represents a transfer of your balance funds to your external bank account.

  Settlements will typically include a report that details what balance transactions have taken place between this
  settlement and the previous one.

  For more accurate bookkeeping, refer to the [balance report](get-balance-report) endpoint or the
  [balance transactions](list-balance-transactions) endpoint.
  """
  @spec get_settlement(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntitySettlement.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_settlement(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Mollie.SettlementsAPI, :get_settlement},
      url: "/settlements/#{id}",
      method: :get,
      response: [{200, {Mollie.EntitySettlement, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_settlement_captures_200__resp :: %{
          _embedded: Mollie.SettlementsAPI.list_settlement_captures_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_settlement_captures_200__resp_embedded :: %{captures: [Mollie.CaptureResponse.t()]}

  @doc """
  List settlement captures

  Retrieve all captures included in the given settlement.

  The response is in the same format as the response of the [List captures endpoint](list-captures).

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_settlement_captures(settlementId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SettlementsAPI.list_settlement_captures_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_settlement_captures(settlementId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [settlementId: settlementId],
      call: {Mollie.SettlementsAPI, :list_settlement_captures},
      url: "/settlements/#{settlementId}/captures",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SettlementsAPI, :list_settlement_captures_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_settlement_chargebacks_200__resp :: %{
          _embedded: Mollie.SettlementsAPI.list_settlement_chargebacks_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_settlement_chargebacks_200__resp_embedded :: %{
          chargebacks: [Mollie.EntityChargeback.t()]
        }

  @doc """
  List settlement chargebacks

  Retrieve all chargebacks 'deducted' from the given settlement.

  The response is in the same format as the response of the [List chargebacks endpoint](list-chargebacks).

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_settlement_chargebacks(settlementId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SettlementsAPI.list_settlement_chargebacks_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_settlement_chargebacks(settlementId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [settlementId: settlementId],
      call: {Mollie.SettlementsAPI, :list_settlement_chargebacks},
      url: "/settlements/#{settlementId}/chargebacks",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SettlementsAPI, :list_settlement_chargebacks_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_settlement_payments_200__resp :: %{
          _embedded: Mollie.SettlementsAPI.list_settlement_payments_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_settlement_payments_200__resp_embedded :: %{
          payments: [Mollie.PaymentResponse.t()] | nil
        }

  @doc """
  List settlement payments

  Retrieve all payments included in the given settlement.

  The response is in the same format as the response of the [List payments endpoint](list-payments).

  For capture-based payment methods such as Klarna, the payments are not listed here. Refer to the
  [List captures endpoint](list-captures) endpoint instead.

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
  @spec list_settlement_payments(settlementId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SettlementsAPI.list_settlement_payments_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_settlement_payments(settlementId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [settlementId: settlementId],
      call: {Mollie.SettlementsAPI, :list_settlement_payments},
      url: "/settlements/#{settlementId}/payments",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SettlementsAPI, :list_settlement_payments_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_settlement_refunds_200__resp :: %{
          _embedded: Mollie.SettlementsAPI.list_settlement_refunds_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_settlement_refunds_200__resp_embedded :: %{
          refunds: [Mollie.EntityRefundResponse.t()]
        }

  @doc """
  List settlement refunds

  Retrieve all refunds 'deducted' from the given settlement.

  The response is in the same format as the response of the [List refunds endpoint](list-refunds).

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_settlement_refunds(settlementId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.SettlementsAPI.list_settlement_refunds_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_settlement_refunds(settlementId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [settlementId: settlementId],
      call: {Mollie.SettlementsAPI, :list_settlement_refunds},
      url: "/settlements/#{settlementId}/refunds",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SettlementsAPI, :list_settlement_refunds_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_settlements_200__resp :: %{
          _embedded: Mollie.SettlementsAPI.list_settlements_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_settlements_200__resp_embedded :: %{settlements: [Mollie.EntitySettlement.t()]}

  @doc """
  List settlements

  Retrieve a list of all your settlements.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `balanceId`: Provide the token of the balance to filter the settlements by. This is
      the balance token that the settlement was settled to.
    * `year`: Provide the year to query the settlements. Must be used combined with `month` parameter
    * `month`: Provide the month to query the settlements. Must be used combined with `year` parameter
    * `currencies`: Provides the currencies to retrieve the settlements. It accepts multiple currencies in a comma-separated format.

  """
  @spec list_settlements(opts :: keyword) ::
          {:ok, Mollie.SettlementsAPI.list_settlements_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_settlements(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:balanceId, :currencies, :from, :limit, :month, :year])

    client.request(%{
      args: [],
      call: {Mollie.SettlementsAPI, :list_settlements},
      url: "/settlements",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.SettlementsAPI, :list_settlements_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_settlement_captures_200__resp) do
    [
      _embedded: {Mollie.SettlementsAPI, :list_settlement_captures_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_settlement_captures_200__resp_embedded) do
    [captures: [{Mollie.CaptureResponse, :t}]]
  end

  def __fields__(:list_settlement_chargebacks_200__resp) do
    [
      _embedded: {Mollie.SettlementsAPI, :list_settlement_chargebacks_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_settlement_chargebacks_200__resp_embedded) do
    [chargebacks: [{Mollie.EntityChargeback, :t}]]
  end

  def __fields__(:list_settlement_payments_200__resp) do
    [
      _embedded: {Mollie.SettlementsAPI, :list_settlement_payments_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_settlement_payments_200__resp_embedded) do
    [payments: [{Mollie.PaymentResponse, :t}]]
  end

  def __fields__(:list_settlement_refunds_200__resp) do
    [
      _embedded: {Mollie.SettlementsAPI, :list_settlement_refunds_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_settlement_refunds_200__resp_embedded) do
    [refunds: [{Mollie.EntityRefundResponse, :t}]]
  end

  def __fields__(:list_settlements_200__resp) do
    [
      _embedded: {Mollie.SettlementsAPI, :list_settlements_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_settlements_200__resp_embedded) do
    [settlements: [{Mollie.EntitySettlement, :t}]]
  end
end
