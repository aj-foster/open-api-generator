defmodule Accounts do
  @moduledoc """
  Provides API endpoints related to accounts
  """

  @default_client Client

  @doc """
  Get Account

  Retrieve a single account object by its account ID. You can only request the account by which the private API key was generated.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `15/m`

  **Scopes:**
  `accounts:read`

  ## Options

    * `fields[account]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_account(String.t(), keyword) ::
          {:ok, GetAccountResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_account(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[account]"])

    client.request(%{
      args: [id: id],
      call: {Accounts, :get_account},
      url: "/api/accounts/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetAccountResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Accounts

  Retrieve the account(s) associated with a given private API key. This will return 1 account object within the array.

  You can use this to retrieve account-specific data (contact information, timezone, currency, Public API key, etc.) or test if a Private API Key belongs to the correct account prior to performing subsequent actions with the API.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `15/m`

  **Scopes:**
  `accounts:read`

  ## Options

    * `fields[account]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_accounts(keyword) ::
          {:ok, GetAccountResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_accounts(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[account]"])

    client.request(%{
      args: [],
      call: {Accounts, :get_accounts},
      url: "/api/accounts/",
      method: :get,
      query: query,
      response: [
        {200, {GetAccountResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
