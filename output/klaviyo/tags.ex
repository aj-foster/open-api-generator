defmodule Tags do
  @moduledoc """
  Provides API endpoints related to tags
  """

  @default_client Client

  @doc """
  Create Tag

  Create a tag. An account cannot have more than **500** unique tags.

  A tag belongs to a single tag group. If the `tag_group_id` is not specified,
  the tag is added to the account's default tag group.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec create_tag(TagCreateQuery.t(), keyword) ::
          {:ok, PostTagResponse.t()} | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Tags, :create_tag},
      url: "/api/tags/",
      body: body,
      method: :post,
      request: [{"application/json", {TagCreateQuery, :t}}],
      response: [
        {201, {PostTagResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Tag Group

  Create a tag group. An account cannot have more than **50** unique tag groups.

  If `exclusive` is not specified `true` or `false`, the tag group defaults to non-exclusive.

  If a tag group is non-exclusive, any given related resource (campaign, flow, etc.)
  can be linked to multiple tags from that tag group.
  If a tag group is exclusive, any given related resource can only be linked to one tag from that tag group.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec create_tag_group(TagGroupCreateQuery.t(), keyword) ::
          {:ok, PostTagGroupResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag_group(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Tags, :create_tag_group},
      url: "/api/tag-groups/",
      body: body,
      method: :post,
      request: [{"application/json", {TagGroupCreateQuery, :t}}],
      response: [
        {201, {PostTagGroupResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Tag Relationships Campaigns

  Associate a tag with one or more campaigns. Any campaign cannot be associated with more than **100** tags.


  Use the request body to pass in the ID(s) of the campaign(s) that will be associated with the tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `campaigns:write`
  `tags:write`
  """
  @spec create_tag_relationships_campaigns(String.t(), TagCampaignOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag_relationships_campaigns(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :create_tag_relationships_campaigns},
      url: "/api/tags/#{id}/relationships/campaigns/",
      body: body,
      method: :post,
      request: [{"application/json", {TagCampaignOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Tag Relationships Flows

  Associate a tag with one or more flows. Any flow cannot be associated with more than **100** tags.


  Use the request body to pass in the ID(s) of the flow(s) that will be associated with the tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:write`
  `tags:write`
  """
  @spec create_tag_relationships_flows(String.t(), TagFlowOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag_relationships_flows(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :create_tag_relationships_flows},
      url: "/api/tags/#{id}/relationships/flows/",
      body: body,
      method: :post,
      request: [{"application/json", {TagFlowOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Tag Relationships Lists

  Associate a tag with one or more lists. Any list cannot be associated with more than **100** tags.


  Use the request body to pass in the ID(s) of the lists(s) that will be associated with the tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:write`
  `tags:write`
  """
  @spec create_tag_relationships_lists(String.t(), TagListOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag_relationships_lists(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :create_tag_relationships_lists},
      url: "/api/tags/#{id}/relationships/lists/",
      body: body,
      method: :post,
      request: [{"application/json", {TagListOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Tag Relationships Segments

  Associate a tag with one or more segments. Any segment cannot be associated with more than **100** tags.


  Use the request body to pass in the ID(s) of the segments(s) that will be associated with the tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `segments:write`
  `tags:write`
  """
  @spec create_tag_relationships_segments(String.t(), TagSegmentOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_tag_relationships_segments(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :create_tag_relationships_segments},
      url: "/api/tags/#{id}/relationships/segments/",
      body: body,
      method: :post,
      request: [{"application/json", {TagSegmentOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag

  Delete the tag with the given tag ID. Any associations between the tag and other resources will also be removed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec delete_tag(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :delete_tag},
      url: "/api/tags/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag Group

  Delete the tag group with the given tag group ID.

  Any tags inside that tag group, and any associations between those tags and other resources, will also be removed. The default tag group cannot be deleted.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec delete_tag_group(String.t(), keyword) ::
          {:ok, DeleteTagGroupResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag_group(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :delete_tag_group},
      url: "/api/tag-groups/#{id}/",
      method: :delete,
      response: [
        {200, {DeleteTagGroupResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag Relationships Campaigns

  Remove a tag's association with one or more campaigns.


  Use the request body to pass in the ID(s) of the campaign(s) whose association with the tag
  will be removed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `campaigns:write`
  `tags:write`
  """
  @spec delete_tag_relationships_campaigns(String.t(), TagCampaignOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag_relationships_campaigns(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :delete_tag_relationships_campaigns},
      url: "/api/tags/#{id}/relationships/campaigns/",
      body: body,
      method: :delete,
      request: [{"application/json", {TagCampaignOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag Relationships Flows

  Remove a tag's association with one or more flows.


  Use the request body to pass in the ID(s) of the flows(s) whose association with the tag
  will be removed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:write`
  `tags:write`
  """
  @spec delete_tag_relationships_flows(String.t(), TagFlowOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag_relationships_flows(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :delete_tag_relationships_flows},
      url: "/api/tags/#{id}/relationships/flows/",
      body: body,
      method: :delete,
      request: [{"application/json", {TagFlowOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag Relationships Lists

  Remove a tag's association with one or more lists.


  Use the request body to pass in the ID(s) of the list(s) whose association with the tag
  will be removed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:write`
  `tags:write`
  """
  @spec delete_tag_relationships_lists(String.t(), TagListOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag_relationships_lists(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :delete_tag_relationships_lists},
      url: "/api/tags/#{id}/relationships/lists/",
      body: body,
      method: :delete,
      request: [{"application/json", {TagListOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Tag Relationships Segments

  Remove a tag's association with one or more segments.


  Use the request body to pass in the ID(s) of the segments(s) whose association with the tag
  will be removed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `segments:write`
  `tags:write`
  """
  @spec delete_tag_relationships_segments(String.t(), TagSegmentOp.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_tag_relationships_segments(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :delete_tag_relationships_segments},
      url: "/api/tags/#{id}/relationships/segments/",
      body: body,
      method: :delete,
      request: [{"application/json", {TagSegmentOp, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag

  Retrieve the tag with the given tag ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag-group]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_tag(String.t(), keyword) ::
          {:ok, GetTagResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag-group]", :"fields[tag]", :include])

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag},
      url: "/api/tags/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Group

  Retrieve the tag group with the given tag group ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag-group]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_tag_group(String.t(), keyword) ::
          {:ok, GetTagGroupResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_group(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag-group]"])

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_group},
      url: "/api/tag-groups/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagGroupResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Group Relationships Tags

  Returns the tag IDs of all tags inside the given tag group.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  """
  @spec get_tag_group_relationships_tags(String.t(), keyword) ::
          {:ok, GetTagGroupTagRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_group_relationships_tags(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_group_relationships_tags},
      url: "/api/tag-groups/#{id}/relationships/tags/",
      method: :get,
      response: [
        {200, {GetTagGroupTagRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Group Tags

  Return the tags for a given tag group ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_tag_group_tags(String.t(), keyword) ::
          {:ok, GetTagResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_group_tags(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag]"])

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_group_tags},
      url: "/api/tag-groups/#{id}/tags/",
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
  Get Tag Groups

  List all tag groups in an account. Every account has one default tag group.

  Tag groups can be filtered by `name`, `exclusive`, and `default`, and sorted by `name` or `id` in ascending or descending order.

  Returns a maximum of 25 tag groups per request, which can be paginated with
  [cursor-based pagination](https://developers.klaviyo.com/en/v2022-10-17/reference/api_overview#pagination).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag-group]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`name`: `contains`, `ends-with`, `equals`, `starts-with`<br>`exclusive`: `equals`<br>`default`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_tag_groups(keyword) ::
          {:ok, GetTagGroupResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_groups(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag-group]", :filter, :"page[cursor]", :sort])

    client.request(%{
      args: [],
      call: {Tags, :get_tag_groups},
      url: "/api/tag-groups/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagGroupResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Relationships Campaigns

  Returns the IDs of all campaigns associated with the given tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `campaigns:read`
  `tags:read`
  """
  @spec get_tag_relationships_campaigns(String.t(), keyword) ::
          {:ok, GetTagCampaignRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_relationships_campaigns(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_relationships_campaigns},
      url: "/api/tags/#{id}/relationships/campaigns/",
      method: :get,
      response: [
        {200, {GetTagCampaignRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Relationships Flows

  Returns the IDs of all flows associated with the given tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`
  `tags:read`
  """
  @spec get_tag_relationships_flows(String.t(), keyword) ::
          {:ok, GetTagFlowRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_relationships_flows(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_relationships_flows},
      url: "/api/tags/#{id}/relationships/flows/",
      method: :get,
      response: [
        {200, {GetTagFlowRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Relationships Lists

  Returns the IDs of all lists associated with the given tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:read`
  `tags:read`
  """
  @spec get_tag_relationships_lists(String.t(), keyword) ::
          {:ok, GetTagListRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_relationships_lists(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_relationships_lists},
      url: "/api/tags/#{id}/relationships/lists/",
      method: :get,
      response: [
        {200, {GetTagListRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Relationships Segments

  Returns the IDs of all segments associated with the given tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `segments:read`
  `tags:read`
  """
  @spec get_tag_relationships_segments(String.t(), keyword) ::
          {:ok, GetTagSegmentRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_relationships_segments(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_relationships_segments},
      url: "/api/tags/#{id}/relationships/segments/",
      method: :get,
      response: [
        {200, {GetTagSegmentRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Relationships Tag Group

  Returns the id of the tag group related to the given tag.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  """
  @spec get_tag_relationships_tag_group(String.t(), keyword) ::
          {:ok, GetTagTagGroupRelationshipsResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_relationships_tag_group(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_relationships_tag_group},
      url: "/api/tags/#{id}/relationships/tag-group/",
      method: :get,
      response: [
        {200, {GetTagTagGroupRelationshipsResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tag Tag Group

  Returns the tag group resource for a given tag ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag-group]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_tag_tag_group(String.t(), keyword) ::
          {:ok, GetTagGroupResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tag_tag_group(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag-group]"])

    client.request(%{
      args: [id: id],
      call: {Tags, :get_tag_tag_group},
      url: "/api/tags/#{id}/tag-group/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagGroupResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Tags

  List all tags in an account.

  Tags can be filtered by `name`, and sorted by `name` or `id` in ascending or descending order.

  Returns a maximum of 50 tags per request, which can be paginated with
  [cursor-based pagination](https://developers.klaviyo.com/en/v2022-10-17/reference/api_overview#pagination).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`

  ## Options

    * `fields[tag-group]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`name`: `contains`, `ends-with`, `equals`, `starts-with`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_tags(keyword) ::
          {:ok, GetTagResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_tags(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[tag-group]",
        :"fields[tag]",
        :filter,
        :include,
        :"page[cursor]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Tags, :get_tags},
      url: "/api/tags/",
      method: :get,
      query: query,
      response: [
        {200, {GetTagResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Tag

  Update the tag with the given tag ID.

  Only a tag's `name` can be changed. A tag cannot be moved from one tag group to another.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec update_tag(String.t(), TagUpdateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_tag(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :update_tag},
      url: "/api/tags/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {TagUpdateQuery, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Tag Group

  Update the tag group with the given tag group ID.

  Only a tag group's `name` can be changed. A tag group's `exclusive` or `default` value cannot be changed.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `tags:read`
  `tags:write`
  """
  @spec update_tag_group(String.t(), TagGroupUpdateQuery.t(), keyword) ::
          {:ok, PatchTagGroupResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_tag_group(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Tags, :update_tag_group},
      url: "/api/tag-groups/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {TagGroupUpdateQuery, :t}}],
      response: [
        {200, {PatchTagGroupResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
