defmodule Campaigns do
  @moduledoc """
  Provides API endpoints related to campaigns
  """

  @default_client Client

  @doc """
  Create Campaign

  Creates a campaign given a set of parameters, then returns it.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec create_campaign(CampaignCreateQuery.t(), keyword) ::
          {:ok, PostCampaignResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_campaign(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Campaigns, :create_campaign},
      url: "/api/campaigns/",
      body: body,
      method: :post,
      request: [{"application/json", {CampaignCreateQuery, :t}}],
      response: [
        {201, {PostCampaignResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Campaign Clone

  Clones an existing campaign, returning a new campaign based on the original with a new ID and name.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec create_campaign_clone(CampaignCloneQuery.t(), keyword) ::
          {:ok, PostCampaignResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_campaign_clone(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Campaigns, :create_campaign_clone},
      url: "/api/campaign-clone/",
      body: body,
      method: :post,
      request: [{"application/json", {CampaignCloneQuery, :t}}],
      response: [
        {201, {PostCampaignResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Assign Campaign Message Template

  Creates a non-reusable version of the template and assigns it to the message.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec create_campaign_message_assign_template(CampaignMessageAssignTemplateQuery.t(), keyword) ::
          {:ok, PostCampaignMessageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_campaign_message_assign_template(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Campaigns, :create_campaign_message_assign_template},
      url: "/api/campaign-message-assign-template/",
      body: body,
      method: :post,
      request: [{"application/json", {CampaignMessageAssignTemplateQuery, :t}}],
      response: [
        {201, {PostCampaignMessageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Campaign Recipient Estimation Job

  Trigger an asynchronous job to update the estimated number of recipients
  for the given campaign ID. Use the `Get Campaign Recipient Estimation
  Job` endpoint to retrieve the status of this estimation job. Use the
  `Get Campaign Recipient Estimation` endpoint to retrieve the estimated
  recipient count for a given campaign.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec create_campaign_recipient_estimation_job(
          CampaignRecipientEstimationJobCreateQuery.t(),
          keyword
        ) ::
          {:ok, PostCampaignRecipientEstimationJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_campaign_recipient_estimation_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Campaigns, :create_campaign_recipient_estimation_job},
      url: "/api/campaign-recipient-estimation-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CampaignRecipientEstimationJobCreateQuery, :t}}],
      response: [
        {202, {PostCampaignRecipientEstimationJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Campaign Send Job

  Trigger a campaign to send asynchronously<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec create_campaign_send_job(CampaignSendJobCreateQuery.t(), keyword) ::
          {:ok, PostCampaignSendJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_campaign_send_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Campaigns, :create_campaign_send_job},
      url: "/api/campaign-send-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CampaignSendJobCreateQuery, :t}}],
      response: [
        {202, {PostCampaignSendJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Campaign

  Delete a campaign with the given campaign ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec delete_campaign(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_campaign(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Campaigns, :delete_campaign},
      url: "/api/campaigns/#{id}/",
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
  Get Campaign

  Returns a specific campaign based on a required id.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[campaign]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_campaign(String.t(), keyword) ::
          {:ok, GetCampaignResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[campaign-message]",
        :"fields[campaign]",
        :"fields[tag]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign},
      url: "/api/campaigns/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Campaign Messages

  Return all messages that belong to the given campaign.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[campaign]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_campaign_campaign_messages(String.t(), keyword) ::
          {:ok, GetCampaignMessageResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_campaign_messages(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[campaign-message]",
        :"fields[campaign]",
        :"fields[template]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_campaign_messages},
      url: "/api/campaigns/#{id}/campaign-messages/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignMessageResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Message

  Returns a specific message based on a required id.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[campaign]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_campaign_message(String.t(), keyword) ::
          {:ok, GetCampaignMessageResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_message(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[campaign-message]",
        :"fields[campaign]",
        :"fields[template]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_message},
      url: "/api/campaign-messages/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignMessageResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Message Campaign

  Return the related campaign<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_message_campaign(String.t(), keyword) ::
          {:ok, GetCampaignResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_message_campaign(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[campaign]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_message_campaign},
      url: "/api/campaign-messages/#{id}/campaign/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Message Relationships Campaign

  Returns the ID of the related campaign<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`
  """
  @spec get_campaign_message_relationships_campaign(String.t(), keyword) ::
          {:ok, GetCampaignMessageCampaignRelationshipListResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_message_relationships_campaign(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_message_relationships_campaign},
      url: "/api/campaign-messages/#{id}/relationships/campaign/",
      method: :get,
      response: [
        {200, {GetCampaignMessageCampaignRelationshipListResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Message Relationships Template

  Returns the ID of the related template<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`
  `templates:read`
  """
  @spec get_campaign_message_relationships_template(String.t(), keyword) ::
          {:ok, GetCampaignMessageTemplateRelationshipListResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_message_relationships_template(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_message_relationships_template},
      url: "/api/campaign-messages/#{id}/relationships/template/",
      method: :get,
      response: [
        {200, {GetCampaignMessageTemplateRelationshipListResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Message Template

  Return the related template<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`
  `templates:read`

  ## Options

    * `fields[template]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_message_template(String.t(), keyword) ::
          {:ok, GetTemplateResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_message_template(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[template]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_message_template},
      url: "/api/campaign-messages/#{id}/template/",
      method: :get,
      query: query,
      response: [
        {200, {GetTemplateResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Recipient Estimation

  Get the estimated recipient count for a campaign with the provided campaign ID.
  You can refresh this count by using the `Create Campaign Recipient Estimation Job` endpoint.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-recipient-estimation]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_recipient_estimation(String.t(), keyword) ::
          {:ok, GetCampaignRecipientEstimationResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_recipient_estimation(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[campaign-recipient-estimation]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_recipient_estimation},
      url: "/api/campaign-recipient-estimations/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignRecipientEstimationResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Recipient Estimation Job

  Retrieve the status of a recipient estimation job triggered
  with the `Create Campaign Recipient Estimation Job` endpoint.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-recipient-estimation-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_recipient_estimation_job(String.t(), keyword) ::
          {:ok, GetCampaignRecipientEstimationJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_recipient_estimation_job(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[campaign-recipient-estimation-job]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_recipient_estimation_job},
      url: "/api/campaign-recipient-estimation-jobs/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignRecipientEstimationJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Relationships Campaign Messages

  Returns the IDs of all messages associated with the given campaign.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`
  """
  @spec get_campaign_relationships_campaign_messages(String.t(), keyword) ::
          {:ok, GetCampaignMessagesRelationshipListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_relationships_campaign_messages(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_relationships_campaign_messages},
      url: "/api/campaigns/#{id}/relationships/campaign-messages/",
      method: :get,
      response: [
        {200, {GetCampaignMessagesRelationshipListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Relationships Tags

  Returns the IDs of all tags associated with the given campaign.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `campaigns:read`
  `tags:read`
  """
  @spec get_campaign_relationships_tags(String.t(), keyword) ::
          {:ok, GetCampaignTagRelationshipListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_relationships_tags(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_relationships_tags},
      url: "/api/campaigns/#{id}/relationships/tags/",
      method: :get,
      response: [
        {200, {GetCampaignTagRelationshipListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Send Job

  Get a campaign send job<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `fields[campaign-send-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_send_job(String.t(), keyword) ::
          {:ok, GetCampaignSendJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_send_job(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[campaign-send-job]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_send_job},
      url: "/api/campaign-send-jobs/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignSendJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Campaign Tags

  Return all tags that belong to the given campaign.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `campaigns:read`
  `tags:read`

  ## Options

    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_campaign_tags(String.t(), keyword) ::
          {:ok, GetTagResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaign_tags(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[tag]"])

    client.request(%{
      args: [id: id],
      call: {Campaigns, :get_campaign_tags},
      url: "/api/campaigns/#{id}/tags/",
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
  Get Campaigns

  Returns some or all campaigns based on filters.

  A channel filter is required to list campaigns. Please provide either:
  `?filter=equals(messages.channel,'email')` to list email campaigns, or
  `?filter=equals(messages.channel,'sms')` to list SMS campaigns.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:read`

  ## Options

    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`messages.channel`: `equals`<br>`name`: `contains`<br>`status`: `any`, `equals`<br>`archived`: `equals`<br>`created_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`scheduled_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`updated_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`
    * `fields[campaign-message]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[campaign]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[tag]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_campaigns(keyword) ::
          {:ok, GetCampaignResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_campaigns(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[campaign-message]",
        :"fields[campaign]",
        :"fields[tag]",
        :filter,
        :include,
        :"page[cursor]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Campaigns, :get_campaigns},
      url: "/api/campaigns/",
      method: :get,
      query: query,
      response: [
        {200, {GetCampaignResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Campaign

  Update a campaign with the given campaign ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec update_campaign(String.t(), CampaignPartialUpdateQuery.t(), keyword) ::
          {:ok, PatchCampaignResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_campaign(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Campaigns, :update_campaign},
      url: "/api/campaigns/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CampaignPartialUpdateQuery, :t}}],
      response: [
        {200, {PatchCampaignResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Campaign Message

  Update a campaign message<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec update_campaign_message(String.t(), CampaignMessagePartialUpdateQuery.t(), keyword) ::
          {:ok, PatchCampaignMessageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_campaign_message(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Campaigns, :update_campaign_message},
      url: "/api/campaign-messages/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CampaignMessagePartialUpdateQuery, :t}}],
      response: [
        {200, {PatchCampaignMessageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Campaign Send Job

  Permanently cancel the campaign, setting the status to CANCELED or
  revert the campaign, setting the status back to DRAFT<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `campaigns:write`
  """
  @spec update_campaign_send_job(String.t(), CampaignSendJobPartialUpdateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_campaign_send_job(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Campaigns, :update_campaign_send_job},
      url: "/api/campaign-send-jobs/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CampaignSendJobPartialUpdateQuery, :t}}],
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
