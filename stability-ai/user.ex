defmodule StabilityAI.User do
  @moduledoc """
  Provides API endpoints related to user
  """

  @default_client StabilityAI.Client

  @doc """
  Your account

  Get information about the account associated with the provided API key
  """
  @spec user_account(opts :: keyword) ::
          {:ok, StabilityAI.AccountResponseBody.t()} | {:error, StabilityAI.Error.t()}
  def user_account(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {StabilityAI.User, :user_account},
      url: "/v1/user/account",
      method: :get,
      response: [
        {200, {StabilityAI.AccountResponseBody, :t}},
        {401, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Your balance

  Get the credit balance of the account/organization associated with the API key
  """
  @spec user_balance(opts :: keyword) ::
          {:ok, StabilityAI.BalanceResponseBody.t()} | {:error, StabilityAI.Error.t()}
  def user_balance(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {StabilityAI.User, :user_balance},
      url: "/v1/user/balance",
      method: :get,
      response: [
        {200, {StabilityAI.BalanceResponseBody, :t}},
        {401, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end
end
