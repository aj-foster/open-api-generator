defmodule User do
  @moduledoc """
  Provides API endpoints related to user
  """

  @default_client Client

  @doc """
  Your account

  Get information about the account associated with the provided API key
  """
  @spec user_account(keyword) :: {:ok, AccountResponseBody.t()} | {:error, Error.t()}
  def user_account(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {User, :user_account},
      url: "/v1/user/account",
      method: :get,
      response: [{200, {AccountResponseBody, :t}}, {401, {Error, :t}}, {500, {Error, :t}}],
      opts: opts
    })
  end

  @doc """
  Your balance

  Get the credit balance of the account/organization associated with the API key
  """
  @spec user_balance(keyword) :: {:ok, BalanceResponseBody.t()} | {:error, Error.t()}
  def user_balance(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {User, :user_balance},
      url: "/v1/user/balance",
      method: :get,
      response: [{200, {BalanceResponseBody, :t}}, {401, {Error, :t}}, {500, {Error, :t}}],
      opts: opts
    })
  end
end
