defmodule Klaviyo.Flows do
  @moduledoc """
  Provides API endpoints related to flows
  """

  @default_client Klaviyo.Client

  @doc """
  Get Flow

  Get a flow with the given flow ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[flow]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_flow(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[flow-action]", :"fields[flow]", :"fields[tag]", :include])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow},
      url: "/api/flows/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Action

  Get a flow action from a flow with the given flow action ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[flow-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[flow]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_flow_action(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowActionResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_action(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[flow-action]",
        :"fields[flow-message]",
        :"fields[flow]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_action},
      url: "/api/flow-actions/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowActionResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow For Flow Action

  Get the flow associated with the given action ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_flow_action_flow(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_action_flow(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[flow]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_action_flow},
      url: "/api/flow-actions/#{id}/flow/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Action Messages

  Get all flow messages associated with the given action ID.

  Flow messages can be sorted by the following fields, in ascending and descending order:

  ascending: `id`,  `name`, `created`, `updated`
  descending: `-id`,  `-name`, `-created`, `-updated`

  Returns a maximum of 50 flows per request, which can be paginated with offset pagination. Offset pagination uses the following parameters: `page[size]` and `page[number]`<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`<br>`name`: `contains`, `ends-with`, `equals`, `starts-with`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[size]`: Default: 50. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_flow_action_messages(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowMessageResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_action_messages(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[flow-message]", :filter, :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_action_messages},
      url: "/api/flow-actions/#{id}/flow-messages/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowMessageResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Action Relationships Flow

  Get the flow associated with the given action ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`
  """
  @spec get_flow_action_relationships_flow(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowActionFlowRelationshipResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_action_relationships_flow(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_action_relationships_flow},
      url: "/api/flow-actions/#{id}/relationships/flow/",
      method: :get,
      response: [
        {200, {Klaviyo.GetFlowActionFlowRelationshipResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Action Relationships Messages

  Get all relationships for flow messages associated with the given flow action ID.

  Returns a maximum of 50 flow message relationships per request, which can be paginated with cursor-based pagination.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`name`: `contains`, `ends-with`, `equals`, `starts-with`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 50. Min: 1. Max: 50.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_flow_action_relationships_messages(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowActionFlowMessageRelationshipResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_action_relationships_messages(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :"page[cursor]", :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_action_relationships_messages},
      url: "/api/flow-actions/#{id}/relationships/flow-messages/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowActionFlowMessageRelationshipResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Flow Actions

  Get all flow actions associated with the given flow ID.

  Returns a maximum of 50 flows per request, which can be paginated with cursor-based pagination.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`<br>`action_type`: `any`, `equals`<br>`status`: `equals`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 50. Min: 1. Max: 50.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_flow_flow_actions(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowActionResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_flow_actions(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:"fields[flow-action]", :filter, :"page[cursor]", :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_flow_actions},
      url: "/api/flows/#{id}/flow-actions/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowActionResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Message

  Get the flow message of a flow with the given message ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[flow-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_flow_message(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowMessageResponseCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_message(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[flow-action]",
        :"fields[flow-message]",
        :"fields[template]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_message},
      url: "/api/flow-messages/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowMessageResponseCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Action For Message

  Get the flow action for a flow message with the given message ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_flow_message_action(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowActionResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_message_action(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[flow-action]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_message_action},
      url: "/api/flow-messages/#{id}/flow-action/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowActionResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Message Relationships Action

  Get the [relationship](https://developers.klaviyo.com/en/reference/api_overview#relationships) for a flow message's flow action, given the flow ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`
  """
  @spec get_flow_message_relationships_action(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowMessageFlowActionRelationshipResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_message_relationships_action(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_message_relationships_action},
      url: "/api/flow-messages/#{id}/relationships/flow-action/",
      method: :get,
      response: [
        {200, {Klaviyo.GetFlowMessageFlowActionRelationshipResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Message Relationships Template

  Returns the ID of the related template<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `templates:read`
  """
  @spec get_flow_message_relationships_template(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowMessageTemplateRelationshipResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_message_relationships_template(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_message_relationships_template},
      url: "/api/flow-messages/#{id}/relationships/template/",
      method: :get,
      response: [
        {200, {Klaviyo.GetFlowMessageTemplateRelationshipResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Message Template

  Return the related template<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `templates:read`

  ## Options

    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_flow_message_template(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetTemplateResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_message_template(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[template]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_message_template},
      url: "/api/flow-messages/#{id}/template/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetTemplateResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Relationships Flow Actions

  Get all [relationships](https://developers.klaviyo.com/en/reference/api_overview#relationships) for flow actions associated with the given flow ID.

  Flow action relationships can be sorted by the following fields, in ascending and descending order:
  `id`,  `status`, `created`, `updated`

  Use filters to narrow your results.

  Returns a maximum of 50 flow action relationships per request, which can be paginated with offset pagination. Offset pagination uses the following parameters: `page[size]` and `page[number]`.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`action_type`: `equals`<br>`status`: `equals`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `page[size]`: Default: 50. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_flow_relationships_flow_actions(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowFlowActionRelationshipListResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_relationships_flow_actions(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:filter, :"page[size]", :sort])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_relationships_flow_actions},
      url: "/api/flows/#{id}/relationships/flow-actions/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowFlowActionRelationshipListResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Relationships Tags

  Return the tag IDs of all tags associated with the given flow.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`
  `tags:read`
  """
  @spec get_flow_relationships_tags(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetFlowTagRelationshipListResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_relationships_tags(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_relationships_tags},
      url: "/api/flows/#{id}/relationships/tags/",
      method: :get,
      response: [
        {200, {Klaviyo.GetFlowTagRelationshipListResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flow Tags

  Return all tags associated with the given flow ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`
  `tags:read`

  ## Options

    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_flow_tags(id :: String.t(), opts :: keyword) ::
          {:ok, Klaviyo.GetTagResponseCollection.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flow_tags(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag]"])

    client.request(%{
      args: [id: id],
      call: {Klaviyo.Flows, :get_flow_tags},
      url: "/api/flows/#{id}/tags/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetTagResponseCollection, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Flows

  Get all flows in an account.

  Returns a maximum of 50 flows per request, which can be paginated with cursor-based pagination.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:read`

  ## Options

    * `fields[flow-action]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[flow]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`<br>`name`: `contains`, `ends-with`, `equals`, `starts-with`<br>`status`: `equals`<br>`archived`: `equals`<br>`created`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated`: `equals`, `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`trigger_type`: `equals`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 50. Min: 1. Max: 50.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_flows(opts :: keyword) ::
          {:ok, Klaviyo.GetFlowResponseCollectionCompoundDocument.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def get_flows(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[flow-action]",
        :"fields[flow]",
        :"fields[tag]",
        :filter,
        :include,
        :"page[cursor]",
        :"page[size]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Klaviyo.Flows, :get_flows},
      url: "/api/flows/",
      method: :get,
      query: query,
      response: [
        {200, {Klaviyo.GetFlowResponseCollectionCompoundDocument, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Flow Status

  Update the status of a flow with the given flow ID, and all actions in that flow.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `flows:write`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_flow(id :: String.t(), body :: Klaviyo.FlowUpdateQuery.t(), opts :: keyword) ::
          {:ok, Klaviyo.PatchFlowResponse.t()}
          | {:error, Klaviyo.ClientError.json_resp() | Klaviyo.ServerError.json_resp()}
  def update_flow(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Klaviyo.Flows, :update_flow},
      url: "/api/flows/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {Klaviyo.FlowUpdateQuery, :t}}],
      response: [
        {200, {Klaviyo.PatchFlowResponse, :t}},
        {"4XX", {Klaviyo.ClientError, :json_resp}},
        {"5XX", {Klaviyo.ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
