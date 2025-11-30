defmodule Mollie.BalancesAPI do
  @moduledoc """
  Provides API endpoints related to balances api
  """

  @default_client Mollie.Client

  @doc """
  Get balance

  When processing payments with Mollie, we put all pending funds — usually
  minus Mollie fees — on a balance. Once you have linked a bank account to your Mollie account, we can pay out your
  balance towards this bank account.

  With the Balances API you can retrieve your current balance. The response
  includes two amounts:

  * The *pending amount*. These are payments that have been marked as `paid`,
  but are not yet available on your balance.
  * The *available amount*. This is the amount that you can get paid out to
  your bank account, or use for refunds.

  With instant payment methods like iDEAL, payments are moved to the available
  balance instantly. With slower payment methods, like credit card for example, it can take a few days before the
  funds are available on your balance. These funds will be shown under the *pending amount* in the meanwhile.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_balance(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityBalance.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_balance(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.BalancesAPI, :get_balance},
      url: "/balances/#{id}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityBalance, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get balance report

  Retrieve a summarized report for all transactions on a given balance within a given timeframe.

  The API also provides a detailed report on all 'prepayments' for Mollie fees that were deducted from your balance
  during the reported period, ahead of your Mollie invoice.

  The alias `primary` can be used instead of the balance ID to refer to the
  organization's primary balance.

  ## Options

    * `from`: The start date of the report, in `YYYY-MM-DD` format. The from date is
      'inclusive', and in Central European Time. This means a report with for example `from=2024-01-01` will
      include transactions from 2024-01-01 0:00:00 CET and onwards.
    * `until`: The end date of the report, in `YYYY-MM-DD` format. The until date is 'exclusive', and in Central European Time.
      This means a report with for example `until=2024-02-01` will include transactions up until
      2024-01-31 23:59:59 CET.
    * `grouping`: You can retrieve reports in two different formats. With the `status-balances` format, transactions are grouped
      by status (e.g. `pending`, `available`), then by transaction type, and then by other sub-groupings where
      available (e.g. payment method).
      
      With the `transaction-categories` format, transactions are grouped by
      transaction type, then by status, and then again by other sub-groupings where available.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_balance_report(balanceId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityBalanceReport.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_balance_report(balanceId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :grouping, :testmode, :until])

    client.request(%{
      args: [balanceId: balanceId],
      call: {Mollie.BalancesAPI, :get_balance_report},
      url: "/balances/#{balanceId}/report",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.EntityBalanceReport, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get primary balance

  Retrieve the primary balance. This is the balance of your account's primary
  currency, where all payments are settled to by default.

  This endpoint is a convenient alias of the [Get balance](get-balance)
  endpoint.
  """
  @spec get_primary_balance(opts :: keyword) :: {:ok, Mollie.EntityBalance.t()} | :error
  def get_primary_balance(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.BalancesAPI, :get_primary_balance},
      url: "/balances/primary",
      method: :get,
      response: [{200, {Mollie.EntityBalance, :t}}],
      opts: opts
    })
  end

  @type list_balance_transactions_200__resp :: %{
          _embedded: Mollie.BalancesAPI.list_balance_transactions_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_balance_transactions_200__resp_embedded :: %{
          balance_transactions: [Mollie.EntityBalanceTransaction.t()]
        }

  @doc """
  List balance transactions

  Retrieve a list of all balance transactions. Transactions include for
  example payments, refunds, chargebacks, and settlements.

  For an aggregated report of these balance transactions, refer to the [Get
  balance report](get-balance-report) endpoint.

  The alias `primary` can be used instead of the balance ID to refer to the
  organization's primary balance.

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
  @spec list_balance_transactions(balanceId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.BalancesAPI.list_balance_transactions_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_balance_transactions(balanceId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :testmode])

    client.request(%{
      args: [balanceId: balanceId],
      call: {Mollie.BalancesAPI, :list_balance_transactions},
      url: "/balances/#{balanceId}/transactions",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.BalancesAPI, :list_balance_transactions_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {429, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_balances_200__resp :: %{
          _embedded: Mollie.BalancesAPI.list_balances_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_balances_200__resp_embedded :: %{balances: [Mollie.EntityBalance.t()]}

  @doc """
  List balances

  Retrieve a list of the organization's balances, including the primary balance.

  The results are paginated.

  ## Options

    * `currency`: Optionally only return balances with the given currency. For example: `EUR`.
    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_balances(opts :: keyword) ::
          {:ok, Mollie.BalancesAPI.list_balances_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_balances(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:currency, :from, :limit, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.BalancesAPI, :list_balances},
      url: "/balances",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.BalancesAPI, :list_balances_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_balance_transactions_200__resp) do
    [
      _embedded: {Mollie.BalancesAPI, :list_balance_transactions_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_balance_transactions_200__resp_embedded) do
    [balance_transactions: [{Mollie.EntityBalanceTransaction, :t}]]
  end

  def __fields__(:list_balances_200__resp) do
    [
      _embedded: {Mollie.BalancesAPI, :list_balances_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_balances_200__resp_embedded) do
    [balances: [{Mollie.EntityBalance, :t}]]
  end
end
