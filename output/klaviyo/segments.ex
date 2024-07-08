defmodule Segments do
  @moduledoc """
  Provides API endpoints related to segments
  """

  @default_client Client

  @doc """
  Get Segment

  Get a segment with the given segment ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`<br><br>Rate limits when using the `additional-fields[segment]=profile_count` parameter in your API request:<br>Burst: `1/s`<br>Steady: `15/m`<br><br>To learn more about how the `additional-fields` parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2024-02-15/docs/rate_limits_and_error_handling) guide.

  **Scopes:**
  `segments:read`

  ## Options

    * `additional-fields[segment]`: Request additional fields not included by default in the response. Supported values: 'profile_count'
    * `fields[segment]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_segment(String.t(), keyword) ::
          {:ok, GetSegmentRetrieveResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segment(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"additional-fields[segment]",
        :"fields[segment]",
        :"fields[tag]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Segments, :get_segment},
      url: "/api/segments/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetSegmentRetrieveResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Segment Profiles

  Get all profiles within a segment with the given segment ID.

  Filter to request a subset of all profiles. Profiles can be filtered by `email`, `phone_number`, `push_token`, and `joined_group_at` fields. Profiles can be sorted by the following fields, in ascending and descending order: `joined_group_at`<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:read`
  `segments:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`email`: `any`, `equals`<br>`phone_number`: `any`, `equals`<br>`push_token`: `any`, `equals`<br>`_kx`: `equals`<br>`joined_group_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_segment_profiles(String.t(), keyword) ::
          {:ok, GetSegmentMemberResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segment_profiles(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"additional-fields[profile]",
        :"fields[profile]",
        :filter,
        :"page[cursor]",
        :"page[size]",
        :sort
      ])

    client.request(%{
      args: [id: id],
      call: {Segments, :get_segment_profiles},
      url: "/api/segments/#{id}/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetSegmentMemberResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Segment Relationships Profiles

  Get all profile membership [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for the given segment ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:read`
  `segments:read`

  ## Options

    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`email`: `any`, `equals`<br>`phone_number`: `any`, `equals`<br>`push_token`: `any`, `equals`<br>`_kx`: `equals`<br>`joined_group_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 1000.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_segment_relationships_profiles(String.t(), keyword) ::
          {:ok, GetSegmentRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segment_relationships_profiles(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :"page[cursor]", :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Segments, :get_segment_relationships_profiles},
      url: "/api/segments/#{id}/relationships/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetSegmentRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Segment Relationships Tags

  If `related_resource` is `tags`, returns the tag IDs of all tags associated with the given segment ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `segments:read`
  `tags:read`
  """
  @spec get_segment_relationships_tags(String.t(), keyword) ::
          {:ok, GetSegmentTagRelationshipListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segment_relationships_tags(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Segments, :get_segment_relationships_tags},
      url: "/api/segments/#{id}/relationships/tags/",
      method: :get,
      response: [
        {200, {GetSegmentTagRelationshipListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Segment Tags

  Return all tags associated with the given segment ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `segments:read`
  `tags:read`

  ## Options

    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_segment_tags(String.t(), keyword) ::
          {:ok, GetTagResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segment_tags(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag]"])

    client.request(%{
      args: [id: id],
      call: {Segments, :get_segment_tags},
      url: "/api/segments/#{id}/tags/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Segments

  Get all segments in an account.

  Filter to request a subset of all segments. Segments can be filtered by `name`, `created`, and `updated` fields.

  Returns a maximum of 10 results per page.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `segments:read`

  ## Options

    * `fields[segment]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`name`: `any`, `equals`<br>`id`: `any`, `equals`<br>`created`: `greater-than`<br>`updated`: `greater-than`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_segments(keyword) ::
          {:ok, GetSegmentListResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_segments(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[segment]", :"fields[tag]", :filter, :include, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Segments, :get_segments},
      url: "/api/segments/",
      method: :get,
      query: query,
      response: [
        {200, {GetSegmentListResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Segment

  Update the name of a segment with the given segment ID.<br><br>*Rate limits*:<br>Burst: `1/s`<br>Steady: `15/m`

  **Scopes:**
  `segments:write`
  """
  @spec update_segment(String.t(), SegmentPartialUpdateQuery.t(), keyword) ::
          {:ok, PatchSegmentPartialUpdateResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_segment(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Segments, :update_segment},
      url: "/api/segments/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {SegmentPartialUpdateQuery, :t}}],
      response: [
        {200, {PatchSegmentPartialUpdateResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
