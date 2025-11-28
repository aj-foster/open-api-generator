defmodule Realtime do
  @moduledoc """
  Provides API endpoint related to realtime
  """

  @default_client Client

  @doc """
  Create an ephemeral API token for use in client-side applications with the
  Realtime API. Can be configured with the same session parameters as the
  `session.update` client event.

  It responds with a session object, plus a `client_secret` key which contains
  a usable ephemeral API token that can be used to authenticate browser clients
  for the Realtime API.

  ## Request Body

  **Content Types**: `application/json`

  Create an ephemeral API key with the given session configuration.
  """
  @spec create_realtime_session(body :: RealtimeSessionCreateRequest.t(), opts :: keyword) ::
          {:ok, RealtimeSessionCreateResponse.t()} | :error
  def create_realtime_session(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Realtime, :create_realtime_session},
      url: "/realtime/sessions",
      body: body,
      method: :post,
      request: [{"application/json", {RealtimeSessionCreateRequest, :t}}],
      response: [{200, {RealtimeSessionCreateResponse, :t}}],
      opts: opts
    })
  end
end
