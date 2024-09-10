defmodule Operations do
  @moduledoc """
  Provides API endpoints related to operations
  """

  @default_client Client

  @doc """
  put `/channels/{channel_id}/recipients/{user_id}`
  """
  @spec add_group_dm_user(String.t(), String.t(), map, keyword) ::
          {:ok, PrivateChannelResponse.t() | PrivateGroupChannelResponse.t()}
          | {:error, ErrorResponse.t()}
  def add_group_dm_user(channel_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id, body: body],
      call: {Operations, :add_group_dm_user},
      url: "/channels/#{channel_id}/recipients/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {201, {:union, [{PrivateChannelResponse, :t}, {PrivateGroupChannelResponse, :t}]}},
        {204, :null},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/members/{user_id}`
  """
  @spec add_guild_member(String.t(), String.t(), map, keyword) ::
          {:ok, GuildMemberResponse.t()} | {:error, ErrorResponse.t()}
  def add_guild_member(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Operations, :add_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{201, {GuildMemberResponse, :t}}, {204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/members/{user_id}/roles/{role_id}`
  """
  @spec add_guild_member_role(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def add_guild_member_role(guild_id, user_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, role_id: role_id],
      call: {Operations, :add_guild_member_role},
      url: "/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me`
  """
  @spec add_my_message_reaction(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def add_my_message_reaction(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Operations, :add_my_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/@me",
      method: :put,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/thread-members/{user_id}`
  """
  @spec add_thread_member(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def add_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Operations, :add_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/bans/{user_id}`
  """
  @spec ban_user_from_guild(String.t(), String.t(), map, keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def ban_user_from_guild(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Operations, :ban_user_from_guild},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/bulk-ban`
  """
  @spec bulk_ban_users_from_guild(String.t(), map, keyword) ::
          {:ok, BulkBanUsersResponse.t()} | {:error, ErrorResponse.t()}
  def bulk_ban_users_from_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :bulk_ban_users_from_guild},
      url: "/guilds/#{guild_id}/bulk-ban",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {BulkBanUsersResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/bulk-delete`
  """
  @spec bulk_delete_messages(String.t(), map, keyword) :: :ok | {:error, ErrorResponse.t()}
  def bulk_delete_messages(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :bulk_delete_messages},
      url: "/channels/#{channel_id}/messages/bulk-delete",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/commands`
  """
  @spec bulk_set_application_commands(String.t(), [map] | nil, keyword) ::
          {:ok, [ApplicationCommandResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def bulk_set_application_commands(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :bulk_set_application_commands},
      url: "/applications/#{application_id}/commands",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [
        {200, {:union, [[{ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/guilds/{guild_id}/commands`
  """
  @spec bulk_set_guild_application_commands(String.t(), String.t(), [map] | nil, keyword) ::
          {:ok, [ApplicationCommandResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def bulk_set_guild_application_commands(application_id, guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, body: body],
      call: {Operations, :bulk_set_guild_application_commands},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [
        {200, {:union, [[{ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/channels`
  """
  @spec bulk_update_guild_channels(String.t(), [map], keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def bulk_update_guild_channels(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :bulk_update_guild_channels},
      url: "/guilds/#{guild_id}/channels",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/roles`
  """
  @spec bulk_update_guild_roles(String.t(), [map], keyword) ::
          {:ok, [GuildRoleResponse.t()]} | {:error, ErrorResponse.t()}
  def bulk_update_guild_roles(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :bulk_update_guild_roles},
      url: "/guilds/#{guild_id}/roles",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [{200, [{GuildRoleResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/entitlements/{entitlement_id}/consume`
  """
  @spec consume_entitlement(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def consume_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Operations, :consume_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}/consume",
      method: :post,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/commands`
  """
  @spec create_application_command(String.t(), ApplicationCommandCreateRequest.t(), keyword) ::
          {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def create_application_command(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :create_application_command},
      url: "/applications/#{application_id}/commands",
      body: body,
      method: :post,
      request: [{"application/json", {ApplicationCommandCreateRequest, :t}}],
      response: [
        {200, {ApplicationCommandResponse, :t}},
        {201, {ApplicationCommandResponse, :t}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/auto-moderation/rules`
  """
  @spec create_auto_moderation_rule(
          String.t(),
          DefaultKeywordListUpsertRequest.t()
          | KeywordUpsertRequest.t()
          | MLSpamUpsertRequest.t()
          | MentionSpamUpsertRequest.t(),
          keyword
        ) ::
          {:ok,
           DefaultKeywordRuleResponse.t()
           | KeywordRuleResponse.t()
           | MLSpamRuleResponse.t()
           | MentionSpamRuleResponse.t()
           | SpamLinkRuleResponse.t()}
          | {:error, ErrorResponse.t()}
  def create_auto_moderation_rule(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {DefaultKeywordListUpsertRequest, :t},
            {KeywordUpsertRequest, :t},
            {MLSpamUpsertRequest, :t},
            {MentionSpamUpsertRequest, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {DefaultKeywordRuleResponse, :t},
            {KeywordRuleResponse, :t},
            {MLSpamRuleResponse, :t},
            {MentionSpamRuleResponse, :t},
            {SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/invites`
  """
  @spec create_channel_invite(
          String.t(),
          CreateGroupDMInviteRequest.t() | CreateGuildInviteRequest.t(),
          keyword
        ) ::
          {:ok, FriendInviteResponse.t() | GroupDMInviteResponse.t() | GuildInviteResponse.t()}
          | {:error, ErrorResponse.t()}
  def create_channel_invite(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :create_channel_invite},
      url: "/channels/#{channel_id}/invites",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{CreateGroupDMInviteRequest, :t}, {CreateGuildInviteRequest, :t}]}}
      ],
      response: [
        {200,
         {:union,
          [{FriendInviteResponse, :t}, {GroupDMInviteResponse, :t}, {GuildInviteResponse, :t}]}},
        {204, :null},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/users/@me/channels`
  """
  @spec create_dm(CreatePrivateChannelRequest.t(), keyword) ::
          {:ok, PrivateChannelResponse.t() | PrivateGroupChannelResponse.t()}
          | {:error, ErrorResponse.t()}
  def create_dm(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :create_dm},
      url: "/users/@me/channels",
      body: body,
      method: :post,
      request: [{"application/json", {CreatePrivateChannelRequest, :t}}],
      response: [
        {200, {:union, [{PrivateChannelResponse, :t}, {PrivateGroupChannelResponse, :t}]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/entitlements`
  """
  @spec create_entitlement(String.t(), CreateEntitlementRequestData.t(), keyword) ::
          {:ok, EntitlementResponse.t()} | {:error, ErrorResponse.t()}
  def create_entitlement(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :create_entitlement},
      url: "/applications/#{application_id}/entitlements",
      body: body,
      method: :post,
      request: [{"application/json", {CreateEntitlementRequestData, :t}}],
      response: [{200, {EntitlementResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds`
  """
  @spec create_guild(GuildCreateRequest.t(), keyword) ::
          {:ok, GuildResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :create_guild},
      url: "/guilds",
      body: body,
      method: :post,
      request: [{"application/json", {GuildCreateRequest, :t}}],
      response: [{201, {GuildResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/guilds/{guild_id}/commands`
  """
  @spec create_guild_application_command(
          String.t(),
          String.t(),
          ApplicationCommandCreateRequest.t(),
          keyword
        ) :: {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_application_command(application_id, guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, body: body],
      call: {Operations, :create_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      body: body,
      method: :post,
      request: [{"application/json", {ApplicationCommandCreateRequest, :t}}],
      response: [
        {200, {ApplicationCommandResponse, :t}},
        {201, {ApplicationCommandResponse, :t}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/channels`
  """
  @spec create_guild_channel(String.t(), CreateGuildChannelRequest.t(), keyword) ::
          {:ok, GuildChannelResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_channel(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_channel},
      url: "/guilds/#{guild_id}/channels",
      body: body,
      method: :post,
      request: [{"application/json", {CreateGuildChannelRequest, :t}}],
      response: [{201, {GuildChannelResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/emojis`
  """
  @spec create_guild_emoji(String.t(), map, keyword) ::
          {:ok, EmojiResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_emoji(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_emoji},
      url: "/guilds/#{guild_id}/emojis",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {EmojiResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/templates/{code}`
  """
  @spec create_guild_from_template(String.t(), map, keyword) ::
          {:ok, GuildResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_from_template(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Operations, :create_guild_from_template},
      url: "/guilds/templates/#{code}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {GuildResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/roles`
  """
  @spec create_guild_role(String.t(), map, keyword) ::
          {:ok, GuildRoleResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_role(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_role},
      url: "/guilds/#{guild_id}/roles",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GuildRoleResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/scheduled-events`
  """
  @spec create_guild_scheduled_event(
          String.t(),
          ExternalScheduledEventCreateRequest.t()
          | StageScheduledEventCreateRequest.t()
          | VoiceScheduledEventCreateRequest.t(),
          keyword
        ) ::
          {:ok,
           ExternalScheduledEventResponse.t()
           | StageScheduledEventResponse.t()
           | VoiceScheduledEventResponse.t()}
          | {:error, ErrorResponse.t()}
  def create_guild_scheduled_event(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {ExternalScheduledEventCreateRequest, :t},
            {StageScheduledEventCreateRequest, :t},
            {VoiceScheduledEventCreateRequest, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {ExternalScheduledEventResponse, :t},
            {StageScheduledEventResponse, :t},
            {VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/stickers`
  """
  @spec create_guild_sticker(String.t(), map, keyword) ::
          {:ok, GuildStickerResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_sticker(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_sticker},
      url: "/guilds/#{guild_id}/stickers",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [{201, {GuildStickerResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/templates`
  """
  @spec create_guild_template(String.t(), map, keyword) ::
          {:ok, GuildTemplateResponse.t()} | {:error, ErrorResponse.t()}
  def create_guild_template(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :create_guild_template},
      url: "/guilds/#{guild_id}/templates",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GuildTemplateResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/interactions/{interaction_id}/{interaction_token}/callback`
  """
  @spec create_interaction_response(
          String.t(),
          String.t(),
          ApplicationCommandAutocompleteCallbackRequest.t()
          | CreateMessageInteractionCallbackRequest.t()
          | ModalInteractionCallbackRequest.t()
          | PongInteractionCallbackRequest.t()
          | UpdateMessageInteractionCallbackRequest.t(),
          keyword
        ) :: :ok | {:error, ErrorResponse.t()}
  def create_interaction_response(interaction_id, interaction_token, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [interaction_id: interaction_id, interaction_token: interaction_token, body: body],
      call: {Operations, :create_interaction_response},
      url: "/interactions/#{interaction_id}/#{interaction_token}/callback",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {ApplicationCommandAutocompleteCallbackRequest, :t},
            {CreateMessageInteractionCallbackRequest, :t},
            {ModalInteractionCallbackRequest, :t},
            {PongInteractionCallbackRequest, :t},
            {UpdateMessageInteractionCallbackRequest, :t}
          ]}},
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {ApplicationCommandAutocompleteCallbackRequest, :t},
            {CreateMessageInteractionCallbackRequest, :t},
            {ModalInteractionCallbackRequest, :t},
            {PongInteractionCallbackRequest, :t},
            {UpdateMessageInteractionCallbackRequest, :t}
          ]}},
        {"multipart/form-data",
         {:union,
          [
            {ApplicationCommandAutocompleteCallbackRequest, :t},
            {CreateMessageInteractionCallbackRequest, :t},
            {ModalInteractionCallbackRequest, :t},
            {PongInteractionCallbackRequest, :t},
            {UpdateMessageInteractionCallbackRequest, :t}
          ]}}
      ],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages`
  """
  @spec create_message(String.t(), map | MessageCreateRequest.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def create_message(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :create_message},
      url: "/channels/#{channel_id}/messages",
      body: body,
      method: :post,
      request: [
        {"application/json", {MessageCreateRequest, :t}},
        {"application/x-www-form-urlencoded", {MessageCreateRequest, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/stage-instances`
  """
  @spec create_stage_instance(map, keyword) ::
          {:ok, StageInstanceResponse.t()} | {:error, ErrorResponse.t()}
  def create_stage_instance(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :create_stage_instance},
      url: "/stage-instances",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {StageInstanceResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/threads`
  """
  @spec create_thread(
          String.t(),
          CreateForumThreadRequest.t() | CreateTextThreadWithoutMessageRequest.t(),
          keyword
        ) :: {:ok, CreatedThreadResponse.t()} | {:error, ErrorResponse.t()}
  def create_thread(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :create_thread},
      url: "/channels/#{channel_id}/threads",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union, [{CreateForumThreadRequest, :t}, {CreateTextThreadWithoutMessageRequest, :t}]}},
        {"application/x-www-form-urlencoded",
         {:union, [{CreateForumThreadRequest, :t}, {CreateTextThreadWithoutMessageRequest, :t}]}},
        {"multipart/form-data",
         {:union, [{CreateForumThreadRequest, :t}, {CreateTextThreadWithoutMessageRequest, :t}]}}
      ],
      response: [{201, {CreatedThreadResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/{message_id}/threads`
  """
  @spec create_thread_from_message(
          String.t(),
          String.t(),
          CreateTextThreadWithMessageRequest.t(),
          keyword
        ) :: {:ok, ThreadResponse.t()} | {:error, ErrorResponse.t()}
  def create_thread_from_message(channel_id, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, body: body],
      call: {Operations, :create_thread_from_message},
      url: "/channels/#{channel_id}/messages/#{message_id}/threads",
      body: body,
      method: :post,
      request: [{"application/json", {CreateTextThreadWithMessageRequest, :t}}],
      response: [{201, {ThreadResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/webhooks`
  """
  @spec create_webhook(String.t(), map, keyword) ::
          {:ok, GuildIncomingWebhookResponse.t()} | {:error, ErrorResponse.t()}
  def create_webhook(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :create_webhook},
      url: "/channels/#{channel_id}/webhooks",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GuildIncomingWebhookResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/{message_id}/crosspost`
  """
  @spec crosspost_message(String.t(), String.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def crosspost_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :crosspost_message},
      url: "/channels/#{channel_id}/messages/#{message_id}/crosspost",
      method: :post,
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions`
  """
  @spec delete_all_message_reactions(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_all_message_reactions(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :delete_all_message_reactions},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}`
  """
  @spec delete_all_message_reactions_by_emoji(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_all_message_reactions_by_emoji(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Operations, :delete_all_message_reactions_by_emoji},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/commands/{command_id}`
  """
  @spec delete_application_command(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_application_command(application_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id],
      call: {Operations, :delete_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`
  """
  @spec delete_auto_moderation_rule(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_auto_moderation_rule(guild_id, rule_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id],
      call: {Operations, :delete_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}`
  """
  @spec delete_channel(String.t(), keyword) ::
          {:ok,
           GuildChannelResponse.t()
           | PrivateChannelResponse.t()
           | PrivateGroupChannelResponse.t()
           | ThreadResponse.t()}
          | {:error, ErrorResponse.t()}
  def delete_channel(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :delete_channel},
      url: "/channels/#{channel_id}",
      method: :delete,
      response: [
        {200,
         {:union,
          [
            {GuildChannelResponse, :t},
            {PrivateChannelResponse, :t},
            {PrivateGroupChannelResponse, :t},
            {ThreadResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/permissions/{overwrite_id}`
  """
  @spec delete_channel_permission_overwrite(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_channel_permission_overwrite(channel_id, overwrite_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, overwrite_id: overwrite_id],
      call: {Operations, :delete_channel_permission_overwrite},
      url: "/channels/#{channel_id}/permissions/#{overwrite_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/entitlements/{entitlement_id}`
  """
  @spec delete_entitlement(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Operations, :delete_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/recipients/{user_id}`
  """
  @spec delete_group_dm_user(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_group_dm_user(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Operations, :delete_group_dm_user},
      url: "/channels/#{channel_id}/recipients/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}`
  """
  @spec delete_guild(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :delete_guild},
      url: "/guilds/#{guild_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`
  """
  @spec delete_guild_application_command(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_guild_application_command(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Operations, :delete_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/emojis/{emoji_id}`
  """
  @spec delete_guild_emoji(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_guild_emoji(guild_id, emoji_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id],
      call: {Operations, :delete_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/integrations/{integration_id}`
  """
  @spec delete_guild_integration(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_guild_integration(guild_id, integration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, integration_id: integration_id],
      call: {Operations, :delete_guild_integration},
      url: "/guilds/#{guild_id}/integrations/#{integration_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/members/{user_id}`
  """
  @spec delete_guild_member(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_guild_member(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Operations, :delete_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/members/{user_id}/roles/{role_id}`
  """
  @spec delete_guild_member_role(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_guild_member_role(guild_id, user_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, role_id: role_id],
      call: {Operations, :delete_guild_member_role},
      url: "/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/roles/{role_id}`
  """
  @spec delete_guild_role(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_guild_role(guild_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, role_id: role_id],
      call: {Operations, :delete_guild_role},
      url: "/guilds/#{guild_id}/roles/#{role_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`
  """
  @spec delete_guild_scheduled_event(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_guild_scheduled_event(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Operations, :delete_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/stickers/{sticker_id}`
  """
  @spec delete_guild_sticker(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_guild_sticker(guild_id, sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id],
      call: {Operations, :delete_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/templates/{code}`
  """
  @spec delete_guild_template(String.t(), String.t(), keyword) ::
          {:ok, GuildTemplateResponse.t()} | {:error, ErrorResponse.t()}
  def delete_guild_template(guild_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code],
      call: {Operations, :delete_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      method: :delete,
      response: [{200, {GuildTemplateResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}`
  """
  @spec delete_message(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :delete_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me`
  """
  @spec delete_my_message_reaction(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_my_message_reaction(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Operations, :delete_my_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/@me",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  """
  @spec delete_original_webhook_message(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_original_webhook_message(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Operations, :delete_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      method: :delete,
      query: query,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/stage-instances/{channel_id}`
  """
  @spec delete_stage_instance(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_stage_instance(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :delete_stage_instance},
      url: "/stage-instances/#{channel_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/thread-members/{user_id}`
  """
  @spec delete_thread_member(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Operations, :delete_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/{user_id}`
  """
  @spec delete_user_message_reaction(String.t(), String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_user_message_reaction(channel_id, message_id, emoji_name, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        channel_id: channel_id,
        message_id: message_id,
        emoji_name: emoji_name,
        user_id: user_id
      ],
      call: {Operations, :delete_user_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}`
  """
  @spec delete_webhook(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def delete_webhook(webhook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id],
      call: {Operations, :delete_webhook},
      url: "/webhooks/#{webhook_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}`
  """
  @spec delete_webhook_by_token(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_webhook_by_token(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Operations, :delete_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  """
  @spec delete_webhook_message(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def delete_webhook_message(webhook_id, webhook_token, message_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, message_id: message_id],
      call: {Operations, :delete_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      method: :delete,
      query: query,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}/github`

  ## Options

    * `wait`
    * `thread_id`

  """
  @spec execute_github_compatible_webhook(String.t(), String.t(), GithubWebhook.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def execute_github_compatible_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Operations, :execute_github_compatible_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/github",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {GithubWebhook, :t}}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}/slack`

  ## Options

    * `wait`
    * `thread_id`

  """
  @spec execute_slack_compatible_webhook(String.t(), String.t(), SlackWebhook.t(), keyword) ::
          {:ok, String.t() | nil} | {:error, ErrorResponse.t()}
  def execute_slack_compatible_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Operations, :execute_slack_compatible_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/slack",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {SlackWebhook, :t}},
        {"application/x-www-form-urlencoded", {SlackWebhook, :t}},
        {"multipart/form-data", {SlackWebhook, :t}}
      ],
      response: [{200, {:union, [{:string, :generic}, :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}`

  ## Options

    * `wait`
    * `thread_id`

  """
  @spec execute_webhook(
          String.t(),
          String.t(),
          IncomingWebhookRequestPartial.t() | IncomingWebhookUpdateRequestPartial.t(),
          keyword
        ) :: {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def execute_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Operations, :execute_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json",
         {:union,
          [{IncomingWebhookRequestPartial, :t}, {IncomingWebhookUpdateRequestPartial, :t}]}},
        {"application/x-www-form-urlencoded",
         {:union,
          [{IncomingWebhookRequestPartial, :t}, {IncomingWebhookUpdateRequestPartial, :t}]}},
        {"multipart/form-data",
         {:union,
          [{IncomingWebhookRequestPartial, :t}, {IncomingWebhookUpdateRequestPartial, :t}]}}
      ],
      response: [{200, {MessageResponse, :t}}, {204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/followers`
  """
  @spec follow_channel(String.t(), map, keyword) ::
          {:ok, ChannelFollowerResponse.t()} | {:error, ErrorResponse.t()}
  def follow_channel(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :follow_channel},
      url: "/channels/#{channel_id}/followers",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {ChannelFollowerResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/threads/active`
  """
  @spec get_active_guild_threads(String.t(), keyword) ::
          {:ok, ThreadsResponse.t()} | {:error, ErrorResponse.t()}
  def get_active_guild_threads(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_active_guild_threads},
      url: "/guilds/#{guild_id}/threads/active",
      method: :get,
      response: [{200, {ThreadsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}`
  """
  @spec get_application(String.t(), keyword) ::
          {:ok, PrivateApplicationResponse.t()} | {:error, ErrorResponse.t()}
  def get_application(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Operations, :get_application},
      url: "/applications/#{application_id}",
      method: :get,
      response: [{200, {PrivateApplicationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/commands/{command_id}`
  """
  @spec get_application_command(String.t(), String.t(), keyword) ::
          {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def get_application_command(application_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id],
      call: {Operations, :get_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      method: :get,
      response: [{200, {ApplicationCommandResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/role-connections/metadata`
  """
  @spec get_application_role_connections_metadata(String.t(), keyword) ::
          {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def get_application_role_connections_metadata(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Operations, :get_application_role_connections_metadata},
      url: "/applications/#{application_id}/role-connections/metadata",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/applications/{application_id}/role-connection`
  """
  @spec get_application_user_role_connection(String.t(), keyword) ::
          {:ok, ApplicationUserRoleConnectionResponse.t()} | {:error, ErrorResponse.t()}
  def get_application_user_role_connection(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Operations, :get_application_user_role_connection},
      url: "/users/@me/applications/#{application_id}/role-connection",
      method: :get,
      response: [{200, {ApplicationUserRoleConnectionResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`
  """
  @spec get_auto_moderation_rule(String.t(), String.t(), keyword) ::
          {:ok,
           DefaultKeywordRuleResponse.t()
           | KeywordRuleResponse.t()
           | MLSpamRuleResponse.t()
           | MentionSpamRuleResponse.t()
           | SpamLinkRuleResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_auto_moderation_rule(guild_id, rule_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id],
      call: {Operations, :get_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {DefaultKeywordRuleResponse, :t},
            {KeywordRuleResponse, :t},
            {MLSpamRuleResponse, :t},
            {MentionSpamRuleResponse, :t},
            {SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/gateway/bot`
  """
  @spec get_bot_gateway(keyword) :: {:ok, GatewayBotResponse.t()} | {:error, ErrorResponse.t()}
  def get_bot_gateway(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_bot_gateway},
      url: "/gateway/bot",
      method: :get,
      response: [{200, {GatewayBotResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}`
  """
  @spec get_channel(String.t(), keyword) ::
          {:ok,
           GuildChannelResponse.t()
           | PrivateChannelResponse.t()
           | PrivateGroupChannelResponse.t()
           | ThreadResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_channel(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :get_channel},
      url: "/channels/#{channel_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {GuildChannelResponse, :t},
            {PrivateChannelResponse, :t},
            {PrivateGroupChannelResponse, :t},
            {ThreadResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/entitlements/{entitlement_id}`
  """
  @spec get_entitlement(String.t(), String.t(), keyword) ::
          {:ok, EntitlementResponse.t()} | {:error, ErrorResponse.t()}
  def get_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Operations, :get_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}",
      method: :get,
      response: [{200, {EntitlementResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/entitlements`

  ## Options

    * `user_id`
    * `sku_ids`
    * `guild_id`
    * `before`
    * `after`
    * `limit`
    * `exclude_ended`
    * `only_active`

  """
  @spec get_entitlements(String.t(), keyword) ::
          {:ok, [EntitlementResponse.t() | nil]} | {:error, ErrorResponse.t()}
  def get_entitlements(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :before,
        :exclude_ended,
        :guild_id,
        :limit,
        :only_active,
        :sku_ids,
        :user_id
      ])

    client.request(%{
      args: [application_id: application_id],
      call: {Operations, :get_entitlements},
      url: "/applications/#{application_id}/entitlements",
      method: :get,
      query: query,
      response: [{200, [union: [{EntitlementResponse, :t}, :null]]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/gateway`
  """
  @spec get_gateway(keyword) :: {:ok, GatewayResponse.t()} | {:error, ErrorResponse.t()}
  def get_gateway(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_gateway},
      url: "/gateway",
      method: :get,
      response: [{200, {GatewayResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}`

  ## Options

    * `with_counts`

  """
  @spec get_guild(String.t(), keyword) ::
          {:ok, GuildWithCountsResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_counts])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild},
      url: "/guilds/#{guild_id}",
      method: :get,
      query: query,
      response: [{200, {GuildWithCountsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`
  """
  @spec get_guild_application_command(String.t(), String.t(), String.t(), keyword) ::
          {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_application_command(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Operations, :get_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      method: :get,
      response: [{200, {ApplicationCommandResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions`
  """
  @spec get_guild_application_command_permissions(String.t(), String.t(), String.t(), keyword) ::
          {:ok, CommandPermissionsResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_application_command_permissions(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Operations, :get_guild_application_command_permissions},
      url:
        "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}/permissions",
      method: :get,
      response: [{200, {CommandPermissionsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/bans/{user_id}`
  """
  @spec get_guild_ban(String.t(), String.t(), keyword) ::
          {:ok, GuildBanResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_ban(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Operations, :get_guild_ban},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      method: :get,
      response: [{200, {GuildBanResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/emojis/{emoji_id}`
  """
  @spec get_guild_emoji(String.t(), String.t(), keyword) ::
          {:ok, EmojiResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_emoji(guild_id, emoji_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id],
      call: {Operations, :get_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      method: :get,
      response: [{200, {EmojiResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/members/{user_id}`
  """
  @spec get_guild_member(String.t(), String.t(), keyword) ::
          {:ok, GuildMemberResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_member(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Operations, :get_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      method: :get,
      response: [{200, {GuildMemberResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/new-member-welcome`
  """
  @spec get_guild_new_member_welcome(String.t(), keyword) ::
          {:ok, GuildHomeSettingsResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_new_member_welcome(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_new_member_welcome},
      url: "/guilds/#{guild_id}/new-member-welcome",
      method: :get,
      response: [
        {200, {GuildHomeSettingsResponse, :t}},
        {204, :null},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/preview`
  """
  @spec get_guild_preview(String.t(), keyword) ::
          {:ok, GuildPreviewResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_preview(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_preview},
      url: "/guilds/#{guild_id}/preview",
      method: :get,
      response: [{200, {GuildPreviewResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`

  ## Options

    * `with_user_count`

  """
  @spec get_guild_scheduled_event(String.t(), String.t(), keyword) ::
          {:ok,
           ExternalScheduledEventResponse.t()
           | StageScheduledEventResponse.t()
           | VoiceScheduledEventResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_guild_scheduled_event(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_user_count])

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Operations, :get_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {ExternalScheduledEventResponse, :t},
            {StageScheduledEventResponse, :t},
            {VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/stickers/{sticker_id}`
  """
  @spec get_guild_sticker(String.t(), String.t(), keyword) ::
          {:ok, GuildStickerResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_sticker(guild_id, sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id],
      call: {Operations, :get_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      method: :get,
      response: [{200, {GuildStickerResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/templates/{code}`
  """
  @spec get_guild_template(String.t(), keyword) ::
          {:ok, GuildTemplateResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_template(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Operations, :get_guild_template},
      url: "/guilds/templates/#{code}",
      method: :get,
      response: [{200, {GuildTemplateResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/vanity-url`
  """
  @spec get_guild_vanity_url(String.t(), keyword) ::
          {:ok, VanityURLResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_vanity_url(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_vanity_url},
      url: "/guilds/#{guild_id}/vanity-url",
      method: :get,
      response: [{200, {VanityURLResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/webhooks`
  """
  @spec get_guild_webhooks(String.t(), keyword) ::
          {:ok,
           [
             ApplicationIncomingWebhookResponse.t()
             | ChannelFollowerWebhookResponse.t()
             | GuildIncomingWebhookResponse.t()
           ]
           | nil}
          | {:error, ErrorResponse.t()}
  def get_guild_webhooks(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_webhooks},
      url: "/guilds/#{guild_id}/webhooks",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {ApplicationIncomingWebhookResponse, :t},
                {ChannelFollowerWebhookResponse, :t},
                {GuildIncomingWebhookResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/welcome-screen`
  """
  @spec get_guild_welcome_screen(String.t(), keyword) ::
          {:ok, GuildWelcomeScreenResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_welcome_screen(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_welcome_screen},
      url: "/guilds/#{guild_id}/welcome-screen",
      method: :get,
      response: [{200, {GuildWelcomeScreenResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget.json`
  """
  @spec get_guild_widget(String.t(), keyword) ::
          {:ok, WidgetResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_widget(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_widget},
      url: "/guilds/#{guild_id}/widget.json",
      method: :get,
      response: [{200, {WidgetResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget.png`

  ## Options

    * `style`

  """
  @spec get_guild_widget_png(String.t(), keyword) ::
          {:ok, String.t()} | {:error, ErrorResponse.t()}
  def get_guild_widget_png(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:style])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_widget_png},
      url: "/guilds/#{guild_id}/widget.png",
      method: :get,
      query: query,
      response: [{200, {:string, :generic}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget`
  """
  @spec get_guild_widget_settings(String.t(), keyword) ::
          {:ok, WidgetSettingsResponse.t()} | {:error, ErrorResponse.t()}
  def get_guild_widget_settings(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guild_widget_settings},
      url: "/guilds/#{guild_id}/widget",
      method: :get,
      response: [{200, {WidgetSettingsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/onboarding`
  """
  @spec get_guilds_onboarding(String.t(), keyword) ::
          {:ok, UserGuildOnboardingResponse.t()} | {:error, ErrorResponse.t()}
  def get_guilds_onboarding(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_guilds_onboarding},
      url: "/guilds/#{guild_id}/onboarding",
      method: :get,
      response: [{200, {UserGuildOnboardingResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/messages/{message_id}`
  """
  @spec get_message(String.t(), String.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def get_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :get_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      method: :get,
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/@me`
  """
  @spec get_my_application(keyword) ::
          {:ok, PrivateApplicationResponse.t()} | {:error, ErrorResponse.t()}
  def get_my_application(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_my_application},
      url: "/applications/@me",
      method: :get,
      response: [{200, {PrivateApplicationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/guilds/{guild_id}/member`
  """
  @spec get_my_guild_member(String.t(), keyword) ::
          {:ok, PrivateGuildMemberResponse.t()} | {:error, ErrorResponse.t()}
  def get_my_guild_member(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :get_my_guild_member},
      url: "/users/@me/guilds/#{guild_id}/member",
      method: :get,
      response: [{200, {PrivateGuildMemberResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/applications/@me`
  """
  @spec get_my_oauth2_application(keyword) ::
          {:ok, PrivateApplicationResponse.t()} | {:error, ErrorResponse.t()}
  def get_my_oauth2_application(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_my_oauth2_application},
      url: "/oauth2/applications/@me",
      method: :get,
      response: [{200, {PrivateApplicationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/@me`
  """
  @spec get_my_oauth2_authorization(keyword) ::
          {:ok, OAuth2GetAuthorizationResponse.t()} | {:error, ErrorResponse.t()}
  def get_my_oauth2_authorization(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_my_oauth2_authorization},
      url: "/oauth2/@me",
      method: :get,
      response: [{200, {OAuth2GetAuthorizationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me`
  """
  @spec get_my_user(keyword) :: {:ok, UserPIIResponse.t()} | {:error, ErrorResponse.t()}
  def get_my_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_my_user},
      url: "/users/@me",
      method: :get,
      response: [{200, {UserPIIResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  """
  @spec get_original_webhook_message(String.t(), String.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def get_original_webhook_message(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Operations, :get_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      method: :get,
      query: query,
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/keys`
  """
  @spec get_public_keys(keyword) :: {:ok, OAuth2GetKeys.t()} | {:error, ErrorResponse.t()}
  def get_public_keys(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :get_public_keys},
      url: "/oauth2/keys",
      method: :get,
      response: [{200, {OAuth2GetKeys, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/stage-instances/{channel_id}`
  """
  @spec get_stage_instance(String.t(), keyword) ::
          {:ok, StageInstanceResponse.t()} | {:error, ErrorResponse.t()}
  def get_stage_instance(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :get_stage_instance},
      url: "/stage-instances/#{channel_id}",
      method: :get,
      response: [{200, {StageInstanceResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/stickers/{sticker_id}`
  """
  @spec get_sticker(String.t(), keyword) ::
          {:ok, GuildStickerResponse.t() | StandardStickerResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_sticker(sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sticker_id: sticker_id],
      call: {Operations, :get_sticker},
      url: "/stickers/#{sticker_id}",
      method: :get,
      response: [
        {200, {:union, [{GuildStickerResponse, :t}, {StandardStickerResponse, :t}]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/thread-members/{user_id}`

  ## Options

    * `with_member`

  """
  @spec get_thread_member(String.t(), String.t(), keyword) ::
          {:ok, ThreadMemberResponse.t()} | {:error, ErrorResponse.t()}
  def get_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_member])

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Operations, :get_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :get,
      query: query,
      response: [{200, {ThreadMemberResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/{user_id}`
  """
  @spec get_user(String.t(), keyword) :: {:ok, UserResponse.t()} | {:error, ErrorResponse.t()}
  def get_user(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Operations, :get_user},
      url: "/users/#{user_id}",
      method: :get,
      response: [{200, {UserResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}`
  """
  @spec get_webhook(String.t(), keyword) ::
          {:ok,
           ApplicationIncomingWebhookResponse.t()
           | ChannelFollowerWebhookResponse.t()
           | GuildIncomingWebhookResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_webhook(webhook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id],
      call: {Operations, :get_webhook},
      url: "/webhooks/#{webhook_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {ApplicationIncomingWebhookResponse, :t},
            {ChannelFollowerWebhookResponse, :t},
            {GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}`
  """
  @spec get_webhook_by_token(String.t(), String.t(), keyword) ::
          {:ok,
           ApplicationIncomingWebhookResponse.t()
           | ChannelFollowerWebhookResponse.t()
           | GuildIncomingWebhookResponse.t()}
          | {:error, ErrorResponse.t()}
  def get_webhook_by_token(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Operations, :get_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {ApplicationIncomingWebhookResponse, :t},
            {ChannelFollowerWebhookResponse, :t},
            {GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  """
  @spec get_webhook_message(String.t(), String.t(), String.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def get_webhook_message(webhook_id, webhook_token, message_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, message_id: message_id],
      call: {Operations, :get_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      method: :get,
      query: query,
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/invites/{code}`

  ## Options

    * `with_counts`
    * `guild_scheduled_event_id`

  """
  @spec invite_resolve(String.t(), keyword) ::
          {:ok, FriendInviteResponse.t() | GroupDMInviteResponse.t() | GuildInviteResponse.t()}
          | {:error, ErrorResponse.t()}
  def invite_resolve(code, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:guild_scheduled_event_id, :with_counts])

    client.request(%{
      args: [code: code],
      call: {Operations, :invite_resolve},
      url: "/invites/#{code}",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [{FriendInviteResponse, :t}, {GroupDMInviteResponse, :t}, {GuildInviteResponse, :t}]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/invites/{code}`
  """
  @spec invite_revoke(String.t(), keyword) ::
          {:ok, FriendInviteResponse.t() | GroupDMInviteResponse.t() | GuildInviteResponse.t()}
          | {:error, ErrorResponse.t()}
  def invite_revoke(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Operations, :invite_revoke},
      url: "/invites/#{code}",
      method: :delete,
      response: [
        {200,
         {:union,
          [{FriendInviteResponse, :t}, {GroupDMInviteResponse, :t}, {GuildInviteResponse, :t}]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/thread-members/@me`
  """
  @spec join_thread(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def join_thread(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :join_thread},
      url: "/channels/#{channel_id}/thread-members/@me",
      method: :put,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/users/@me/guilds/{guild_id}`
  """
  @spec leave_guild(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def leave_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :leave_guild},
      url: "/users/@me/guilds/#{guild_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/thread-members/@me`
  """
  @spec leave_thread(String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def leave_thread(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :leave_thread},
      url: "/channels/#{channel_id}/thread-members/@me",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/commands`

  ## Options

    * `with_localizations`

  """
  @spec list_application_commands(String.t(), keyword) ::
          {:ok, [ApplicationCommandResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_application_commands(application_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_localizations])

    client.request(%{
      args: [application_id: application_id],
      call: {Operations, :list_application_commands},
      url: "/applications/#{application_id}/commands",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/auto-moderation/rules`
  """
  @spec list_auto_moderation_rules(String.t(), keyword) ::
          {:ok,
           [
             DefaultKeywordRuleResponse.t()
             | KeywordRuleResponse.t()
             | MLSpamRuleResponse.t()
             | MentionSpamRuleResponse.t()
             | SpamLinkRuleResponse.t()
             | nil
           ]
           | nil}
          | {:error, ErrorResponse.t()}
  def list_auto_moderation_rules(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_auto_moderation_rules},
      url: "/guilds/#{guild_id}/auto-moderation/rules",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {DefaultKeywordRuleResponse, :t},
                {KeywordRuleResponse, :t},
                {MLSpamRuleResponse, :t},
                {MentionSpamRuleResponse, :t},
                {SpamLinkRuleResponse, :t},
                :null
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/invites`
  """
  @spec list_channel_invites(String.t(), keyword) ::
          {:ok,
           [FriendInviteResponse.t() | GroupDMInviteResponse.t() | GuildInviteResponse.t()] | nil}
          | {:error, ErrorResponse.t()}
  def list_channel_invites(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_channel_invites},
      url: "/channels/#{channel_id}/invites",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {FriendInviteResponse, :t},
                {GroupDMInviteResponse, :t},
                {GuildInviteResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/webhooks`
  """
  @spec list_channel_webhooks(String.t(), keyword) ::
          {:ok,
           [
             ApplicationIncomingWebhookResponse.t()
             | ChannelFollowerWebhookResponse.t()
             | GuildIncomingWebhookResponse.t()
           ]
           | nil}
          | {:error, ErrorResponse.t()}
  def list_channel_webhooks(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_channel_webhooks},
      url: "/channels/#{channel_id}/webhooks",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {ApplicationIncomingWebhookResponse, :t},
                {ChannelFollowerWebhookResponse, :t},
                {GuildIncomingWebhookResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/permissions`
  """
  @spec list_guild_application_command_permissions(String.t(), String.t(), keyword) ::
          {:ok, [CommandPermissionsResponse.t()]} | {:error, ErrorResponse.t()}
  def list_guild_application_command_permissions(application_id, guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id],
      call: {Operations, :list_guild_application_command_permissions},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/permissions",
      method: :get,
      response: [{200, [{CommandPermissionsResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands`

  ## Options

    * `with_localizations`

  """
  @spec list_guild_application_commands(String.t(), String.t(), keyword) ::
          {:ok, [ApplicationCommandResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_guild_application_commands(application_id, guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_localizations])

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id],
      call: {Operations, :list_guild_application_commands},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/audit-logs`

  ## Options

    * `user_id`
    * `target_id`
    * `action_type`
    * `before`
    * `after`
    * `limit`

  """
  @spec list_guild_audit_log_entries(String.t(), keyword) ::
          {:ok, GuildAuditLogResponse.t()} | {:error, ErrorResponse.t()}
  def list_guild_audit_log_entries(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:action_type, :after, :before, :limit, :target_id, :user_id])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_audit_log_entries},
      url: "/guilds/#{guild_id}/audit-logs",
      method: :get,
      query: query,
      response: [{200, {GuildAuditLogResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/bans`

  ## Options

    * `limit`
    * `before`
    * `after`

  """
  @spec list_guild_bans(String.t(), keyword) ::
          {:ok, [GuildBanResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_guild_bans(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_bans},
      url: "/guilds/#{guild_id}/bans",
      method: :get,
      query: query,
      response: [{200, {:union, [[{GuildBanResponse, :t}], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/channels`
  """
  @spec list_guild_channels(String.t(), keyword) ::
          {:ok,
           [
             GuildChannelResponse.t()
             | PrivateChannelResponse.t()
             | PrivateGroupChannelResponse.t()
             | ThreadResponse.t()
           ]
           | nil}
          | {:error, ErrorResponse.t()}
  def list_guild_channels(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_channels},
      url: "/guilds/#{guild_id}/channels",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {GuildChannelResponse, :t},
                {PrivateChannelResponse, :t},
                {PrivateGroupChannelResponse, :t},
                {ThreadResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/emojis`
  """
  @spec list_guild_emojis(String.t(), keyword) ::
          {:ok, [EmojiResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_guild_emojis(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_emojis},
      url: "/guilds/#{guild_id}/emojis",
      method: :get,
      response: [{200, {:union, [[{EmojiResponse, :t}], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/integrations`
  """
  @spec list_guild_integrations(String.t(), keyword) ::
          {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def list_guild_integrations(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_integrations},
      url: "/guilds/#{guild_id}/integrations",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/invites`
  """
  @spec list_guild_invites(String.t(), keyword) ::
          {:ok,
           [FriendInviteResponse.t() | GroupDMInviteResponse.t() | GuildInviteResponse.t()] | nil}
          | {:error, ErrorResponse.t()}
  def list_guild_invites(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_invites},
      url: "/guilds/#{guild_id}/invites",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {FriendInviteResponse, :t},
                {GroupDMInviteResponse, :t},
                {GuildInviteResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/members`

  ## Options

    * `limit`
    * `after`

  """
  @spec list_guild_members(String.t(), keyword) ::
          {:ok, [GuildMemberResponse.t()]} | {:error, ErrorResponse.t()}
  def list_guild_members(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_members},
      url: "/guilds/#{guild_id}/members",
      method: :get,
      query: query,
      response: [{200, [{GuildMemberResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/roles`
  """
  @spec list_guild_roles(String.t(), keyword) ::
          {:ok, [GuildRoleResponse.t()]} | {:error, ErrorResponse.t()}
  def list_guild_roles(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_roles},
      url: "/guilds/#{guild_id}/roles",
      method: :get,
      response: [{200, [{GuildRoleResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}/users`

  ## Options

    * `with_member`
    * `limit`
    * `before`
    * `after`

  """
  @spec list_guild_scheduled_event_users(String.t(), String.t(), keyword) ::
          {:ok, [ScheduledEventUserResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_guild_scheduled_event_users(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :with_member])

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Operations, :list_guild_scheduled_event_users},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}/users",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{ScheduledEventUserResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/scheduled-events`

  ## Options

    * `with_user_count`

  """
  @spec list_guild_scheduled_events(String.t(), keyword) ::
          {:ok,
           [
             ExternalScheduledEventResponse.t()
             | StageScheduledEventResponse.t()
             | VoiceScheduledEventResponse.t()
           ]
           | nil}
          | {:error, ErrorResponse.t()}
  def list_guild_scheduled_events(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_user_count])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_scheduled_events},
      url: "/guilds/#{guild_id}/scheduled-events",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {ExternalScheduledEventResponse, :t},
                {StageScheduledEventResponse, :t},
                {VoiceScheduledEventResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/stickers`
  """
  @spec list_guild_stickers(String.t(), keyword) ::
          {:ok, [GuildStickerResponse.t()]} | {:error, ErrorResponse.t()}
  def list_guild_stickers(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_stickers},
      url: "/guilds/#{guild_id}/stickers",
      method: :get,
      response: [{200, [{GuildStickerResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/templates`
  """
  @spec list_guild_templates(String.t(), keyword) ::
          {:ok, [GuildTemplateResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_guild_templates(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_templates},
      url: "/guilds/#{guild_id}/templates",
      method: :get,
      response: [
        {200, {:union, [[{GuildTemplateResponse, :t}], :null]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/regions`
  """
  @spec list_guild_voice_regions(String.t(), keyword) ::
          {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def list_guild_voice_regions(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :list_guild_voice_regions},
      url: "/guilds/#{guild_id}/regions",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}`

  ## Options

    * `after`
    * `limit`

  """
  @spec list_message_reactions_by_emoji(String.t(), String.t(), String.t(), keyword) ::
          {:ok, [UserResponse.t()]} | {:error, ErrorResponse.t()}
  def list_message_reactions_by_emoji(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Operations, :list_message_reactions_by_emoji},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}",
      method: :get,
      query: query,
      response: [{200, [{UserResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/messages`

  ## Options

    * `around`
    * `before`
    * `after`
    * `limit`

  """
  @spec list_messages(String.t(), keyword) ::
          {:ok, [MessageResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_messages(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :around, :before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_messages},
      url: "/channels/#{channel_id}/messages",
      method: :get,
      query: query,
      response: [{200, {:union, [[{MessageResponse, :t}], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/connections`
  """
  @spec list_my_connections(keyword) :: {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def list_my_connections(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :list_my_connections},
      url: "/users/@me/connections",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/guilds`

  ## Options

    * `before`
    * `after`
    * `limit`
    * `with_counts`

  """
  @spec list_my_guilds(keyword) :: {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def list_my_guilds(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :with_counts])

    client.request(%{
      args: [],
      call: {Operations, :list_my_guilds},
      url: "/users/@me/guilds",
      method: :get,
      query: query,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/users/@me/threads/archived/private`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_my_private_archived_threads(String.t(), keyword) ::
          {:ok, ThreadsResponse.t()} | {:error, ErrorResponse.t()}
  def list_my_private_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_my_private_archived_threads},
      url: "/channels/#{channel_id}/users/@me/threads/archived/private",
      method: :get,
      query: query,
      response: [{200, {ThreadsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/pins`
  """
  @spec list_pinned_messages(String.t(), keyword) ::
          {:ok, [MessageResponse.t()] | nil} | {:error, ErrorResponse.t()}
  def list_pinned_messages(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_pinned_messages},
      url: "/channels/#{channel_id}/pins",
      method: :get,
      response: [{200, {:union, [[{MessageResponse, :t}], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/threads/archived/private`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_private_archived_threads(String.t(), keyword) ::
          {:ok, ThreadsResponse.t()} | {:error, ErrorResponse.t()}
  def list_private_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_private_archived_threads},
      url: "/channels/#{channel_id}/threads/archived/private",
      method: :get,
      query: query,
      response: [{200, {ThreadsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/threads/archived/public`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_public_archived_threads(String.t(), keyword) ::
          {:ok, ThreadsResponse.t()} | {:error, ErrorResponse.t()}
  def list_public_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_public_archived_threads},
      url: "/channels/#{channel_id}/threads/archived/public",
      method: :get,
      query: query,
      response: [{200, {ThreadsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/sticker-packs`
  """
  @spec list_sticker_packs(keyword) ::
          {:ok, StickerPackCollectionResponse.t()} | {:error, ErrorResponse.t()}
  def list_sticker_packs(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :list_sticker_packs},
      url: "/sticker-packs",
      method: :get,
      response: [{200, {StickerPackCollectionResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/thread-members`

  ## Options

    * `with_member`
    * `limit`
    * `after`

  """
  @spec list_thread_members(String.t(), keyword) ::
          {:ok, [ThreadMemberResponse.t()]} | {:error, ErrorResponse.t()}
  def list_thread_members(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :with_member])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :list_thread_members},
      url: "/channels/#{channel_id}/thread-members",
      method: :get,
      query: query,
      response: [{200, [{ThreadMemberResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/voice/regions`
  """
  @spec list_voice_regions(keyword) :: {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def list_voice_regions(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :list_voice_regions},
      url: "/voice/regions",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/pins/{message_id}`
  """
  @spec pin_message(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def pin_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :pin_message},
      url: "/channels/#{channel_id}/pins/#{message_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/prune`

  ## Options

    * `days`
    * `include_roles`

  """
  @spec preview_prune_guild(String.t(), keyword) ::
          {:ok, GuildPruneResponse.t()} | {:error, ErrorResponse.t()}
  def preview_prune_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:days, :include_roles])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :preview_prune_guild},
      url: "/guilds/#{guild_id}/prune",
      method: :get,
      query: query,
      response: [{200, {GuildPruneResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/prune`
  """
  @spec prune_guild(String.t(), map, keyword) ::
          {:ok, GuildPruneResponse.t()} | {:error, ErrorResponse.t()}
  def prune_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :prune_guild},
      url: "/guilds/#{guild_id}/prune",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GuildPruneResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/onboarding`
  """
  @spec put_guilds_onboarding(String.t(), UpdateGuildOnboardingRequest.t(), keyword) ::
          {:ok, GuildOnboardingResponse.t()} | {:error, ErrorResponse.t()}
  def put_guilds_onboarding(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :put_guilds_onboarding},
      url: "/guilds/#{guild_id}/onboarding",
      body: body,
      method: :put,
      request: [{"application/json", {UpdateGuildOnboardingRequest, :t}}],
      response: [{200, {GuildOnboardingResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/members/search`

  ## Options

    * `limit`
    * `query`

  """
  @spec search_guild_members(String.t(), keyword) ::
          {:ok, [GuildMemberResponse.t()]} | {:error, ErrorResponse.t()}
  def search_guild_members(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :query])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Operations, :search_guild_members},
      url: "/guilds/#{guild_id}/members/search",
      method: :get,
      query: query,
      response: [{200, [{GuildMemberResponse, :t}]}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/permissions/{overwrite_id}`
  """
  @spec set_channel_permission_overwrite(String.t(), String.t(), map, keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def set_channel_permission_overwrite(channel_id, overwrite_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, overwrite_id: overwrite_id, body: body],
      call: {Operations, :set_channel_permission_overwrite},
      url: "/channels/#{channel_id}/permissions/#{overwrite_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions`
  """
  @spec set_guild_application_command_permissions(
          String.t(),
          String.t(),
          String.t(),
          map,
          keyword
        ) :: {:ok, CommandPermissionsResponse.t()} | {:error, ErrorResponse.t()}
  def set_guild_application_command_permissions(
        application_id,
        guild_id,
        command_id,
        body,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        application_id: application_id,
        guild_id: guild_id,
        command_id: command_id,
        body: body
      ],
      call: {Operations, :set_guild_application_command_permissions},
      url:
        "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}/permissions",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {CommandPermissionsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/mfa`
  """
  @spec set_guild_mfa_level(String.t(), map, keyword) ::
          {:ok, GuildMFALevelResponse.t()} | {:error, ErrorResponse.t()}
  def set_guild_mfa_level(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :set_guild_mfa_level},
      url: "/guilds/#{guild_id}/mfa",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {GuildMFALevelResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/templates/{code}`
  """
  @spec sync_guild_template(String.t(), String.t(), keyword) ::
          {:ok, GuildTemplateResponse.t()} | {:error, ErrorResponse.t()}
  def sync_guild_template(guild_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code],
      call: {Operations, :sync_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      method: :put,
      response: [{200, {GuildTemplateResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/typing`
  """
  @spec trigger_typing_indicator(String.t(), keyword) :: {:ok, map} | {:error, ErrorResponse.t()}
  def trigger_typing_indicator(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Operations, :trigger_typing_indicator},
      url: "/channels/#{channel_id}/typing",
      method: :post,
      response: [{200, :map}, {204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/bans/{user_id}`
  """
  @spec unban_user_from_guild(String.t(), String.t(), keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def unban_user_from_guild(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Operations, :unban_user_from_guild},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/pins/{message_id}`
  """
  @spec unpin_message(String.t(), String.t(), keyword) :: :ok | {:error, ErrorResponse.t()}
  def unpin_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Operations, :unpin_message},
      url: "/channels/#{channel_id}/pins/#{message_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}`
  """
  @spec update_application(String.t(), ApplicationFormPartial.t(), keyword) ::
          {:ok, PrivateApplicationResponse.t()} | {:error, ErrorResponse.t()}
  def update_application(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :update_application},
      url: "/applications/#{application_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ApplicationFormPartial, :t}}],
      response: [{200, {PrivateApplicationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}/commands/{command_id}`
  """
  @spec update_application_command(
          String.t(),
          String.t(),
          ApplicationCommandPatchRequestPartial.t(),
          keyword
        ) :: {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def update_application_command(application_id, command_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id, body: body],
      call: {Operations, :update_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ApplicationCommandPatchRequestPartial, :t}}],
      response: [{200, {ApplicationCommandResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/role-connections/metadata`
  """
  @spec update_application_role_connections_metadata(String.t(), [map] | nil, keyword) ::
          {:ok, [map] | nil} | {:error, ErrorResponse.t()}
  def update_application_role_connections_metadata(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :update_application_role_connections_metadata},
      url: "/applications/#{application_id}/role-connections/metadata",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/users/@me/applications/{application_id}/role-connection`
  """
  @spec update_application_user_role_connection(String.t(), map, keyword) ::
          {:ok, ApplicationUserRoleConnectionResponse.t()} | {:error, ErrorResponse.t()}
  def update_application_user_role_connection(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Operations, :update_application_user_role_connection},
      url: "/users/@me/applications/#{application_id}/role-connection",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {ApplicationUserRoleConnectionResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`
  """
  @spec update_auto_moderation_rule(
          String.t(),
          String.t(),
          DefaultKeywordListUpsertRequestPartial.t()
          | KeywordUpsertRequestPartial.t()
          | MLSpamUpsertRequestPartial.t()
          | MentionSpamUpsertRequestPartial.t(),
          keyword
        ) ::
          {:ok,
           DefaultKeywordRuleResponse.t()
           | KeywordRuleResponse.t()
           | MLSpamRuleResponse.t()
           | MentionSpamRuleResponse.t()
           | SpamLinkRuleResponse.t()}
          | {:error, ErrorResponse.t()}
  def update_auto_moderation_rule(guild_id, rule_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id, body: body],
      call: {Operations, :update_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {DefaultKeywordListUpsertRequestPartial, :t},
            {KeywordUpsertRequestPartial, :t},
            {MLSpamUpsertRequestPartial, :t},
            {MentionSpamUpsertRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {DefaultKeywordRuleResponse, :t},
            {KeywordRuleResponse, :t},
            {MLSpamRuleResponse, :t},
            {MentionSpamRuleResponse, :t},
            {SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/channels/{channel_id}`
  """
  @spec update_channel(
          String.t(),
          PrivateChannelRequestPartial.t()
          | UpdateGuildChannelRequestPartial.t()
          | UpdateThreadRequestPartial.t(),
          keyword
        ) ::
          {:ok,
           GuildChannelResponse.t()
           | PrivateChannelResponse.t()
           | PrivateGroupChannelResponse.t()
           | ThreadResponse.t()}
          | {:error, ErrorResponse.t()}
  def update_channel(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :update_channel},
      url: "/channels/#{channel_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {PrivateChannelRequestPartial, :t},
            {UpdateGuildChannelRequestPartial, :t},
            {UpdateThreadRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {GuildChannelResponse, :t},
            {PrivateChannelResponse, :t},
            {PrivateGroupChannelResponse, :t},
            {ThreadResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}`
  """
  @spec update_guild(String.t(), GuildPatchRequestPartial.t(), keyword) ::
          {:ok, GuildResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :update_guild},
      url: "/guilds/#{guild_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {GuildPatchRequestPartial, :t}}],
      response: [{200, {GuildResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`
  """
  @spec update_guild_application_command(
          String.t(),
          String.t(),
          String.t(),
          ApplicationCommandPatchRequestPartial.t(),
          keyword
        ) :: {:ok, ApplicationCommandResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_application_command(application_id, guild_id, command_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        application_id: application_id,
        guild_id: guild_id,
        command_id: command_id,
        body: body
      ],
      call: {Operations, :update_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ApplicationCommandPatchRequestPartial, :t}}],
      response: [{200, {ApplicationCommandResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/emojis/{emoji_id}`
  """
  @spec update_guild_emoji(String.t(), String.t(), map, keyword) ::
          {:ok, EmojiResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_emoji(guild_id, emoji_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id, body: body],
      call: {Operations, :update_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {EmojiResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/members/{user_id}`
  """
  @spec update_guild_member(String.t(), String.t(), map, keyword) ::
          {:ok, GuildMemberResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_member(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Operations, :update_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GuildMemberResponse, :t}}, {204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/roles/{role_id}`
  """
  @spec update_guild_role(String.t(), String.t(), map, keyword) ::
          {:ok, GuildRoleResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_role(guild_id, role_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, role_id: role_id, body: body],
      call: {Operations, :update_guild_role},
      url: "/guilds/#{guild_id}/roles/#{role_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GuildRoleResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`
  """
  @spec update_guild_scheduled_event(
          String.t(),
          String.t(),
          ExternalScheduledEventPatchRequestPartial.t()
          | StageScheduledEventPatchRequestPartial.t()
          | VoiceScheduledEventPatchRequestPartial.t(),
          keyword
        ) ::
          {:ok,
           ExternalScheduledEventResponse.t()
           | StageScheduledEventResponse.t()
           | VoiceScheduledEventResponse.t()}
          | {:error, ErrorResponse.t()}
  def update_guild_scheduled_event(guild_id, guild_scheduled_event_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id, body: body],
      call: {Operations, :update_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {ExternalScheduledEventPatchRequestPartial, :t},
            {StageScheduledEventPatchRequestPartial, :t},
            {VoiceScheduledEventPatchRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {ExternalScheduledEventResponse, :t},
            {StageScheduledEventResponse, :t},
            {VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/stickers/{sticker_id}`
  """
  @spec update_guild_sticker(String.t(), String.t(), map, keyword) ::
          {:ok, GuildStickerResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_sticker(guild_id, sticker_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id, body: body],
      call: {Operations, :update_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GuildStickerResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/templates/{code}`
  """
  @spec update_guild_template(String.t(), String.t(), map, keyword) ::
          {:ok, GuildTemplateResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_template(guild_id, code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code, body: body],
      call: {Operations, :update_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {GuildTemplateResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/welcome-screen`
  """
  @spec update_guild_welcome_screen(String.t(), WelcomeScreenPatchRequestPartial.t(), keyword) ::
          {:ok, GuildWelcomeScreenResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_welcome_screen(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :update_guild_welcome_screen},
      url: "/guilds/#{guild_id}/welcome-screen",
      body: body,
      method: :patch,
      request: [{"application/json", {WelcomeScreenPatchRequestPartial, :t}}],
      response: [{200, {GuildWelcomeScreenResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/widget`
  """
  @spec update_guild_widget_settings(String.t(), map, keyword) ::
          {:ok, WidgetSettingsResponse.t()} | {:error, ErrorResponse.t()}
  def update_guild_widget_settings(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :update_guild_widget_settings},
      url: "/guilds/#{guild_id}/widget",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {WidgetSettingsResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/channels/{channel_id}/messages/{message_id}`
  """
  @spec update_message(String.t(), String.t(), map | MessageEditRequestPartial.t(), keyword) ::
          {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def update_message(channel_id, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, body: body],
      call: {Operations, :update_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json", {MessageEditRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {MessageEditRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/@me`
  """
  @spec update_my_application(ApplicationFormPartial.t(), keyword) ::
          {:ok, PrivateApplicationResponse.t()} | {:error, ErrorResponse.t()}
  def update_my_application(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :update_my_application},
      url: "/applications/@me",
      body: body,
      method: :patch,
      request: [{"application/json", {ApplicationFormPartial, :t}}],
      response: [{200, {PrivateApplicationResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/members/@me`
  """
  @spec update_my_guild_member(String.t(), map, keyword) ::
          {:ok, PrivateGuildMemberResponse.t()} | {:error, ErrorResponse.t()}
  def update_my_guild_member(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :update_my_guild_member},
      url: "/guilds/#{guild_id}/members/@me",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {PrivateGuildMemberResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/users/@me`
  """
  @spec update_my_user(BotAccountPatchRequest.t(), keyword) ::
          {:ok, UserPIIResponse.t()} | {:error, ErrorResponse.t()}
  def update_my_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Operations, :update_my_user},
      url: "/users/@me",
      body: body,
      method: :patch,
      request: [{"application/json", {BotAccountPatchRequest, :t}}],
      response: [{200, {UserPIIResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  """
  @spec update_original_webhook_message(
          String.t(),
          String.t(),
          map | IncomingWebhookUpdateRequestPartial.t(),
          keyword
        ) :: {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def update_original_webhook_message(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Operations, :update_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      body: body,
      method: :patch,
      query: query,
      request: [
        {"application/json", {IncomingWebhookUpdateRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {IncomingWebhookUpdateRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/voice-states/@me`
  """
  @spec update_self_voice_state(String.t(), map, keyword) :: :ok | {:error, ErrorResponse.t()}
  def update_self_voice_state(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Operations, :update_self_voice_state},
      url: "/guilds/#{guild_id}/voice-states/@me",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/stage-instances/{channel_id}`
  """
  @spec update_stage_instance(String.t(), map, keyword) ::
          {:ok, StageInstanceResponse.t()} | {:error, ErrorResponse.t()}
  def update_stage_instance(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Operations, :update_stage_instance},
      url: "/stage-instances/#{channel_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {StageInstanceResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/voice-states/{user_id}`
  """
  @spec update_voice_state(String.t(), String.t(), map, keyword) ::
          :ok | {:error, ErrorResponse.t()}
  def update_voice_state(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Operations, :update_voice_state},
      url: "/guilds/#{guild_id}/voice-states/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}`
  """
  @spec update_webhook(String.t(), map, keyword) ::
          {:ok,
           ApplicationIncomingWebhookResponse.t()
           | ChannelFollowerWebhookResponse.t()
           | GuildIncomingWebhookResponse.t()}
          | {:error, ErrorResponse.t()}
  def update_webhook(webhook_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, body: body],
      call: {Operations, :update_webhook},
      url: "/webhooks/#{webhook_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200,
         {:union,
          [
            {ApplicationIncomingWebhookResponse, :t},
            {ChannelFollowerWebhookResponse, :t},
            {GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}`
  """
  @spec update_webhook_by_token(String.t(), String.t(), map, keyword) ::
          {:ok,
           ApplicationIncomingWebhookResponse.t()
           | ChannelFollowerWebhookResponse.t()
           | GuildIncomingWebhookResponse.t()}
          | {:error, ErrorResponse.t()}
  def update_webhook_by_token(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Operations, :update_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200,
         {:union,
          [
            {ApplicationIncomingWebhookResponse, :t},
            {ChannelFollowerWebhookResponse, :t},
            {GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  """
  @spec update_webhook_message(
          String.t(),
          String.t(),
          String.t(),
          map | IncomingWebhookUpdateRequestPartial.t(),
          keyword
        ) :: {:ok, MessageResponse.t()} | {:error, ErrorResponse.t()}
  def update_webhook_message(webhook_id, webhook_token, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [
        webhook_id: webhook_id,
        webhook_token: webhook_token,
        message_id: message_id,
        body: body
      ],
      call: {Operations, :update_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      body: body,
      method: :patch,
      query: query,
      request: [
        {"application/json", {IncomingWebhookUpdateRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {IncomingWebhookUpdateRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {MessageResponse, :t}}, {"4XX", {ErrorResponse, :t}}],
      opts: opts
    })
  end
end
