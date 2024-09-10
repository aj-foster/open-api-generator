defmodule Lists do
  @moduledoc """
  Provides API endpoints related to lists
  """

  @default_client Client

  @doc """
  Create List

  Create a new list.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  """
  @spec create_list(ListCreateQuery.t(), keyword) ::
          {:ok, PostListCreateResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_list(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Lists, :create_list},
      url: "/api/lists/",
      body: body,
      method: :post,
      request: [{"application/json", {ListCreateQuery, :t}}],
      response: [
        {201, {PostListCreateResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Add Profile To List

  Add a profile to a list with the given list ID.

  It is recommended that you use the [Subscribe Profiles endpoint](https://developers.klaviyo.com/en/reference/subscribe_profiles) if you're trying to give a profile [consent](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api) to receive email marketing, SMS marketing, or both.

  This endpoint accepts a maximum of 1000 profiles per call.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  `profiles:write`
  """
  @spec create_list_relationships(String.t(), ListMembersAddQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_list_relationships(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Lists, :create_list_relationships},
      url: "/api/lists/#{id}/relationships/profiles/",
      body: body,
      method: :post,
      request: [{"application/json", {ListMembersAddQuery, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete List

  Delete a list with the given list ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  """
  @spec delete_list(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Lists, :delete_list},
      url: "/api/lists/#{id}/",
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
  Remove Profile From List

  Remove a profile from a list with the given list ID.

  The provided profile will no longer receive marketing from this particular list once removed.

  Removing a profile from a list will not impact the profile's [consent](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api) status or subscription status in general.
  To update a profile's subscription status, please use the [Unsubscribe Profiles endpoint](https://developers.klaviyo.com/en/reference/unsubscribe_profiles).

  This endpoint accepts a maximum of 1000 profiles per call.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  `profiles:write`
  """
  @spec delete_list_relationships(String.t(), ListMembersDeleteQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_list_relationships(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Lists, :delete_list_relationships},
      url: "/api/lists/#{id}/relationships/profiles/",
      body: body,
      method: :delete,
      request: [{"application/json", {ListMembersDeleteQuery, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get List

  Get a list with the given list ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`<br><br>Rate limits when using the `additional-fields[list]=profile_count` parameter in your API request:<br>Burst: `1/s`<br>Steady: `15/m`<br><br>To learn more about how the `additional-fields` parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2024-02-15/docs/rate_limits_and_error_handling) guide.

  **Scopes:**
  `lists:read`

  ## Options

    * `additional-fields[list]`: Request additional fields not included by default in the response. Supported values: 'profile_count'
    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_list(String.t(), keyword) ::
          {:ok, GetListRetrieveResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_list(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"additional-fields[list]", :"fields[list]", :"fields[tag]", :include])

    client.request(%{
      args: [id: id],
      call: {Lists, :get_list},
      url: "/api/lists/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetListRetrieveResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get List Profiles

  Get all profiles within a list with the given list ID.

  Filter to request a subset of all profiles. Profiles can be filtered by `email`, `phone_number`, `push_token`, and `joined_group_at` fields. Profiles can be sorted by the following fields, in ascending and descending order: `joined_group_at`<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`<br><br>Rate limits when using the `additional-fields[profile]=predictive_analytics` parameter in your API request:<br>Burst: `10/s`<br>Steady: `150/m`<br><br>To learn more about how the `additional-fields` parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2024-02-15/docs/rate_limits_and_error_handling) guide.

  **Scopes:**
  `lists:read`
  `profiles:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`email`: `any`, `equals`<br>`phone_number`: `any`, `equals`<br>`push_token`: `any`, `equals`<br>`_kx`: `equals`<br>`joined_group_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_list_profiles(String.t(), keyword) ::
          {:ok, GetListMemberResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_list_profiles(id, opts \\ []) do
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
      call: {Lists, :get_list_profiles},
      url: "/api/lists/#{id}/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetListMemberResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get List Relationships Profiles

  Get profile membership [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for a list with the given list ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `lists:read`
  `profiles:read`

  ## Options

    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`email`: `any`, `equals`<br>`phone_number`: `any`, `equals`<br>`push_token`: `any`, `equals`<br>`_kx`: `equals`<br>`joined_group_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 1000.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_list_relationships_profiles(String.t(), keyword) ::
          {:ok, GetListRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_list_relationships_profiles(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :"page[cursor]", :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Lists, :get_list_relationships_profiles},
      url: "/api/lists/#{id}/relationships/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetListRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get List Relationships Tags

  Returns the tag IDs of all tags associated with the given list.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:read`
  `tags:read`
  """
  @spec get_list_relationships_tags(String.t(), keyword) ::
          {:ok, GetListTagRelationshipListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_list_relationships_tags(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Lists, :get_list_relationships_tags},
      url: "/api/lists/#{id}/relationships/tags/",
      method: :get,
      response: [
        {200, {GetListTagRelationshipListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get List Tags

  Return all tags associated with the given list ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:read`
  `tags:read`

  ## Options

    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_list_tags(String.t(), keyword) ::
          {:ok, GetTagResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_list_tags(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag]"])

    client.request(%{
      args: [id: id],
      call: {Lists, :get_list_tags},
      url: "/api/lists/#{id}/tags/",
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
  Get Lists

  Get all lists in an account.

  Filter to request a subset of all lists. Lists can be filtered by `id`, `name`, `created`, and `updated` fields.

  Returns a maximum of 10 results per page.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `lists:read`

  ## Options

    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`name`: `any`, `equals`<br>`id`: `any`, `equals`<br>`created`: `greater-than`<br>`updated`: `greater-than`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_lists(keyword) ::
          {:ok, GetListListResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_lists(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[list]", :"fields[tag]", :filter, :include, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Lists, :get_lists},
      url: "/api/lists/",
      method: :get,
      query: query,
      response: [
        {200, {GetListListResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update List

  Update the name of a list with the given list ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  """
  @spec update_list(String.t(), ListPartialUpdateQuery.t(), keyword) ::
          {:ok, PatchListPartialUpdateResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_list(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Lists, :update_list},
      url: "/api/lists/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {ListPartialUpdateQuery, :t}}],
      response: [
        {200, {PatchListPartialUpdateResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
