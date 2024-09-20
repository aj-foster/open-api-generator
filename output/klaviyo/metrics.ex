defmodule Metrics do
  @moduledoc """
  Provides API endpoints related to metrics
  """

  @default_client Client

  @doc """
  Get Metric

  Get a metric with the given metric ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `metrics:read`

  ## Options

    * `fields[metric]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_metric(String.t(), keyword) ::
          {:ok, GetMetricResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_metric(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[metric]"])

    client.request(%{
      args: [id: id],
      call: {Metrics, :get_metric},
      url: "/api/metrics/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetMetricResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Metrics

  Get all metrics in an account.

  Requests can be filtered by the following fields:
  integration `name`, integration `category`

  Returns a maximum of 200 results per page.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `metrics:read`

  ## Options

    * `fields[metric]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`integration.name`: `equals`<br>`integration.category`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_metrics(keyword) ::
          {:ok, GetMetricResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_metrics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[metric]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Metrics, :get_metrics},
      url: "/api/metrics/",
      method: :get,
      query: query,
      response: [
        {200, {GetMetricResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Query Metric Aggregates

  Query and aggregate event data associated with a metric, including native Klaviyo metrics, integration-specific metrics, and custom events. Queries must be passed in the JSON body of your `POST` request.

  Results can be filtered and grouped by time, event, or profile dimensions.

  To learn more about how to use this endpoint, check out our new [Using the Query Metric Aggregates Endpoint guide](https://developers.klaviyo.com/en/docs/using-the-query-metric-aggregates-endpoint).

  **Request body parameters** (nested under `attributes`):

  * `return_fields`: request specific fields using [sparse fieldsets](https://developers.klaviyo.com/en/reference/api_overview#sparse-fieldsets)
  * `sort`: sort results by a specified field, such as `"-timestamp"`
  * `page_cursor`: results can be paginated with [cursor-based pagination](https://developers.klaviyo.com/en/reference/api_overview#pagination)
  * `page_size`: limit the number of returned results per page
  * `by`: optional attributes used to group by the aggregation function
      * When using `by` attributes, an empty `dimensions` response is expected when the counts for the events do not have the associated dimension requested by the set `by` attribute. For example, a query including `"by": ["$flow"]` will return an empty dimensions response for counts of metrics not associated with a `$flow`
  * `measurement`: the measurement key supports the following values:
      * `"sum_value"`: perform a summation of the `_Event Value_`, optionally partitioned over any dimension provided in the `by` field
      * `"count"`: counts the number of events associated to a metric, optionally partitioned over any dimension provided in the `by` field
      * `"unique"` counts the number of unique customers associated to a metric, optionally partitioned over any dimension provided in the `by` field
  * `interval`: aggregation interval, such as `"hour"`,`"day"`,`"week"`, and `"month"`
  * `metric_id`: the metric ID used in the aggregation
  * `filter`: list of filters for specific fields, must include time range using ISO 8601 format (`"YYYY-MM-DDTHH:MM:SS.mmmmmm"`)
      * The time range can be filtered by providing a `greater-or-equal` filter on the datetime field, such as `"greater-or-equal(datetime,2021-07-01T00:00:00)"` and a `less-than` filter on the same datetime field, such as `"less-than(datetime,2022-07-01T00:00:00)"`
      * The time range may span a maximum of one year. Time range dates may be set to a maximum of 5 years prior to the current date
      * Filter the list of supported aggregate dimensions using the common filter syntax, such as `"equals(URL,\"https://www.klaviyo.com/\")"`
  * `timezone`: the timezone used when processing the query. Case sensitive. This field is validated against a list of common timezones from the [IANA Time Zone Database](https://www.iana.org/time-zones)
      * While the payload accepts a timezone, the response datetimes returned will be in UTC.

  For a comprehensive list of native Klaviyo metrics and their associated attributes for grouping and filtering, please refer to the [metrics attributes guide](https://developers.klaviyo.com/en/docs/supported_metrics_and_attributes).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `metrics:read`
  """
  @spec query_metric_aggregates(MetricAggregateQuery.t(), keyword) ::
          {:ok, PostMetricAggregateResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def query_metric_aggregates(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Metrics, :query_metric_aggregates},
      url: "/api/metric-aggregates/",
      body: body,
      method: :post,
      request: [{"application/json", {MetricAggregateQuery, :t}}],
      response: [
        {200, {PostMetricAggregateResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
