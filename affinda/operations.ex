defmodule Operations do
  @moduledoc """
  Provides API endpoint related to operations
  """

  @default_client Client

  @doc """
  Saves a TOTP config

  Saves a config obtained with `TOTPRequest`, along with a device generated
  OTP to confirm it's correctness.

  """
  @spec controllers_api_v1_totp_totp_save(RequestTOTPCreate.t(), keyword) :: :ok | :error
  def controllers_api_v1_totp_totp_save(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :controllers_api_v1_totp_totp_save},
      url: "/api/v1/me/totp",
      body: body,
      method: :post,
      request: [{"application/json", {RequestTOTPCreate, :t}}],
      response: [{201, :null}, {429, :null}],
      opts: opts
    })
  end
end
