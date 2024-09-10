defmodule MessagingApi do
  @moduledoc """
  Provides API endpoints related to messaging api
  """

  @default_client Client

  @doc """
  post `/bot/ad/multicast/phone`

  Send a message using phone number

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/partner-docs/#phone-audience-match)

  """
  @spec audience_match(AudienceMatchMessagesRequest.t(), keyword) :: :ok | :error
  def audience_match(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :audience_match},
      url: "/bot/ad/multicast/phone",
      body: body,
      method: :post,
      request: [{"application/json", {AudienceMatchMessagesRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/broadcast`

  Sends a message to multiple users at any time.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#send-broadcast-message)

  """
  @spec broadcast(BroadcastRequest.t(), keyword) :: {:ok, map} | {:error, ErrorResponse.t()}
  def broadcast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :broadcast},
      url: "/v2/bot/message/broadcast",
      body: body,
      method: :post,
      request: [{"application/json", {BroadcastRequest, :t}}],
      response: [
        {200, :map},
        {400, {ErrorResponse, :t}},
        {403, {ErrorResponse, :t}},
        {409, {ErrorResponse, :t}},
        {429, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/v2/bot/user/all/richmenu`

  Cancel default rich menu

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#cancel-default-rich-menu)

  """
  @spec cancel_default_rich_menu(keyword) :: :ok | :error
  def cancel_default_rich_menu(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :cancel_default_rich_menu},
      url: "/v2/bot/user/all/richmenu",
      method: :delete,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu`

  Create rich menu

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#create-rich-menu)

  """
  @spec create_rich_menu(RichMenuRequest.t(), keyword) :: {:ok, RichMenuIdResponse.t()} | :error
  def create_rich_menu(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :create_rich_menu},
      url: "/v2/bot/richmenu",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuRequest, :t}}],
      response: [{200, {RichMenuIdResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/alias`

  Create rich menu alias

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#create-rich-menu-alias)

  """
  @spec create_rich_menu_alias(CreateRichMenuAliasRequest.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def create_rich_menu_alias(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :create_rich_menu_alias},
      url: "/v2/bot/richmenu/alias",
      body: body,
      method: :post,
      request: [{"application/json", {CreateRichMenuAliasRequest, :t}}],
      response: [{200, :null}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/v2/bot/richmenu/{richMenuId}`

  Deletes a rich menu.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#delete-rich-menu)

  """
  @spec delete_rich_menu(String.t(), keyword) :: :ok | :error
  def delete_rich_menu(richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId],
      call: {MessagingApi, :delete_rich_menu},
      url: "/v2/bot/richmenu/#{richMenuId}",
      method: :delete,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  delete `/v2/bot/richmenu/alias/{richMenuAliasId}`

  Delete rich menu alias

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#delete-rich-menu-alias)

  """
  @spec delete_rich_menu_alias(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_rich_menu_alias(richMenuAliasId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuAliasId: richMenuAliasId],
      call: {MessagingApi, :delete_rich_menu_alias},
      url: "/v2/bot/richmenu/alias/#{richMenuAliasId}",
      method: :delete,
      response: [{200, :null}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/ad_phone`

  Get result of message delivery using phone number

  ## Options

    * `date`: Date the message was sent
      
      Format: `yyyyMMdd` (e.g. `20190831`)
      Time Zone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/partner-docs/#get-phone-audience-match)

  """
  @spec get_ad_phone_message_statistics(keyword) :: {:ok, NumberOfMessagesResponse.t()} | :error
  def get_ad_phone_message_statistics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_ad_phone_message_statistics},
      url: "/v2/bot/message/delivery/ad_phone",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/aggregation/list`

  Get name list of units used this month

  ## Options

    * `limit`: The maximum number of aggregation units you can get per request.
      
    * `start`: Value of the continuation token found in the next property of the JSON object returned in the response.
      If you can't get all the aggregation units in one request, include this parameter to get the remaining array.
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-name-list-of-units-used-this-month)

  """
  @spec get_aggregation_unit_name_list(keyword) ::
          {:ok, GetAggregationUnitNameListResponse.t()} | :error
  def get_aggregation_unit_name_list(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :start])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_aggregation_unit_name_list},
      url: "/v2/bot/message/aggregation/list",
      method: :get,
      query: query,
      response: [{200, {GetAggregationUnitNameListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/aggregation/info`

  Get number of units used this month

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-number-of-units-used-this-month)

  """
  @spec get_aggregation_unit_usage(keyword) :: {:ok, GetAggregationUnitUsageResponse.t()} | :error
  def get_aggregation_unit_usage(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_aggregation_unit_usage},
      url: "/v2/bot/message/aggregation/info",
      method: :get,
      response: [{200, {GetAggregationUnitUsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/info`

  Get bot info

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-bot-info)

  """
  @spec get_bot_info(keyword) :: {:ok, BotInfoResponse.t()} | :error
  def get_bot_info(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_bot_info},
      url: "/v2/bot/info",
      method: :get,
      response: [{200, {BotInfoResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/user/all/richmenu`

  Gets the ID of the default rich menu set with the Messaging API.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-default-rich-menu-id)

  """
  @spec get_default_rich_menu_id(keyword) :: {:ok, RichMenuIdResponse.t()} | :error
  def get_default_rich_menu_id(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_default_rich_menu_id},
      url: "/v2/bot/user/all/richmenu",
      method: :get,
      response: [{200, {RichMenuIdResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/followers/ids`

  Get a list of users who added your LINE Official Account as a friend

  ## Options

    * `start`: Value of the continuation token found in the next property of the JSON object returned in the response.
      Include this parameter to get the next array of user IDs.
      
    * `limit`: The maximum number of user IDs to retrieve in a single request.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-follower-ids)

  """
  @spec get_followers(keyword) :: {:ok, GetFollowersResponse.t()} | :error
  def get_followers(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :start])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_followers},
      url: "/v2/bot/followers/ids",
      method: :get,
      query: query,
      response: [{200, {GetFollowersResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/group/{groupId}/members/count`

  Get number of users in a group chat

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-members-group-count)

  """
  @spec get_group_member_count(String.t(), keyword) ::
          {:ok, GroupMemberCountResponse.t()} | :error
  def get_group_member_count(groupId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [groupId: groupId],
      call: {MessagingApi, :get_group_member_count},
      url: "/v2/bot/group/#{groupId}/members/count",
      method: :get,
      response: [{200, {GroupMemberCountResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/group/{groupId}/member/{userId}`

  Get group chat member profile

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-group-member-profile)

  """
  @spec get_group_member_profile(String.t(), String.t(), keyword) ::
          {:ok, GroupUserProfileResponse.t()} | :error
  def get_group_member_profile(groupId, userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [groupId: groupId, userId: userId],
      call: {MessagingApi, :get_group_member_profile},
      url: "/v2/bot/group/#{groupId}/member/#{userId}",
      method: :get,
      response: [{200, {GroupUserProfileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/group/{groupId}/members/ids`

  Get group chat member user IDs

  ## Options

    * `start`: Value of the continuation token found in the `next` property of the JSON object returned in the response.
      Include this parameter to get the next array of user IDs for the members of the group.
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-group-member-user-ids)

  """
  @spec get_group_members_ids(String.t(), keyword) :: {:ok, MembersIdsResponse.t()} | :error
  def get_group_members_ids(groupId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:start])

    client.request(%{
      args: [groupId: groupId],
      call: {MessagingApi, :get_group_members_ids},
      url: "/v2/bot/group/#{groupId}/members/ids",
      method: :get,
      query: query,
      response: [{200, {MembersIdsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/group/{groupId}/summary`

  Get group chat summary

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-group-summary)

  """
  @spec get_group_summary(String.t(), keyword) :: {:ok, GroupSummaryResponse.t()} | :error
  def get_group_summary(groupId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [groupId: groupId],
      call: {MessagingApi, :get_group_summary},
      url: "/v2/bot/group/#{groupId}/summary",
      method: :get,
      response: [{200, {GroupSummaryResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/membership/list`

  Get a list of memberships.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-membership-plans)

  """
  @spec get_membership_list(keyword) ::
          {:ok, MembershipListResponse.t()} | {:error, ErrorResponse.t()}
  def get_membership_list(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_membership_list},
      url: "/v2/bot/membership/list",
      method: :get,
      response: [{200, {MembershipListResponse, :t}}, {404, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/membership/subscription/{userId}`

  Get a user's membership subscription.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-a-users-membership-subscription-status)

  """
  @spec get_membership_subscription(String.t(), keyword) ::
          {:ok, GetMembershipSubscriptionResponse.t()} | {:error, ErrorResponse.t()}
  def get_membership_subscription(userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId],
      call: {MessagingApi, :get_membership_subscription},
      url: "/v2/bot/membership/subscription/#{userId}",
      method: :get,
      response: [
        {200, {GetMembershipSubscriptionResponse, :t}},
        {400, {ErrorResponse, :t}},
        {404, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/quota`

  Gets the target limit for sending messages in the current month. The total number of the free messages and the additional messages is returned.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-quota)

  """
  @spec get_message_quota(keyword) :: {:ok, MessageQuotaResponse.t()} | :error
  def get_message_quota(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_message_quota},
      url: "/v2/bot/message/quota",
      method: :get,
      response: [{200, {MessageQuotaResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/quota/consumption`

  Gets the number of messages sent in the current month.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-consumption)

  """
  @spec get_message_quota_consumption(keyword) :: {:ok, QuotaConsumptionResponse.t()} | :error
  def get_message_quota_consumption(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_message_quota_consumption},
      url: "/v2/bot/message/quota/consumption",
      method: :get,
      response: [{200, {QuotaConsumptionResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/progress/narrowcast`

  Gets the status of a narrowcast message.

  ## Options

    * `requestId`: The narrowcast message's request ID. Each Messaging API request has a request ID.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-narrowcast-progress-status)

  """
  @spec get_narrowcast_progress(keyword) :: {:ok, NarrowcastProgressResponse.t()} | :error
  def get_narrowcast_progress(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:requestId])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_narrowcast_progress},
      url: "/v2/bot/message/progress/narrowcast",
      method: :get,
      query: query,
      response: [{200, {NarrowcastProgressResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/broadcast`

  Get number of sent broadcast messages

  ## Options

    * `date`: Date the messages were sent
      
      Format: yyyyMMdd (e.g. 20191231)
      Timezone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-number-of-broadcast-messages)

  """
  @spec get_number_of_sent_broadcast_messages(keyword) ::
          {:ok, NumberOfMessagesResponse.t()} | :error
  def get_number_of_sent_broadcast_messages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_number_of_sent_broadcast_messages},
      url: "/v2/bot/message/delivery/broadcast",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/multicast`

  Get number of sent multicast messages

  ## Options

    * `date`: Date the messages were sent
      
      Format: `yyyyMMdd` (e.g. `20191231`)
      Timezone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-number-of-multicast-messages)

  """
  @spec get_number_of_sent_multicast_messages(keyword) ::
          {:ok, NumberOfMessagesResponse.t()} | :error
  def get_number_of_sent_multicast_messages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_number_of_sent_multicast_messages},
      url: "/v2/bot/message/delivery/multicast",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/push`

  Get number of sent push messages

  ## Options

    * `date`: Date the messages were sent
      
      Format: `yyyyMMdd` (e.g. `20191231`)
      Timezone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-number-of-push-messages)

  """
  @spec get_number_of_sent_push_messages(keyword) :: {:ok, NumberOfMessagesResponse.t()} | :error
  def get_number_of_sent_push_messages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_number_of_sent_push_messages},
      url: "/v2/bot/message/delivery/push",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/reply`

  Get number of sent reply messages

  ## Options

    * `date`: Date the messages were sent
      
      Format: `yyyyMMdd` (e.g. `20191231`)
      Timezone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-number-of-reply-messages)

  """
  @spec get_number_of_sent_reply_messages(keyword) :: {:ok, NumberOfMessagesResponse.t()} | :error
  def get_number_of_sent_reply_messages(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_number_of_sent_reply_messages},
      url: "/v2/bot/message/delivery/reply",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/delivery/pnp`

  Get number of sent LINE notification messages　

  ## Options

    * `date`: Date the message was sent
      
      Format: `yyyyMMdd` (Example:`20211231`)
      Time zone: UTC+9
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/partner-docs/#get-number-of-sent-line-notification-messages)

  """
  @spec get_pnp_message_statistics(keyword) :: {:ok, NumberOfMessagesResponse.t()} | :error
  def get_pnp_message_statistics(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:date])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_pnp_message_statistics},
      url: "/v2/bot/message/delivery/pnp",
      method: :get,
      query: query,
      response: [{200, {NumberOfMessagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/profile/{userId}`

  Get profile

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-profile)

  """
  @spec get_profile(String.t(), keyword) :: {:ok, UserProfileResponse.t()} | :error
  def get_profile(userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId],
      call: {MessagingApi, :get_profile},
      url: "/v2/bot/profile/#{userId}",
      method: :get,
      response: [{200, {UserProfileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/{richMenuId}`

  Gets a rich menu via a rich menu ID.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-rich-menu)

  """
  @spec get_rich_menu(String.t(), keyword) :: {:ok, RichMenuResponse.t()} | :error
  def get_rich_menu(richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId],
      call: {MessagingApi, :get_rich_menu},
      url: "/v2/bot/richmenu/#{richMenuId}",
      method: :get,
      response: [{200, {RichMenuResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/alias/{richMenuAliasId}`

  Get rich menu alias information

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-rich-menu-alias-by-id)

  """
  @spec get_rich_menu_alias(String.t(), keyword) :: {:ok, RichMenuAliasResponse.t()} | :error
  def get_rich_menu_alias(richMenuAliasId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuAliasId: richMenuAliasId],
      call: {MessagingApi, :get_rich_menu_alias},
      url: "/v2/bot/richmenu/alias/#{richMenuAliasId}",
      method: :get,
      response: [{200, {RichMenuAliasResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/alias/list`

  Get list of rich menu alias

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-rich-menu-alias-list)

  """
  @spec get_rich_menu_alias_list(keyword) :: {:ok, RichMenuAliasListResponse.t()} | :error
  def get_rich_menu_alias_list(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_rich_menu_alias_list},
      url: "/v2/bot/richmenu/alias/list",
      method: :get,
      response: [{200, {RichMenuAliasListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/progress/batch`

  Get the status of Replace or unlink a linked rich menus in batches.

  ## Options

    * `requestId`: A request ID used to batch control the rich menu linked to the user. Each Messaging API request has a request ID.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-batch-control-rich-menus-progress-status)

  """
  @spec get_rich_menu_batch_progress(keyword) :: {:ok, RichMenuBatchProgressResponse.t()} | :error
  def get_rich_menu_batch_progress(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:requestId])

    client.request(%{
      args: [],
      call: {MessagingApi, :get_rich_menu_batch_progress},
      url: "/v2/bot/richmenu/progress/batch",
      method: :get,
      query: query,
      response: [{200, {RichMenuBatchProgressResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/user/{userId}/richmenu`

  Get rich menu ID of user

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-rich-menu-id-of-user)

  """
  @spec get_rich_menu_id_of_user(String.t(), keyword) :: {:ok, RichMenuIdResponse.t()} | :error
  def get_rich_menu_id_of_user(userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId],
      call: {MessagingApi, :get_rich_menu_id_of_user},
      url: "/v2/bot/user/#{userId}/richmenu",
      method: :get,
      response: [{200, {RichMenuIdResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/list`

  Get rich menu list

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-rich-menu-list)

  """
  @spec get_rich_menu_list(keyword) :: {:ok, RichMenuListResponse.t()} | :error
  def get_rich_menu_list(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_rich_menu_list},
      url: "/v2/bot/richmenu/list",
      method: :get,
      response: [{200, {RichMenuListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/room/{roomId}/members/count`

  Get number of users in a multi-person chat

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-members-room-count)

  """
  @spec get_room_member_count(String.t(), keyword) :: {:ok, RoomMemberCountResponse.t()} | :error
  def get_room_member_count(roomId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [roomId: roomId],
      call: {MessagingApi, :get_room_member_count},
      url: "/v2/bot/room/#{roomId}/members/count",
      method: :get,
      response: [{200, {RoomMemberCountResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/room/{roomId}/member/{userId}`

  Get multi-person chat member profile

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-room-member-profile)

  """
  @spec get_room_member_profile(String.t(), String.t(), keyword) ::
          {:ok, RoomUserProfileResponse.t()} | :error
  def get_room_member_profile(roomId, userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [roomId: roomId, userId: userId],
      call: {MessagingApi, :get_room_member_profile},
      url: "/v2/bot/room/#{roomId}/member/#{userId}",
      method: :get,
      response: [{200, {RoomUserProfileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/room/{roomId}/members/ids`

  Get multi-person chat member user IDs

  ## Options

    * `start`: Value of the continuation token found in the `next` property of the JSON object returned in the response.
      Include this parameter to get the next array of user IDs for the members of the group.
      

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-room-member-user-ids)

  """
  @spec get_room_members_ids(String.t(), keyword) :: {:ok, MembersIdsResponse.t()} | :error
  def get_room_members_ids(roomId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:start])

    client.request(%{
      args: [roomId: roomId],
      call: {MessagingApi, :get_room_members_ids},
      url: "/v2/bot/room/#{roomId}/members/ids",
      method: :get,
      query: query,
      response: [{200, {MembersIdsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/channel/webhook/endpoint`

  Get webhook endpoint information

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-webhook-endpoint-information)

  """
  @spec get_webhook_endpoint(keyword) :: {:ok, GetWebhookEndpointResponse.t()} | :error
  def get_webhook_endpoint(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {MessagingApi, :get_webhook_endpoint},
      url: "/v2/bot/channel/webhook/endpoint",
      method: :get,
      response: [{200, {GetWebhookEndpointResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/user/{userId}/linkToken`

  Issue link token

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#issue-link-token)

  """
  @spec issue_link_token(String.t(), keyword) :: {:ok, IssueLinkTokenResponse.t()} | :error
  def issue_link_token(userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId],
      call: {MessagingApi, :issue_link_token},
      url: "/v2/bot/user/#{userId}/linkToken",
      method: :post,
      response: [{200, {IssueLinkTokenResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/group/{groupId}/leave`

  Leave group chat

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#leave-group)

  """
  @spec leave_group(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def leave_group(groupId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [groupId: groupId],
      call: {MessagingApi, :leave_group},
      url: "/v2/bot/group/#{groupId}/leave",
      method: :post,
      response: [{200, :null}, {400, {ErrorResponse, :t}}, {404, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/room/{roomId}/leave`

  Leave multi-person chat

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#leave-room)

  """
  @spec leave_room(String.t(), keyword) :: :ok | :error
  def leave_room(roomId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [roomId: roomId],
      call: {MessagingApi, :leave_room},
      url: "/v2/bot/room/#{roomId}/leave",
      method: :post,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/user/{userId}/richmenu/{richMenuId}`

  Link rich menu to user.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#link-rich-menu-to-user)

  """
  @spec link_rich_menu_id_to_user(String.t(), String.t(), keyword) :: :ok | :error
  def link_rich_menu_id_to_user(userId, richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId, richMenuId: richMenuId],
      call: {MessagingApi, :link_rich_menu_id_to_user},
      url: "/v2/bot/user/#{userId}/richmenu/#{richMenuId}",
      method: :post,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/bulk/link`

  Link rich menu to multiple users

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#link-rich-menu-to-users)

  """
  @spec link_rich_menu_id_to_users(RichMenuBulkLinkRequest.t(), keyword) :: :ok | :error
  def link_rich_menu_id_to_users(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :link_rich_menu_id_to_users},
      url: "/v2/bot/richmenu/bulk/link",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuBulkLinkRequest, :t}}],
      response: [{202, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/markAsRead`

  Mark messages from users as read

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/partner-docs/#mark-messages-from-users-as-read)

  """
  @spec mark_messages_as_read(MarkMessagesAsReadRequest.t(), keyword) :: :ok | :error
  def mark_messages_as_read(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :mark_messages_as_read},
      url: "/v2/bot/message/markAsRead",
      body: body,
      method: :post,
      request: [{"application/json", {MarkMessagesAsReadRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/multicast`

  An API that efficiently sends the same message to multiple user IDs. You can't send messages to group chats or multi-person chats.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#send-multicast-message)

  """
  @spec multicast(MulticastRequest.t(), keyword) :: {:ok, map} | {:error, ErrorResponse.t()}
  def multicast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :multicast},
      url: "/v2/bot/message/multicast",
      body: body,
      method: :post,
      request: [{"application/json", {MulticastRequest, :t}}],
      response: [
        {200, :map},
        {400, {ErrorResponse, :t}},
        {403, {ErrorResponse, :t}},
        {409, {ErrorResponse, :t}},
        {429, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/narrowcast`

  Send narrowcast message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#send-narrowcast-message)

  """
  @spec narrowcast(NarrowcastRequest.t(), keyword) :: {:ok, map} | {:error, ErrorResponse.t()}
  def narrowcast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :narrowcast},
      url: "/v2/bot/message/narrowcast",
      body: body,
      method: :post,
      request: [{"application/json", {NarrowcastRequest, :t}}],
      response: [
        {202, :map},
        {400, {ErrorResponse, :t}},
        {403, {ErrorResponse, :t}},
        {409, {ErrorResponse, :t}},
        {429, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/push`

  Sends a message to a user, group chat, or multi-person chat at any time.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#send-push-message)

  """
  @spec push_message(PushMessageRequest.t(), keyword) ::
          {:ok, PushMessageResponse.t()} | {:error, ErrorResponse.t()}
  def push_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :push_message},
      url: "/v2/bot/message/push",
      body: body,
      method: :post,
      request: [{"application/json", {PushMessageRequest, :t}}],
      response: [
        {200, {PushMessageResponse, :t}},
        {400, {ErrorResponse, :t}},
        {403, {ErrorResponse, :t}},
        {409, {ErrorResponse, :t}},
        {429, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/bot/pnp/push`

  Send LINE notification message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/partner-docs/#send-line-notification-message)

  """
  @spec push_messages_by_phone(PnpMessagesRequest.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def push_messages_by_phone(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :push_messages_by_phone},
      url: "/bot/pnp/push",
      body: body,
      method: :post,
      request: [{"application/json", {PnpMessagesRequest, :t}}],
      response: [{200, :null}, {422, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/reply`

  Send reply message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#send-reply-message)

  """
  @spec reply_message(ReplyMessageRequest.t(), keyword) ::
          {:ok, ReplyMessageResponse.t()} | {:error, ErrorResponse.t()}
  def reply_message(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :reply_message},
      url: "/v2/bot/message/reply",
      body: body,
      method: :post,
      request: [{"application/json", {ReplyMessageRequest, :t}}],
      response: [
        {200, {ReplyMessageResponse, :t}},
        {400, {ErrorResponse, :t}},
        {429, {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/batch`

  You can use this endpoint to batch control the rich menu linked to the users using the endpoint such as Link rich menu to user. 
  The following operations are available:

  1. Replace a rich menu with another rich menu for all users linked to a specific rich menu
  2. Unlink a rich menu for all users linked to a specific rich menu
  3. Unlink a rich menu for all users linked the rich menu


  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#batch-control-rich-menus-of-users)

  """
  @spec rich_menu_batch(RichMenuBatchRequest.t(), keyword) :: :ok | :error
  def rich_menu_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :rich_menu_batch},
      url: "/v2/bot/richmenu/batch",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuBatchRequest, :t}}],
      response: [{202, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/user/all/richmenu/{richMenuId}`

  Set default rich menu

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#set-default-rich-menu)

  """
  @spec set_default_rich_menu(String.t(), keyword) :: :ok | :error
  def set_default_rich_menu(richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId],
      call: {MessagingApi, :set_default_rich_menu},
      url: "/v2/bot/user/all/richmenu/#{richMenuId}",
      method: :post,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  put `/v2/bot/channel/webhook/endpoint`

  Set webhook endpoint URL

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#set-webhook-endpoint-url)

  """
  @spec set_webhook_endpoint(SetWebhookEndpointRequest.t(), keyword) :: :ok | :error
  def set_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :set_webhook_endpoint},
      url: "/v2/bot/channel/webhook/endpoint",
      body: body,
      method: :put,
      request: [{"application/json", {SetWebhookEndpointRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/chat/loading/start`

  Display a loading animation in one-on-one chats between users and LINE Official Accounts.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#display-a-loading-indicator)

  """
  @spec show_loading_animation(ShowLoadingAnimationRequest.t(), keyword) ::
          {:ok, map} | {:error, ErrorResponse.t()}
  def show_loading_animation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :show_loading_animation},
      url: "/v2/bot/chat/loading/start",
      body: body,
      method: :post,
      request: [{"application/json", {ShowLoadingAnimationRequest, :t}}],
      response: [{202, :map}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/channel/webhook/test`

  Test webhook endpoint

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#test-webhook-endpoint)

  """
  @spec test_webhook_endpoint(TestWebhookEndpointRequest.t(), keyword) ::
          {:ok, TestWebhookEndpointResponse.t()} | :error
  def test_webhook_endpoint(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :test_webhook_endpoint},
      url: "/v2/bot/channel/webhook/test",
      body: body,
      method: :post,
      request: [{"application/json", {TestWebhookEndpointRequest, :t}}],
      response: [{200, {TestWebhookEndpointResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/v2/bot/user/{userId}/richmenu`

  Unlink rich menu from user

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#unlink-rich-menu-from-user)

  """
  @spec unlink_rich_menu_id_from_user(String.t(), keyword) :: :ok | :error
  def unlink_rich_menu_id_from_user(userId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [userId: userId],
      call: {MessagingApi, :unlink_rich_menu_id_from_user},
      url: "/v2/bot/user/#{userId}/richmenu",
      method: :delete,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/bulk/unlink`

  Unlink rich menus from multiple users

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#unlink-rich-menu-from-users)

  """
  @spec unlink_rich_menu_id_from_users(RichMenuBulkUnlinkRequest.t(), keyword) :: :ok | :error
  def unlink_rich_menu_id_from_users(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :unlink_rich_menu_id_from_users},
      url: "/v2/bot/richmenu/bulk/unlink",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuBulkUnlinkRequest, :t}}],
      response: [{202, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/alias/{richMenuAliasId}`

  Update rich menu alias

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#update-rich-menu-alias)

  """
  @spec update_rich_menu_alias(String.t(), UpdateRichMenuAliasRequest.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def update_rich_menu_alias(richMenuAliasId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuAliasId: richMenuAliasId, body: body],
      call: {MessagingApi, :update_rich_menu_alias},
      url: "/v2/bot/richmenu/alias/#{richMenuAliasId}",
      body: body,
      method: :post,
      request: [{"application/json", {UpdateRichMenuAliasRequest, :t}}],
      response: [{200, :null}, {400, {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/validate/broadcast`

  Validate message objects of a broadcast message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-message-objects-of-broadcast-message)

  """
  @spec validate_broadcast(ValidateMessageRequest.t(), keyword) :: :ok | :error
  def validate_broadcast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_broadcast},
      url: "/v2/bot/message/validate/broadcast",
      body: body,
      method: :post,
      request: [{"application/json", {ValidateMessageRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/validate/multicast`

  Validate message objects of a multicast message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-message-objects-of-multicast-message)

  """
  @spec validate_multicast(ValidateMessageRequest.t(), keyword) :: :ok | :error
  def validate_multicast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_multicast},
      url: "/v2/bot/message/validate/multicast",
      body: body,
      method: :post,
      request: [{"application/json", {ValidateMessageRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/validate/narrowcast`

  Validate message objects of a narrowcast message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-message-objects-of-narrowcast-message)

  """
  @spec validate_narrowcast(ValidateMessageRequest.t(), keyword) :: :ok | :error
  def validate_narrowcast(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_narrowcast},
      url: "/v2/bot/message/validate/narrowcast",
      body: body,
      method: :post,
      request: [{"application/json", {ValidateMessageRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/validate/push`

  Validate message objects of a push message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-message-objects-of-push-message)

  """
  @spec validate_push(ValidateMessageRequest.t(), keyword) :: :ok | :error
  def validate_push(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_push},
      url: "/v2/bot/message/validate/push",
      body: body,
      method: :post,
      request: [{"application/json", {ValidateMessageRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/message/validate/reply`

  Validate message objects of a reply message

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-message-objects-of-reply-message)

  """
  @spec validate_reply(ValidateMessageRequest.t(), keyword) :: :ok | :error
  def validate_reply(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_reply},
      url: "/v2/bot/message/validate/reply",
      body: body,
      method: :post,
      request: [{"application/json", {ValidateMessageRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/validate/batch`

  Validate a request body of the Replace or unlink the linked rich menus in batches endpoint.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-batch-control-rich-menus-request)

  """
  @spec validate_rich_menu_batch_request(RichMenuBatchRequest.t(), keyword) :: :ok | :error
  def validate_rich_menu_batch_request(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_rich_menu_batch_request},
      url: "/v2/bot/richmenu/validate/batch",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuBatchRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/validate`

  Validate rich menu object

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#validate-rich-menu-object)

  """
  @spec validate_rich_menu_object(RichMenuRequest.t(), keyword) :: :ok | :error
  def validate_rich_menu_object(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {MessagingApi, :validate_rich_menu_object},
      url: "/v2/bot/richmenu/validate",
      body: body,
      method: :post,
      request: [{"application/json", {RichMenuRequest, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end
end
