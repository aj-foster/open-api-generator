defmodule Events do
  @moduledoc """
  Provides API endpoints related to events
  """

  @default_client Client

  @doc """
  Create Event

  Create a new event to track a profile's activity.

  Successful response indicates that the event was validated and submitted for processing, but does not guarantee that processing is complete.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:write`
  """
  @spec create_event(EventCreateQueryV2.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_event(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Events, :create_event},
      url: "/api/events/",
      body: body,
      method: :post,
      request: [{"application/json", {EventCreateQueryV2, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event

  Get an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `events:read`

  ## Options

    * `fields[event]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[metric]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_event(String.t(), keyword) ::
          {:ok, GetEventResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_event(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[event]", :"fields[metric]", :"fields[profile]", :include])

    client.request(%{
      args: [id: id],
      call: {Events, :get_event},
      url: "/api/events/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetEventResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event Metric

  Get the metric for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:read`
  `metrics:read`

  ## Options

    * `fields[metric]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_event_metric(String.t(), keyword) ::
          {:ok, GetMetricResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_event_metric(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[metric]"])

    client.request(%{
      args: [id: id],
      call: {Events, :get_event_metric},
      url: "/api/events/#{id}/metric/",
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
  Get Event Profile

  Get the profile associated with an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:read`
  `profiles:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_event_profile(String.t(), keyword) ::
          {:ok, GetProfileResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_event_profile(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"additional-fields[profile]", :"fields[profile]"])

    client.request(%{
      args: [id: id],
      call: {Events, :get_event_profile},
      url: "/api/events/#{id}/profile/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event Relationships Metric

  Get a list of related Metrics for an Event<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:read`
  `metrics:read`
  """
  @spec get_event_relationships_metric(String.t(), keyword) ::
          {:ok, GetEventMetricsRelationshipListResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_event_relationships_metric(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Events, :get_event_relationships_metric},
      url: "/api/events/#{id}/relationships/metric/",
      method: :get,
      response: [
        {200, {GetEventMetricsRelationshipListResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Event Relationships Profile

  Get profile [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for an event with the given event ID.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:read`
  `profiles:read`
  """
  @spec get_event_relationships_profile(String.t(), keyword) ::
          {:ok, GetEventProfilesRelationshipListResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_event_relationships_profile(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Events, :get_event_relationships_profile},
      url: "/api/events/#{id}/relationships/profile/",
      method: :get,
      response: [
        {200, {GetEventProfilesRelationshipListResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Events

  Get all events in an account

  Requests can be sorted by the following fields:
  `datetime`, `timestamp`

  Returns a maximum of 200 events per page.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `events:read`

  ## Options

    * `fields[event]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[metric]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`metric_id`: `equals`<br>`profile_id`: `equals`<br>`profile`: `has`<br>`datetime`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`timestamp`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_events(keyword) ::
          {:ok, GetEventResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_events(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[event]",
        :"fields[metric]",
        :"fields[profile]",
        :filter,
        :include,
        :"page[cursor]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Events, :get_events},
      url: "/api/events/",
      method: :get,
      query: query,
      response: [
        {200, {GetEventResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
