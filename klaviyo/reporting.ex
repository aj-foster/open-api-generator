defmodule Klaviyo.Reporting do
  @moduledoc """
  Provides API endpoints related to reporting
  """

  @default_client Klaviyo.Client

  @doc """
  Query Campaign Values

  Returns the requested campaign analytics values data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `page_cursor`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec query_campaign_values(body :: Klaviyo.CampaignValuesRequestDTO.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostCampaignValuesResponseDTO.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def query_campaign_values(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page_cursor])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Reporting, :query_campaign_values},
      url: "/api/campaign-values-reports/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.CampaignValuesRequestDTO, :t}}],
      response: [
        {200, {Klaviyo.PostCampaignValuesResponseDTO, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Query Flow Series

  Returns the requested flow analytics series data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`

  **Scopes:**
  `flows:read`

  ## Options

    * `page_cursor`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec query_flow_series(body :: Klaviyo.FlowSeriesRequestDTO.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostFlowSeriesResponseDTO.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def query_flow_series(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page_cursor])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Reporting, :query_flow_series},
      url: "/api/flow-series-reports/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.FlowSeriesRequestDTO, :t}}],
      response: [
        {200, {Klaviyo.PostFlowSeriesResponseDTO, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Query Flow Values

  Returns the requested flow analytics values data<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `2/m`<br>Daily: `225/d`

  **Scopes:**
  `flows:read`

  ## Options

    * `page_cursor`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec query_flow_values(body :: Klaviyo.FlowValuesRequestDTO.t(), opts :: keyword) ::
          {:ok, Klaviyo.PostFlowValuesResponseDTO.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def query_flow_values(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:page_cursor])

    client.request(%{
      args: [body: body],
      call: {Klaviyo.Reporting, :query_flow_values},
      url: "/api/flow-values-reports/",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Klaviyo.FlowValuesRequestDTO, :t}}],
      response: [
        {200, {Klaviyo.PostFlowValuesResponseDTO, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
