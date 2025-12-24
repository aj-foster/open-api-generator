defmodule Mollie.WebhookEventsAPI do
  @moduledoc """
  Provides API endpoint related to webhook events api
  """

  @default_client Mollie.Client

  @doc """
  Get a Webhook Event

  Retrieve a single webhook event object by its event ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_webhook_event(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityWebhookEvent.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_webhook_event(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.WebhookEventsAPI, :get_webhook_event},
      url: "/events/#{id}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityWebhookEvent, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end
end
