defmodule Discord.Operations do
  @moduledoc """
  Provides API endpoints related to operations
  """

  @default_client Discord.Client

  @doc """
  put `/channels/{channel_id}/recipients/{user_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec add_group_dm_user(
          channel_id :: String.t(),
          user_id :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Discord.PrivateChannelResponse.t() | Discord.PrivateGroupChannelResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def add_group_dm_user(channel_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id, body: body],
      call: {Discord.Operations, :add_group_dm_user},
      url: "/channels/#{channel_id}/recipients/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {201,
         {:union,
          [{Discord.PrivateChannelResponse, :t}, {Discord.PrivateGroupChannelResponse, :t}]}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/members/{user_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec add_guild_member(
          guild_id :: String.t(),
          user_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.GuildMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def add_guild_member(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Discord.Operations, :add_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {201, {Discord.GuildMemberResponse, :t}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/members/{user_id}/roles/{role_id}`
  """
  @spec add_guild_member_role(
          guild_id :: String.t(),
          user_id :: String.t(),
          role_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def add_guild_member_role(guild_id, user_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, role_id: role_id],
      call: {Discord.Operations, :add_guild_member_role},
      url: "/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me`
  """
  @spec add_my_message_reaction(
          channel_id :: String.t(),
          message_id :: String.t(),
          emoji_name :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def add_my_message_reaction(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Discord.Operations, :add_my_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/@me",
      method: :put,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/thread-members/{user_id}`
  """
  @spec add_thread_member(channel_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def add_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Discord.Operations, :add_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/bans/{user_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec ban_user_from_guild(
          guild_id :: String.t(),
          user_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def ban_user_from_guild(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Discord.Operations, :ban_user_from_guild},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/bulk-ban`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_ban_users_from_guild(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.BulkBanUsersResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def bulk_ban_users_from_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :bulk_ban_users_from_guild},
      url: "/guilds/#{guild_id}/bulk-ban",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.BulkBanUsersResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/bulk-delete`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_delete_messages(channel_id :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def bulk_delete_messages(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :bulk_delete_messages},
      url: "/channels/#{channel_id}/messages/bulk-delete",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/commands`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_set_application_commands(
          application_id :: String.t(),
          body :: [map] | nil,
          opts :: keyword
        ) ::
          {:ok, [Discord.ApplicationCommandResponse.t()] | nil}
          | {:error, Discord.ErrorResponse.t()}
  def bulk_set_application_commands(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :bulk_set_application_commands},
      url: "/applications/#{application_id}/commands",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [
        {200, {:union, [[{Discord.ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/guilds/{guild_id}/commands`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_set_guild_application_commands(
          application_id :: String.t(),
          guild_id :: String.t(),
          body :: [map] | nil,
          opts :: keyword
        ) ::
          {:ok, [Discord.ApplicationCommandResponse.t()] | nil}
          | {:error, Discord.ErrorResponse.t()}
  def bulk_set_guild_application_commands(application_id, guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, body: body],
      call: {Discord.Operations, :bulk_set_guild_application_commands},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [
        {200, {:union, [[{Discord.ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/channels`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_update_guild_channels(guild_id :: String.t(), body :: [map], opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def bulk_update_guild_channels(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :bulk_update_guild_channels},
      url: "/guilds/#{guild_id}/channels",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/roles`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec bulk_update_guild_roles(guild_id :: String.t(), body :: [map], opts :: keyword) ::
          {:ok, [Discord.GuildRoleResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def bulk_update_guild_roles(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :bulk_update_guild_roles},
      url: "/guilds/#{guild_id}/roles",
      body: body,
      method: :patch,
      request: [{"application/json", [:map]}],
      response: [{200, [{Discord.GuildRoleResponse, :t}]}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/entitlements/{entitlement_id}/consume`
  """
  @spec consume_entitlement(
          application_id :: String.t(),
          entitlement_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def consume_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Discord.Operations, :consume_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}/consume",
      method: :post,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/commands`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_application_command(
          application_id :: String.t(),
          body :: Discord.ApplicationCommandCreateRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_application_command(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :create_application_command},
      url: "/applications/#{application_id}/commands",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.ApplicationCommandCreateRequest, :t}}],
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {201, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/auto-moderation/rules`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_auto_moderation_rule(
          guild_id :: String.t(),
          body ::
            Discord.DefaultKeywordListUpsertRequest.t()
            | Discord.KeywordUpsertRequest.t()
            | Discord.MLSpamUpsertRequest.t()
            | Discord.MentionSpamUpsertRequest.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.DefaultKeywordRuleResponse.t()
           | Discord.KeywordRuleResponse.t()
           | Discord.MLSpamRuleResponse.t()
           | Discord.MentionSpamRuleResponse.t()
           | Discord.SpamLinkRuleResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def create_auto_moderation_rule(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.DefaultKeywordListUpsertRequest, :t},
            {Discord.KeywordUpsertRequest, :t},
            {Discord.MLSpamUpsertRequest, :t},
            {Discord.MentionSpamUpsertRequest, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.DefaultKeywordRuleResponse, :t},
            {Discord.KeywordRuleResponse, :t},
            {Discord.MLSpamRuleResponse, :t},
            {Discord.MentionSpamRuleResponse, :t},
            {Discord.SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/invites`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_channel_invite(
          channel_id :: String.t(),
          body :: Discord.CreateGroupDMInviteRequest.t() | Discord.CreateGuildInviteRequest.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.FriendInviteResponse.t()
           | Discord.GroupDMInviteResponse.t()
           | Discord.GuildInviteResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def create_channel_invite(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :create_channel_invite},
      url: "/channels/#{channel_id}/invites",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [{Discord.CreateGroupDMInviteRequest, :t}, {Discord.CreateGuildInviteRequest, :t}]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.FriendInviteResponse, :t},
            {Discord.GroupDMInviteResponse, :t},
            {Discord.GuildInviteResponse, :t}
          ]}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/users/@me/channels`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_dm(body :: Discord.CreatePrivateChannelRequest.t(), opts :: keyword) ::
          {:ok, Discord.PrivateChannelResponse.t() | Discord.PrivateGroupChannelResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def create_dm(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Discord.Operations, :create_dm},
      url: "/users/@me/channels",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.CreatePrivateChannelRequest, :t}}],
      response: [
        {200,
         {:union,
          [{Discord.PrivateChannelResponse, :t}, {Discord.PrivateGroupChannelResponse, :t}]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/entitlements`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_entitlement(
          application_id :: String.t(),
          body :: Discord.CreateEntitlementRequestData.t(),
          opts :: keyword
        ) :: {:ok, Discord.EntitlementResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_entitlement(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :create_entitlement},
      url: "/applications/#{application_id}/entitlements",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.CreateEntitlementRequestData, :t}}],
      response: [{200, {Discord.EntitlementResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild(body :: Discord.GuildCreateRequest.t(), opts :: keyword) ::
          {:ok, Discord.GuildResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Discord.Operations, :create_guild},
      url: "/guilds",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.GuildCreateRequest, :t}}],
      response: [{201, {Discord.GuildResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/applications/{application_id}/guilds/{guild_id}/commands`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_application_command(
          application_id :: String.t(),
          guild_id :: String.t(),
          body :: Discord.ApplicationCommandCreateRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_application_command(application_id, guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.ApplicationCommandCreateRequest, :t}}],
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {201, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/channels`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_channel(
          guild_id :: String.t(),
          body :: Discord.CreateGuildChannelRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.GuildChannelResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_channel(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_channel},
      url: "/guilds/#{guild_id}/channels",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.CreateGuildChannelRequest, :t}}],
      response: [{201, {Discord.GuildChannelResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/emojis`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_emoji(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.EmojiResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_emoji(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_emoji},
      url: "/guilds/#{guild_id}/emojis",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {Discord.EmojiResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/templates/{code}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_from_template(code :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_from_template(code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code, body: body],
      call: {Discord.Operations, :create_guild_from_template},
      url: "/guilds/templates/#{code}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {Discord.GuildResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/roles`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_role(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildRoleResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_role(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_role},
      url: "/guilds/#{guild_id}/roles",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildRoleResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/scheduled-events`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_scheduled_event(
          guild_id :: String.t(),
          body ::
            Discord.ExternalScheduledEventCreateRequest.t()
            | Discord.StageScheduledEventCreateRequest.t()
            | Discord.VoiceScheduledEventCreateRequest.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.ExternalScheduledEventResponse.t()
           | Discord.StageScheduledEventResponse.t()
           | Discord.VoiceScheduledEventResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def create_guild_scheduled_event(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.ExternalScheduledEventCreateRequest, :t},
            {Discord.StageScheduledEventCreateRequest, :t},
            {Discord.VoiceScheduledEventCreateRequest, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.ExternalScheduledEventResponse, :t},
            {Discord.StageScheduledEventResponse, :t},
            {Discord.VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/stickers`

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_guild_sticker(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildStickerResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_sticker(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_sticker},
      url: "/guilds/#{guild_id}/stickers",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [{201, {Discord.GuildStickerResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/templates`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_guild_template(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildTemplateResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_guild_template(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :create_guild_template},
      url: "/guilds/#{guild_id}/templates",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildTemplateResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/interactions/{interaction_id}/{interaction_token}/callback`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec create_interaction_response(
          interaction_id :: String.t(),
          interaction_token :: String.t(),
          body ::
            Discord.ApplicationCommandAutocompleteCallbackRequest.t()
            | Discord.CreateMessageInteractionCallbackRequest.t()
            | Discord.ModalInteractionCallbackRequest.t()
            | Discord.PongInteractionCallbackRequest.t()
            | Discord.UpdateMessageInteractionCallbackRequest.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def create_interaction_response(interaction_id, interaction_token, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [interaction_id: interaction_id, interaction_token: interaction_token, body: body],
      call: {Discord.Operations, :create_interaction_response},
      url: "/interactions/#{interaction_id}/#{interaction_token}/callback",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.ApplicationCommandAutocompleteCallbackRequest, :t},
            {Discord.CreateMessageInteractionCallbackRequest, :t},
            {Discord.ModalInteractionCallbackRequest, :t},
            {Discord.PongInteractionCallbackRequest, :t},
            {Discord.UpdateMessageInteractionCallbackRequest, :t}
          ]}},
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Discord.ApplicationCommandAutocompleteCallbackRequest, :t},
            {Discord.CreateMessageInteractionCallbackRequest, :t},
            {Discord.ModalInteractionCallbackRequest, :t},
            {Discord.PongInteractionCallbackRequest, :t},
            {Discord.UpdateMessageInteractionCallbackRequest, :t}
          ]}},
        {"multipart/form-data",
         {:union,
          [
            {Discord.ApplicationCommandAutocompleteCallbackRequest, :t},
            {Discord.CreateMessageInteractionCallbackRequest, :t},
            {Discord.ModalInteractionCallbackRequest, :t},
            {Discord.PongInteractionCallbackRequest, :t},
            {Discord.UpdateMessageInteractionCallbackRequest, :t}
          ]}}
      ],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec create_message(
          channel_id :: String.t(),
          body :: map | Discord.MessageCreateRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_message(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :create_message},
      url: "/channels/#{channel_id}/messages",
      body: body,
      method: :post,
      request: [
        {"application/json", {Discord.MessageCreateRequest, :t}},
        {"application/x-www-form-urlencoded", {Discord.MessageCreateRequest, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/stage-instances`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_stage_instance(body :: map, opts :: keyword) ::
          {:ok, Discord.StageInstanceResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_stage_instance(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Discord.Operations, :create_stage_instance},
      url: "/stage-instances",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.StageInstanceResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/threads`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec create_thread(
          channel_id :: String.t(),
          body ::
            Discord.CreateForumThreadRequest.t()
            | Discord.CreateTextThreadWithoutMessageRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.CreatedThreadResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_thread(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :create_thread},
      url: "/channels/#{channel_id}/threads",
      body: body,
      method: :post,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.CreateForumThreadRequest, :t},
            {Discord.CreateTextThreadWithoutMessageRequest, :t}
          ]}},
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Discord.CreateForumThreadRequest, :t},
            {Discord.CreateTextThreadWithoutMessageRequest, :t}
          ]}},
        {"multipart/form-data",
         {:union,
          [
            {Discord.CreateForumThreadRequest, :t},
            {Discord.CreateTextThreadWithoutMessageRequest, :t}
          ]}}
      ],
      response: [{201, {Discord.CreatedThreadResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/{message_id}/threads`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_thread_from_message(
          channel_id :: String.t(),
          message_id :: String.t(),
          body :: Discord.CreateTextThreadWithMessageRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.ThreadResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_thread_from_message(channel_id, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, body: body],
      call: {Discord.Operations, :create_thread_from_message},
      url: "/channels/#{channel_id}/messages/#{message_id}/threads",
      body: body,
      method: :post,
      request: [{"application/json", {Discord.CreateTextThreadWithMessageRequest, :t}}],
      response: [{201, {Discord.ThreadResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/webhooks`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_webhook(channel_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildIncomingWebhookResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def create_webhook(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :create_webhook},
      url: "/channels/#{channel_id}/webhooks",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.GuildIncomingWebhookResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/messages/{message_id}/crosspost`
  """
  @spec crosspost_message(channel_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def crosspost_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :crosspost_message},
      url: "/channels/#{channel_id}/messages/#{message_id}/crosspost",
      method: :post,
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions`
  """
  @spec delete_all_message_reactions(
          channel_id :: String.t(),
          message_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_all_message_reactions(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :delete_all_message_reactions},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}`
  """
  @spec delete_all_message_reactions_by_emoji(
          channel_id :: String.t(),
          message_id :: String.t(),
          emoji_name :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_all_message_reactions_by_emoji(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Discord.Operations, :delete_all_message_reactions_by_emoji},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/commands/{command_id}`
  """
  @spec delete_application_command(
          application_id :: String.t(),
          command_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_application_command(application_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id],
      call: {Discord.Operations, :delete_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`
  """
  @spec delete_auto_moderation_rule(
          guild_id :: String.t(),
          rule_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_auto_moderation_rule(guild_id, rule_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id],
      call: {Discord.Operations, :delete_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}`
  """
  @spec delete_channel(channel_id :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.GuildChannelResponse.t()
           | Discord.PrivateChannelResponse.t()
           | Discord.PrivateGroupChannelResponse.t()
           | Discord.ThreadResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def delete_channel(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :delete_channel},
      url: "/channels/#{channel_id}",
      method: :delete,
      response: [
        {200,
         {:union,
          [
            {Discord.GuildChannelResponse, :t},
            {Discord.PrivateChannelResponse, :t},
            {Discord.PrivateGroupChannelResponse, :t},
            {Discord.ThreadResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/permissions/{overwrite_id}`
  """
  @spec delete_channel_permission_overwrite(
          channel_id :: String.t(),
          overwrite_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_channel_permission_overwrite(channel_id, overwrite_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, overwrite_id: overwrite_id],
      call: {Discord.Operations, :delete_channel_permission_overwrite},
      url: "/channels/#{channel_id}/permissions/#{overwrite_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/entitlements/{entitlement_id}`
  """
  @spec delete_entitlement(
          application_id :: String.t(),
          entitlement_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Discord.Operations, :delete_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/recipients/{user_id}`
  """
  @spec delete_group_dm_user(channel_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_group_dm_user(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Discord.Operations, :delete_group_dm_user},
      url: "/channels/#{channel_id}/recipients/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}`
  """
  @spec delete_guild(guild_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :delete_guild},
      url: "/guilds/#{guild_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`
  """
  @spec delete_guild_application_command(
          application_id :: String.t(),
          guild_id :: String.t(),
          command_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_application_command(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Discord.Operations, :delete_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/emojis/{emoji_id}`
  """
  @spec delete_guild_emoji(guild_id :: String.t(), emoji_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_emoji(guild_id, emoji_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id],
      call: {Discord.Operations, :delete_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/integrations/{integration_id}`
  """
  @spec delete_guild_integration(
          guild_id :: String.t(),
          integration_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_integration(guild_id, integration_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, integration_id: integration_id],
      call: {Discord.Operations, :delete_guild_integration},
      url: "/guilds/#{guild_id}/integrations/#{integration_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/members/{user_id}`
  """
  @spec delete_guild_member(guild_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_member(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Discord.Operations, :delete_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/members/{user_id}/roles/{role_id}`
  """
  @spec delete_guild_member_role(
          guild_id :: String.t(),
          user_id :: String.t(),
          role_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_member_role(guild_id, user_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, role_id: role_id],
      call: {Discord.Operations, :delete_guild_member_role},
      url: "/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/roles/{role_id}`
  """
  @spec delete_guild_role(guild_id :: String.t(), role_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_role(guild_id, role_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, role_id: role_id],
      call: {Discord.Operations, :delete_guild_role},
      url: "/guilds/#{guild_id}/roles/#{role_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`
  """
  @spec delete_guild_scheduled_event(
          guild_id :: String.t(),
          guild_scheduled_event_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_scheduled_event(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Discord.Operations, :delete_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/stickers/{sticker_id}`
  """
  @spec delete_guild_sticker(guild_id :: String.t(), sticker_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_guild_sticker(guild_id, sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id],
      call: {Discord.Operations, :delete_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/templates/{code}`
  """
  @spec delete_guild_template(guild_id :: String.t(), code :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildTemplateResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def delete_guild_template(guild_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code],
      call: {Discord.Operations, :delete_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      method: :delete,
      response: [{200, {Discord.GuildTemplateResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}`
  """
  @spec delete_message(channel_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :delete_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/@me`
  """
  @spec delete_my_message_reaction(
          channel_id :: String.t(),
          message_id :: String.t(),
          emoji_name :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_my_message_reaction(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Discord.Operations, :delete_my_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/@me",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  """
  @spec delete_original_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_original_webhook_message(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Discord.Operations, :delete_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      method: :delete,
      query: query,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/stage-instances/{channel_id}`
  """
  @spec delete_stage_instance(channel_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_stage_instance(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :delete_stage_instance},
      url: "/stage-instances/#{channel_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/thread-members/{user_id}`
  """
  @spec delete_thread_member(channel_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Discord.Operations, :delete_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}/{user_id}`
  """
  @spec delete_user_message_reaction(
          channel_id :: String.t(),
          message_id :: String.t(),
          emoji_name :: String.t(),
          user_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_user_message_reaction(channel_id, message_id, emoji_name, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        channel_id: channel_id,
        message_id: message_id,
        emoji_name: emoji_name,
        user_id: user_id
      ],
      call: {Discord.Operations, :delete_user_message_reaction},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}`
  """
  @spec delete_webhook(webhook_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def delete_webhook(webhook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id],
      call: {Discord.Operations, :delete_webhook},
      url: "/webhooks/#{webhook_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}`
  """
  @spec delete_webhook_by_token(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_webhook_by_token(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Discord.Operations, :delete_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  """
  @spec delete_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          message_id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def delete_webhook_message(webhook_id, webhook_token, message_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, message_id: message_id],
      call: {Discord.Operations, :delete_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      method: :delete,
      query: query,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}/github`

  ## Options

    * `wait`
    * `thread_id`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec execute_github_compatible_webhook(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          body :: Discord.GithubWebhook.t(),
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def execute_github_compatible_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Discord.Operations, :execute_github_compatible_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/github",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Discord.GithubWebhook, :t}}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}/slack`

  ## Options

    * `wait`
    * `thread_id`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec execute_slack_compatible_webhook(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          body :: Discord.SlackWebhook.t(),
          opts :: keyword
        ) :: {:ok, String.t() | nil} | {:error, Discord.ErrorResponse.t()}
  def execute_slack_compatible_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Discord.Operations, :execute_slack_compatible_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/slack",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json", {Discord.SlackWebhook, :t}},
        {"application/x-www-form-urlencoded", {Discord.SlackWebhook, :t}},
        {"multipart/form-data", {Discord.SlackWebhook, :t}}
      ],
      response: [{200, {:union, [:string, :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/webhooks/{webhook_id}/{webhook_token}`

  ## Options

    * `wait`
    * `thread_id`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec execute_webhook(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          body ::
            Discord.IncomingWebhookRequestPartial.t()
            | Discord.IncomingWebhookUpdateRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def execute_webhook(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id, :wait])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Discord.Operations, :execute_webhook},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      body: body,
      method: :post,
      query: query,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.IncomingWebhookRequestPartial, :t},
            {Discord.IncomingWebhookUpdateRequestPartial, :t}
          ]}},
        {"application/x-www-form-urlencoded",
         {:union,
          [
            {Discord.IncomingWebhookRequestPartial, :t},
            {Discord.IncomingWebhookUpdateRequestPartial, :t}
          ]}},
        {"multipart/form-data",
         {:union,
          [
            {Discord.IncomingWebhookRequestPartial, :t},
            {Discord.IncomingWebhookUpdateRequestPartial, :t}
          ]}}
      ],
      response: [
        {200, {Discord.MessageResponse, :t}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/followers`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec follow_channel(channel_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.ChannelFollowerResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def follow_channel(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :follow_channel},
      url: "/channels/#{channel_id}/followers",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.ChannelFollowerResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/threads/active`
  """
  @spec get_active_guild_threads(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ThreadsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_active_guild_threads(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_active_guild_threads},
      url: "/guilds/#{guild_id}/threads/active",
      method: :get,
      response: [{200, {Discord.ThreadsResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}`
  """
  @spec get_application(application_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.PrivateApplicationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_application(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Discord.Operations, :get_application},
      url: "/applications/#{application_id}",
      method: :get,
      response: [
        {200, {Discord.PrivateApplicationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/commands/{command_id}`
  """
  @spec get_application_command(
          application_id :: String.t(),
          command_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_application_command(application_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id],
      call: {Discord.Operations, :get_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      method: :get,
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/role-connections/metadata`
  """
  @spec get_application_role_connections_metadata(application_id :: String.t(), opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def get_application_role_connections_metadata(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Discord.Operations, :get_application_role_connections_metadata},
      url: "/applications/#{application_id}/role-connections/metadata",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/applications/{application_id}/role-connection`
  """
  @spec get_application_user_role_connection(application_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ApplicationUserRoleConnectionResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_application_user_role_connection(application_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id],
      call: {Discord.Operations, :get_application_user_role_connection},
      url: "/users/@me/applications/#{application_id}/role-connection",
      method: :get,
      response: [
        {200, {Discord.ApplicationUserRoleConnectionResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`
  """
  @spec get_auto_moderation_rule(guild_id :: String.t(), rule_id :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.DefaultKeywordRuleResponse.t()
           | Discord.KeywordRuleResponse.t()
           | Discord.MLSpamRuleResponse.t()
           | Discord.MentionSpamRuleResponse.t()
           | Discord.SpamLinkRuleResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_auto_moderation_rule(guild_id, rule_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id],
      call: {Discord.Operations, :get_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Discord.DefaultKeywordRuleResponse, :t},
            {Discord.KeywordRuleResponse, :t},
            {Discord.MLSpamRuleResponse, :t},
            {Discord.MentionSpamRuleResponse, :t},
            {Discord.SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/gateway/bot`
  """
  @spec get_bot_gateway(opts :: keyword) ::
          {:ok, Discord.GatewayBotResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_bot_gateway(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_bot_gateway},
      url: "/gateway/bot",
      method: :get,
      response: [{200, {Discord.GatewayBotResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}`
  """
  @spec get_channel(channel_id :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.GuildChannelResponse.t()
           | Discord.PrivateChannelResponse.t()
           | Discord.PrivateGroupChannelResponse.t()
           | Discord.ThreadResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_channel(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :get_channel},
      url: "/channels/#{channel_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Discord.GuildChannelResponse, :t},
            {Discord.PrivateChannelResponse, :t},
            {Discord.PrivateGroupChannelResponse, :t},
            {Discord.ThreadResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/entitlements/{entitlement_id}`
  """
  @spec get_entitlement(
          application_id :: String.t(),
          entitlement_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.EntitlementResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_entitlement(application_id, entitlement_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, entitlement_id: entitlement_id],
      call: {Discord.Operations, :get_entitlement},
      url: "/applications/#{application_id}/entitlements/#{entitlement_id}",
      method: :get,
      response: [{200, {Discord.EntitlementResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
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
  @spec get_entitlements(application_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.EntitlementResponse.t() | nil]} | {:error, Discord.ErrorResponse.t()}
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
      call: {Discord.Operations, :get_entitlements},
      url: "/applications/#{application_id}/entitlements",
      method: :get,
      query: query,
      response: [
        {200, [union: [{Discord.EntitlementResponse, :t}, :null]]},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/gateway`
  """
  @spec get_gateway(opts :: keyword) ::
          {:ok, Discord.GatewayResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_gateway(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_gateway},
      url: "/gateway",
      method: :get,
      response: [{200, {Discord.GatewayResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}`

  ## Options

    * `with_counts`

  """
  @spec get_guild(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildWithCountsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_counts])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild},
      url: "/guilds/#{guild_id}",
      method: :get,
      query: query,
      response: [
        {200, {Discord.GuildWithCountsResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`
  """
  @spec get_guild_application_command(
          application_id :: String.t(),
          guild_id :: String.t(),
          command_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_application_command(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Discord.Operations, :get_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      method: :get,
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions`
  """
  @spec get_guild_application_command_permissions(
          application_id :: String.t(),
          guild_id :: String.t(),
          command_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.CommandPermissionsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_application_command_permissions(application_id, guild_id, command_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id, command_id: command_id],
      call: {Discord.Operations, :get_guild_application_command_permissions},
      url:
        "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}/permissions",
      method: :get,
      response: [
        {200, {Discord.CommandPermissionsResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/bans/{user_id}`
  """
  @spec get_guild_ban(guild_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildBanResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_ban(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Discord.Operations, :get_guild_ban},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      method: :get,
      response: [{200, {Discord.GuildBanResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/emojis/{emoji_id}`
  """
  @spec get_guild_emoji(guild_id :: String.t(), emoji_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.EmojiResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_emoji(guild_id, emoji_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id],
      call: {Discord.Operations, :get_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      method: :get,
      response: [{200, {Discord.EmojiResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/members/{user_id}`
  """
  @spec get_guild_member(guild_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_member(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Discord.Operations, :get_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      method: :get,
      response: [{200, {Discord.GuildMemberResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/new-member-welcome`
  """
  @spec get_guild_new_member_welcome(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildHomeSettingsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_new_member_welcome(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_new_member_welcome},
      url: "/guilds/#{guild_id}/new-member-welcome",
      method: :get,
      response: [
        {200, {Discord.GuildHomeSettingsResponse, :t}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/preview`
  """
  @spec get_guild_preview(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildPreviewResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_preview(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_preview},
      url: "/guilds/#{guild_id}/preview",
      method: :get,
      response: [{200, {Discord.GuildPreviewResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`

  ## Options

    * `with_user_count`

  """
  @spec get_guild_scheduled_event(
          guild_id :: String.t(),
          guild_scheduled_event_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.ExternalScheduledEventResponse.t()
           | Discord.StageScheduledEventResponse.t()
           | Discord.VoiceScheduledEventResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_guild_scheduled_event(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_user_count])

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Discord.Operations, :get_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {Discord.ExternalScheduledEventResponse, :t},
            {Discord.StageScheduledEventResponse, :t},
            {Discord.VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/stickers/{sticker_id}`
  """
  @spec get_guild_sticker(guild_id :: String.t(), sticker_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildStickerResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_sticker(guild_id, sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id],
      call: {Discord.Operations, :get_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      method: :get,
      response: [{200, {Discord.GuildStickerResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/templates/{code}`
  """
  @spec get_guild_template(code :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildTemplateResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_template(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Discord.Operations, :get_guild_template},
      url: "/guilds/templates/#{code}",
      method: :get,
      response: [{200, {Discord.GuildTemplateResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/vanity-url`
  """
  @spec get_guild_vanity_url(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.VanityURLResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_vanity_url(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_vanity_url},
      url: "/guilds/#{guild_id}/vanity-url",
      method: :get,
      response: [{200, {Discord.VanityURLResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/webhooks`
  """
  @spec get_guild_webhooks(guild_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.ApplicationIncomingWebhookResponse.t()
             | Discord.ChannelFollowerWebhookResponse.t()
             | Discord.GuildIncomingWebhookResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def get_guild_webhooks(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_webhooks},
      url: "/guilds/#{guild_id}/webhooks",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.ApplicationIncomingWebhookResponse, :t},
                {Discord.ChannelFollowerWebhookResponse, :t},
                {Discord.GuildIncomingWebhookResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/welcome-screen`
  """
  @spec get_guild_welcome_screen(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildWelcomeScreenResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_welcome_screen(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_welcome_screen},
      url: "/guilds/#{guild_id}/welcome-screen",
      method: :get,
      response: [
        {200, {Discord.GuildWelcomeScreenResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget.json`
  """
  @spec get_guild_widget(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.WidgetResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_widget(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_widget},
      url: "/guilds/#{guild_id}/widget.json",
      method: :get,
      response: [{200, {Discord.WidgetResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget.png`

  ## Options

    * `style`

  """
  @spec get_guild_widget_png(guild_id :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_widget_png(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:style])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_widget_png},
      url: "/guilds/#{guild_id}/widget.png",
      method: :get,
      query: query,
      response: [{200, :string}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/widget`
  """
  @spec get_guild_widget_settings(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.WidgetSettingsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guild_widget_settings(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guild_widget_settings},
      url: "/guilds/#{guild_id}/widget",
      method: :get,
      response: [
        {200, {Discord.WidgetSettingsResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/onboarding`
  """
  @spec get_guilds_onboarding(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.UserGuildOnboardingResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_guilds_onboarding(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_guilds_onboarding},
      url: "/guilds/#{guild_id}/onboarding",
      method: :get,
      response: [
        {200, {Discord.UserGuildOnboardingResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/messages/{message_id}`
  """
  @spec get_message(channel_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :get_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      method: :get,
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/@me`
  """
  @spec get_my_application(opts :: keyword) ::
          {:ok, Discord.PrivateApplicationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_my_application(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_my_application},
      url: "/applications/@me",
      method: :get,
      response: [
        {200, {Discord.PrivateApplicationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/guilds/{guild_id}/member`
  """
  @spec get_my_guild_member(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.PrivateGuildMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_my_guild_member(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :get_my_guild_member},
      url: "/users/@me/guilds/#{guild_id}/member",
      method: :get,
      response: [
        {200, {Discord.PrivateGuildMemberResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/applications/@me`
  """
  @spec get_my_oauth2_application(opts :: keyword) ::
          {:ok, Discord.PrivateApplicationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_my_oauth2_application(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_my_oauth2_application},
      url: "/oauth2/applications/@me",
      method: :get,
      response: [
        {200, {Discord.PrivateApplicationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/@me`
  """
  @spec get_my_oauth2_authorization(opts :: keyword) ::
          {:ok, Discord.OAuth2GetAuthorizationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_my_oauth2_authorization(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_my_oauth2_authorization},
      url: "/oauth2/@me",
      method: :get,
      response: [
        {200, {Discord.OAuth2GetAuthorizationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/users/@me`
  """
  @spec get_my_user(opts :: keyword) ::
          {:ok, Discord.UserPIIResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_my_user(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_my_user},
      url: "/users/@me",
      method: :get,
      response: [{200, {Discord.UserPIIResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  """
  @spec get_original_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_original_webhook_message(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Discord.Operations, :get_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      method: :get,
      query: query,
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/oauth2/keys`
  """
  @spec get_public_keys(opts :: keyword) ::
          {:ok, Discord.OAuth2GetKeys.t()} | {:error, Discord.ErrorResponse.t()}
  def get_public_keys(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :get_public_keys},
      url: "/oauth2/keys",
      method: :get,
      response: [{200, {Discord.OAuth2GetKeys, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/stage-instances/{channel_id}`
  """
  @spec get_stage_instance(channel_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.StageInstanceResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_stage_instance(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :get_stage_instance},
      url: "/stage-instances/#{channel_id}",
      method: :get,
      response: [{200, {Discord.StageInstanceResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/stickers/{sticker_id}`
  """
  @spec get_sticker(sticker_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildStickerResponse.t() | Discord.StandardStickerResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_sticker(sticker_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [sticker_id: sticker_id],
      call: {Discord.Operations, :get_sticker},
      url: "/stickers/#{sticker_id}",
      method: :get,
      response: [
        {200,
         {:union, [{Discord.GuildStickerResponse, :t}, {Discord.StandardStickerResponse, :t}]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/thread-members/{user_id}`

  ## Options

    * `with_member`

  """
  @spec get_thread_member(channel_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ThreadMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_thread_member(channel_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_member])

    client.request(%{
      args: [channel_id: channel_id, user_id: user_id],
      call: {Discord.Operations, :get_thread_member},
      url: "/channels/#{channel_id}/thread-members/#{user_id}",
      method: :get,
      query: query,
      response: [{200, {Discord.ThreadMemberResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/users/{user_id}`
  """
  @spec get_user(user_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.UserResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_user(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Discord.Operations, :get_user},
      url: "/users/#{user_id}",
      method: :get,
      response: [{200, {Discord.UserResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}`
  """
  @spec get_webhook(webhook_id :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.ApplicationIncomingWebhookResponse.t()
           | Discord.ChannelFollowerWebhookResponse.t()
           | Discord.GuildIncomingWebhookResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_webhook(webhook_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id],
      call: {Discord.Operations, :get_webhook},
      url: "/webhooks/#{webhook_id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Discord.ApplicationIncomingWebhookResponse, :t},
            {Discord.ChannelFollowerWebhookResponse, :t},
            {Discord.GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}`
  """
  @spec get_webhook_by_token(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.ApplicationIncomingWebhookResponse.t()
           | Discord.ChannelFollowerWebhookResponse.t()
           | Discord.GuildIncomingWebhookResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def get_webhook_by_token(webhook_id, webhook_token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token],
      call: {Discord.Operations, :get_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Discord.ApplicationIncomingWebhookResponse, :t},
            {Discord.ChannelFollowerWebhookResponse, :t},
            {Discord.GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  """
  @spec get_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          message_id :: String.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def get_webhook_message(webhook_id, webhook_token, message_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, message_id: message_id],
      call: {Discord.Operations, :get_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      method: :get,
      query: query,
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/invites/{code}`

  ## Options

    * `with_counts`
    * `guild_scheduled_event_id`

  """
  @spec invite_resolve(code :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.FriendInviteResponse.t()
           | Discord.GroupDMInviteResponse.t()
           | Discord.GuildInviteResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def invite_resolve(code, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:guild_scheduled_event_id, :with_counts])

    client.request(%{
      args: [code: code],
      call: {Discord.Operations, :invite_resolve},
      url: "/invites/#{code}",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            {Discord.FriendInviteResponse, :t},
            {Discord.GroupDMInviteResponse, :t},
            {Discord.GuildInviteResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/invites/{code}`
  """
  @spec invite_revoke(code :: String.t(), opts :: keyword) ::
          {:ok,
           Discord.FriendInviteResponse.t()
           | Discord.GroupDMInviteResponse.t()
           | Discord.GuildInviteResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def invite_revoke(code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [code: code],
      call: {Discord.Operations, :invite_revoke},
      url: "/invites/#{code}",
      method: :delete,
      response: [
        {200,
         {:union,
          [
            {Discord.FriendInviteResponse, :t},
            {Discord.GroupDMInviteResponse, :t},
            {Discord.GuildInviteResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/thread-members/@me`
  """
  @spec join_thread(channel_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def join_thread(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :join_thread},
      url: "/channels/#{channel_id}/thread-members/@me",
      method: :put,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/users/@me/guilds/{guild_id}`
  """
  @spec leave_guild(guild_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def leave_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :leave_guild},
      url: "/users/@me/guilds/#{guild_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/thread-members/@me`
  """
  @spec leave_thread(channel_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def leave_thread(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :leave_thread},
      url: "/channels/#{channel_id}/thread-members/@me",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/commands`

  ## Options

    * `with_localizations`

  """
  @spec list_application_commands(application_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.ApplicationCommandResponse.t()] | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_application_commands(application_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_localizations])

    client.request(%{
      args: [application_id: application_id],
      call: {Discord.Operations, :list_application_commands},
      url: "/applications/#{application_id}/commands",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{Discord.ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/auto-moderation/rules`
  """
  @spec list_auto_moderation_rules(guild_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.DefaultKeywordRuleResponse.t()
             | Discord.KeywordRuleResponse.t()
             | Discord.MLSpamRuleResponse.t()
             | Discord.MentionSpamRuleResponse.t()
             | Discord.SpamLinkRuleResponse.t()
             | nil
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_auto_moderation_rules(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_auto_moderation_rules},
      url: "/guilds/#{guild_id}/auto-moderation/rules",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.DefaultKeywordRuleResponse, :t},
                {Discord.KeywordRuleResponse, :t},
                {Discord.MLSpamRuleResponse, :t},
                {Discord.MentionSpamRuleResponse, :t},
                {Discord.SpamLinkRuleResponse, :t},
                :null
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/invites`
  """
  @spec list_channel_invites(channel_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.FriendInviteResponse.t()
             | Discord.GroupDMInviteResponse.t()
             | Discord.GuildInviteResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_channel_invites(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_channel_invites},
      url: "/channels/#{channel_id}/invites",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.FriendInviteResponse, :t},
                {Discord.GroupDMInviteResponse, :t},
                {Discord.GuildInviteResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/webhooks`
  """
  @spec list_channel_webhooks(channel_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.ApplicationIncomingWebhookResponse.t()
             | Discord.ChannelFollowerWebhookResponse.t()
             | Discord.GuildIncomingWebhookResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_channel_webhooks(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_channel_webhooks},
      url: "/channels/#{channel_id}/webhooks",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.ApplicationIncomingWebhookResponse, :t},
                {Discord.ChannelFollowerWebhookResponse, :t},
                {Discord.GuildIncomingWebhookResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands/permissions`
  """
  @spec list_guild_application_command_permissions(
          application_id :: String.t(),
          guild_id :: String.t(),
          opts :: keyword
        ) :: {:ok, [Discord.CommandPermissionsResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_guild_application_command_permissions(application_id, guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id],
      call: {Discord.Operations, :list_guild_application_command_permissions},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/permissions",
      method: :get,
      response: [
        {200, [{Discord.CommandPermissionsResponse, :t}]},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/applications/{application_id}/guilds/{guild_id}/commands`

  ## Options

    * `with_localizations`

  """
  @spec list_guild_application_commands(
          application_id :: String.t(),
          guild_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok, [Discord.ApplicationCommandResponse.t()] | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_guild_application_commands(application_id, guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_localizations])

    client.request(%{
      args: [application_id: application_id, guild_id: guild_id],
      call: {Discord.Operations, :list_guild_application_commands},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{Discord.ApplicationCommandResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
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
  @spec list_guild_audit_log_entries(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildAuditLogResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def list_guild_audit_log_entries(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:action_type, :after, :before, :limit, :target_id, :user_id])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_audit_log_entries},
      url: "/guilds/#{guild_id}/audit-logs",
      method: :get,
      query: query,
      response: [{200, {Discord.GuildAuditLogResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
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
  @spec list_guild_bans(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildBanResponse.t()] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_guild_bans(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_bans},
      url: "/guilds/#{guild_id}/bans",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{Discord.GuildBanResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/channels`
  """
  @spec list_guild_channels(guild_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.GuildChannelResponse.t()
             | Discord.PrivateChannelResponse.t()
             | Discord.PrivateGroupChannelResponse.t()
             | Discord.ThreadResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_guild_channels(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_channels},
      url: "/guilds/#{guild_id}/channels",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.GuildChannelResponse, :t},
                {Discord.PrivateChannelResponse, :t},
                {Discord.PrivateGroupChannelResponse, :t},
                {Discord.ThreadResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/emojis`
  """
  @spec list_guild_emojis(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.EmojiResponse.t()] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_guild_emojis(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_emojis},
      url: "/guilds/#{guild_id}/emojis",
      method: :get,
      response: [
        {200, {:union, [[{Discord.EmojiResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/integrations`
  """
  @spec list_guild_integrations(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_guild_integrations(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_integrations},
      url: "/guilds/#{guild_id}/integrations",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/invites`
  """
  @spec list_guild_invites(guild_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.FriendInviteResponse.t()
             | Discord.GroupDMInviteResponse.t()
             | Discord.GuildInviteResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_guild_invites(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_invites},
      url: "/guilds/#{guild_id}/invites",
      method: :get,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.FriendInviteResponse, :t},
                {Discord.GroupDMInviteResponse, :t},
                {Discord.GuildInviteResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
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
  @spec list_guild_members(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildMemberResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_guild_members(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_members},
      url: "/guilds/#{guild_id}/members",
      method: :get,
      query: query,
      response: [{200, [{Discord.GuildMemberResponse, :t}]}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/roles`
  """
  @spec list_guild_roles(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildRoleResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_guild_roles(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_roles},
      url: "/guilds/#{guild_id}/roles",
      method: :get,
      response: [{200, [{Discord.GuildRoleResponse, :t}]}, {"4XX", {Discord.ErrorResponse, :t}}],
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
  @spec list_guild_scheduled_event_users(
          guild_id :: String.t(),
          guild_scheduled_event_id :: String.t(),
          opts :: keyword
        ) ::
          {:ok, [Discord.ScheduledEventUserResponse.t()] | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_guild_scheduled_event_users(guild_id, guild_scheduled_event_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :with_member])

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id],
      call: {Discord.Operations, :list_guild_scheduled_event_users},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}/users",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{Discord.ScheduledEventUserResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/scheduled-events`

  ## Options

    * `with_user_count`

  """
  @spec list_guild_scheduled_events(guild_id :: String.t(), opts :: keyword) ::
          {:ok,
           [
             Discord.ExternalScheduledEventResponse.t()
             | Discord.StageScheduledEventResponse.t()
             | Discord.VoiceScheduledEventResponse.t()
           ]
           | nil}
          | {:error, Discord.ErrorResponse.t()}
  def list_guild_scheduled_events(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:with_user_count])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_scheduled_events},
      url: "/guilds/#{guild_id}/scheduled-events",
      method: :get,
      query: query,
      response: [
        {200,
         {:union,
          [
            [
              union: [
                {Discord.ExternalScheduledEventResponse, :t},
                {Discord.StageScheduledEventResponse, :t},
                {Discord.VoiceScheduledEventResponse, :t}
              ]
            ],
            :null
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/stickers`
  """
  @spec list_guild_stickers(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildStickerResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_guild_stickers(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_stickers},
      url: "/guilds/#{guild_id}/stickers",
      method: :get,
      response: [
        {200, [{Discord.GuildStickerResponse, :t}]},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/templates`
  """
  @spec list_guild_templates(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildTemplateResponse.t()] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_guild_templates(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_templates},
      url: "/guilds/#{guild_id}/templates",
      method: :get,
      response: [
        {200, {:union, [[{Discord.GuildTemplateResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/regions`
  """
  @spec list_guild_voice_regions(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_guild_voice_regions(guild_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :list_guild_voice_regions},
      url: "/guilds/#{guild_id}/regions",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/messages/{message_id}/reactions/{emoji_name}`

  ## Options

    * `after`
    * `limit`

  """
  @spec list_message_reactions_by_emoji(
          channel_id :: String.t(),
          message_id :: String.t(),
          emoji_name :: String.t(),
          opts :: keyword
        ) :: {:ok, [Discord.UserResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_message_reactions_by_emoji(channel_id, message_id, emoji_name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, emoji_name: emoji_name],
      call: {Discord.Operations, :list_message_reactions_by_emoji},
      url: "/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji_name}",
      method: :get,
      query: query,
      response: [{200, [{Discord.UserResponse, :t}]}, {"4XX", {Discord.ErrorResponse, :t}}],
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
  @spec list_messages(channel_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.MessageResponse.t()] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_messages(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :around, :before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_messages},
      url: "/channels/#{channel_id}/messages",
      method: :get,
      query: query,
      response: [
        {200, {:union, [[{Discord.MessageResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/users/@me/connections`
  """
  @spec list_my_connections(opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_my_connections(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :list_my_connections},
      url: "/users/@me/connections",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
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
  @spec list_my_guilds(opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_my_guilds(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :with_counts])

    client.request(%{
      args: [],
      call: {Discord.Operations, :list_my_guilds},
      url: "/users/@me/guilds",
      method: :get,
      query: query,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/users/@me/threads/archived/private`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_my_private_archived_threads(channel_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ThreadsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def list_my_private_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_my_private_archived_threads},
      url: "/channels/#{channel_id}/users/@me/threads/archived/private",
      method: :get,
      query: query,
      response: [{200, {Discord.ThreadsResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/pins`
  """
  @spec list_pinned_messages(channel_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.MessageResponse.t()] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_pinned_messages(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_pinned_messages},
      url: "/channels/#{channel_id}/pins",
      method: :get,
      response: [
        {200, {:union, [[{Discord.MessageResponse, :t}], :null]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/threads/archived/private`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_private_archived_threads(channel_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ThreadsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def list_private_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_private_archived_threads},
      url: "/channels/#{channel_id}/threads/archived/private",
      method: :get,
      query: query,
      response: [{200, {Discord.ThreadsResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/channels/{channel_id}/threads/archived/public`

  ## Options

    * `before`
    * `limit`

  """
  @spec list_public_archived_threads(channel_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.ThreadsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def list_public_archived_threads(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:before, :limit])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_public_archived_threads},
      url: "/channels/#{channel_id}/threads/archived/public",
      method: :get,
      query: query,
      response: [{200, {Discord.ThreadsResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/sticker-packs`
  """
  @spec list_sticker_packs(opts :: keyword) ::
          {:ok, Discord.StickerPackCollectionResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def list_sticker_packs(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :list_sticker_packs},
      url: "/sticker-packs",
      method: :get,
      response: [
        {200, {Discord.StickerPackCollectionResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
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
  @spec list_thread_members(channel_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.ThreadMemberResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def list_thread_members(channel_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :with_member])

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :list_thread_members},
      url: "/channels/#{channel_id}/thread-members",
      method: :get,
      query: query,
      response: [
        {200, [{Discord.ThreadMemberResponse, :t}]},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/voice/regions`
  """
  @spec list_voice_regions(opts :: keyword) ::
          {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def list_voice_regions(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Discord.Operations, :list_voice_regions},
      url: "/voice/regions",
      method: :get,
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/pins/{message_id}`
  """
  @spec pin_message(channel_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def pin_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :pin_message},
      url: "/channels/#{channel_id}/pins/#{message_id}",
      method: :put,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/prune`

  ## Options

    * `days`
    * `include_roles`

  """
  @spec preview_prune_guild(guild_id :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildPruneResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def preview_prune_guild(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:days, :include_roles])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :preview_prune_guild},
      url: "/guilds/#{guild_id}/prune",
      method: :get,
      query: query,
      response: [{200, {Discord.GuildPruneResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/prune`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec prune_guild(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildPruneResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def prune_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :prune_guild},
      url: "/guilds/#{guild_id}/prune",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildPruneResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/onboarding`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec put_guilds_onboarding(
          guild_id :: String.t(),
          body :: Discord.UpdateGuildOnboardingRequest.t(),
          opts :: keyword
        ) :: {:ok, Discord.GuildOnboardingResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def put_guilds_onboarding(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :put_guilds_onboarding},
      url: "/guilds/#{guild_id}/onboarding",
      body: body,
      method: :put,
      request: [{"application/json", {Discord.UpdateGuildOnboardingRequest, :t}}],
      response: [
        {200, {Discord.GuildOnboardingResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  get `/guilds/{guild_id}/members/search`

  ## Options

    * `limit`
    * `query`

  """
  @spec search_guild_members(guild_id :: String.t(), opts :: keyword) ::
          {:ok, [Discord.GuildMemberResponse.t()]} | {:error, Discord.ErrorResponse.t()}
  def search_guild_members(guild_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :query])

    client.request(%{
      args: [guild_id: guild_id],
      call: {Discord.Operations, :search_guild_members},
      url: "/guilds/#{guild_id}/members/search",
      method: :get,
      query: query,
      response: [{200, [{Discord.GuildMemberResponse, :t}]}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/channels/{channel_id}/permissions/{overwrite_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec set_channel_permission_overwrite(
          channel_id :: String.t(),
          overwrite_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def set_channel_permission_overwrite(channel_id, overwrite_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, overwrite_id: overwrite_id, body: body],
      call: {Discord.Operations, :set_channel_permission_overwrite},
      url: "/channels/#{channel_id}/permissions/#{overwrite_id}",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}/permissions`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec set_guild_application_command_permissions(
          application_id :: String.t(),
          guild_id :: String.t(),
          command_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.CommandPermissionsResponse.t()} | {:error, Discord.ErrorResponse.t()}
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
      call: {Discord.Operations, :set_guild_application_command_permissions},
      url:
        "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}/permissions",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.CommandPermissionsResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  post `/guilds/{guild_id}/mfa`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec set_guild_mfa_level(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.GuildMFALevelResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def set_guild_mfa_level(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :set_guild_mfa_level},
      url: "/guilds/#{guild_id}/mfa",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildMFALevelResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/guilds/{guild_id}/templates/{code}`
  """
  @spec sync_guild_template(guild_id :: String.t(), code :: String.t(), opts :: keyword) ::
          {:ok, Discord.GuildTemplateResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def sync_guild_template(guild_id, code, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code],
      call: {Discord.Operations, :sync_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      method: :put,
      response: [{200, {Discord.GuildTemplateResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  post `/channels/{channel_id}/typing`
  """
  @spec trigger_typing_indicator(channel_id :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Discord.ErrorResponse.t()}
  def trigger_typing_indicator(channel_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id],
      call: {Discord.Operations, :trigger_typing_indicator},
      url: "/channels/#{channel_id}/typing",
      method: :post,
      response: [{200, :map}, {204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/guilds/{guild_id}/bans/{user_id}`
  """
  @spec unban_user_from_guild(guild_id :: String.t(), user_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def unban_user_from_guild(guild_id, user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id],
      call: {Discord.Operations, :unban_user_from_guild},
      url: "/guilds/#{guild_id}/bans/#{user_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  delete `/channels/{channel_id}/pins/{message_id}`
  """
  @spec unpin_message(channel_id :: String.t(), message_id :: String.t(), opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def unpin_message(channel_id, message_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id],
      call: {Discord.Operations, :unpin_message},
      url: "/channels/#{channel_id}/pins/#{message_id}",
      method: :delete,
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_application(
          application_id :: String.t(),
          body :: Discord.ApplicationFormPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.PrivateApplicationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_application(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :update_application},
      url: "/applications/#{application_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.ApplicationFormPartial, :t}}],
      response: [
        {200, {Discord.PrivateApplicationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}/commands/{command_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_application_command(
          application_id :: String.t(),
          command_id :: String.t(),
          body :: Discord.ApplicationCommandPatchRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_application_command(application_id, command_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, command_id: command_id, body: body],
      call: {Discord.Operations, :update_application_command},
      url: "/applications/#{application_id}/commands/#{command_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.ApplicationCommandPatchRequestPartial, :t}}],
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  put `/applications/{application_id}/role-connections/metadata`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_application_role_connections_metadata(
          application_id :: String.t(),
          body :: [map] | nil,
          opts :: keyword
        ) :: {:ok, [map] | nil} | {:error, Discord.ErrorResponse.t()}
  def update_application_role_connections_metadata(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :update_application_role_connections_metadata},
      url: "/applications/#{application_id}/role-connections/metadata",
      body: body,
      method: :put,
      request: [{"application/json", {:union, [[:map], :null]}}],
      response: [{200, {:union, [[:map], :null]}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  put `/users/@me/applications/{application_id}/role-connection`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_application_user_role_connection(
          application_id :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok, Discord.ApplicationUserRoleConnectionResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_application_user_role_connection(application_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [application_id: application_id, body: body],
      call: {Discord.Operations, :update_application_user_role_connection},
      url: "/users/@me/applications/#{application_id}/role-connection",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.ApplicationUserRoleConnectionResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/auto-moderation/rules/{rule_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_auto_moderation_rule(
          guild_id :: String.t(),
          rule_id :: String.t(),
          body ::
            Discord.DefaultKeywordListUpsertRequestPartial.t()
            | Discord.KeywordUpsertRequestPartial.t()
            | Discord.MLSpamUpsertRequestPartial.t()
            | Discord.MentionSpamUpsertRequestPartial.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.DefaultKeywordRuleResponse.t()
           | Discord.KeywordRuleResponse.t()
           | Discord.MLSpamRuleResponse.t()
           | Discord.MentionSpamRuleResponse.t()
           | Discord.SpamLinkRuleResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_auto_moderation_rule(guild_id, rule_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, rule_id: rule_id, body: body],
      call: {Discord.Operations, :update_auto_moderation_rule},
      url: "/guilds/#{guild_id}/auto-moderation/rules/#{rule_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.DefaultKeywordListUpsertRequestPartial, :t},
            {Discord.KeywordUpsertRequestPartial, :t},
            {Discord.MLSpamUpsertRequestPartial, :t},
            {Discord.MentionSpamUpsertRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.DefaultKeywordRuleResponse, :t},
            {Discord.KeywordRuleResponse, :t},
            {Discord.MLSpamRuleResponse, :t},
            {Discord.MentionSpamRuleResponse, :t},
            {Discord.SpamLinkRuleResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/channels/{channel_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_channel(
          channel_id :: String.t(),
          body ::
            Discord.PrivateChannelRequestPartial.t()
            | Discord.UpdateGuildChannelRequestPartial.t()
            | Discord.UpdateThreadRequestPartial.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.GuildChannelResponse.t()
           | Discord.PrivateChannelResponse.t()
           | Discord.PrivateGroupChannelResponse.t()
           | Discord.ThreadResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_channel(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :update_channel},
      url: "/channels/#{channel_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.PrivateChannelRequestPartial, :t},
            {Discord.UpdateGuildChannelRequestPartial, :t},
            {Discord.UpdateThreadRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.GuildChannelResponse, :t},
            {Discord.PrivateChannelResponse, :t},
            {Discord.PrivateGroupChannelResponse, :t},
            {Discord.ThreadResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild(
          guild_id :: String.t(),
          body :: Discord.GuildPatchRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.GuildResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :update_guild},
      url: "/guilds/#{guild_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.GuildPatchRequestPartial, :t}}],
      response: [{200, {Discord.GuildResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/{application_id}/guilds/{guild_id}/commands/{command_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_application_command(
          application_id :: String.t(),
          guild_id :: String.t(),
          command_id :: String.t(),
          body :: Discord.ApplicationCommandPatchRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.ApplicationCommandResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_application_command(application_id, guild_id, command_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        application_id: application_id,
        guild_id: guild_id,
        command_id: command_id,
        body: body
      ],
      call: {Discord.Operations, :update_guild_application_command},
      url: "/applications/#{application_id}/guilds/#{guild_id}/commands/#{command_id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.ApplicationCommandPatchRequestPartial, :t}}],
      response: [
        {200, {Discord.ApplicationCommandResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/emojis/{emoji_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_emoji(
          guild_id :: String.t(),
          emoji_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.EmojiResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_emoji(guild_id, emoji_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, emoji_id: emoji_id, body: body],
      call: {Discord.Operations, :update_guild_emoji},
      url: "/guilds/#{guild_id}/emojis/#{emoji_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Discord.EmojiResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/members/{user_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_member(
          guild_id :: String.t(),
          user_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.GuildMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_member(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Discord.Operations, :update_guild_member},
      url: "/guilds/#{guild_id}/members/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.GuildMemberResponse, :t}},
        {204, :null},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/roles/{role_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_role(
          guild_id :: String.t(),
          role_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.GuildRoleResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_role(guild_id, role_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, role_id: role_id, body: body],
      call: {Discord.Operations, :update_guild_role},
      url: "/guilds/#{guild_id}/roles/#{role_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildRoleResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/scheduled-events/{guild_scheduled_event_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_scheduled_event(
          guild_id :: String.t(),
          guild_scheduled_event_id :: String.t(),
          body ::
            Discord.ExternalScheduledEventPatchRequestPartial.t()
            | Discord.StageScheduledEventPatchRequestPartial.t()
            | Discord.VoiceScheduledEventPatchRequestPartial.t(),
          opts :: keyword
        ) ::
          {:ok,
           Discord.ExternalScheduledEventResponse.t()
           | Discord.StageScheduledEventResponse.t()
           | Discord.VoiceScheduledEventResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_guild_scheduled_event(guild_id, guild_scheduled_event_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, guild_scheduled_event_id: guild_scheduled_event_id, body: body],
      call: {Discord.Operations, :update_guild_scheduled_event},
      url: "/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json",
         {:union,
          [
            {Discord.ExternalScheduledEventPatchRequestPartial, :t},
            {Discord.StageScheduledEventPatchRequestPartial, :t},
            {Discord.VoiceScheduledEventPatchRequestPartial, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {Discord.ExternalScheduledEventResponse, :t},
            {Discord.StageScheduledEventResponse, :t},
            {Discord.VoiceScheduledEventResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/stickers/{sticker_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_sticker(
          guild_id :: String.t(),
          sticker_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.GuildStickerResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_sticker(guild_id, sticker_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, sticker_id: sticker_id, body: body],
      call: {Discord.Operations, :update_guild_sticker},
      url: "/guilds/#{guild_id}/stickers/#{sticker_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildStickerResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/templates/{code}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_template(
          guild_id :: String.t(),
          code :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Discord.GuildTemplateResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_template(guild_id, code, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, code: code, body: body],
      call: {Discord.Operations, :update_guild_template},
      url: "/guilds/#{guild_id}/templates/#{code}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Discord.GuildTemplateResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/welcome-screen`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_welcome_screen(
          guild_id :: String.t(),
          body :: Discord.WelcomeScreenPatchRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.GuildWelcomeScreenResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_welcome_screen(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :update_guild_welcome_screen},
      url: "/guilds/#{guild_id}/welcome-screen",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.WelcomeScreenPatchRequestPartial, :t}}],
      response: [
        {200, {Discord.GuildWelcomeScreenResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/widget`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_guild_widget_settings(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.WidgetSettingsResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_guild_widget_settings(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :update_guild_widget_settings},
      url: "/guilds/#{guild_id}/widget",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.WidgetSettingsResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/channels/{channel_id}/messages/{message_id}`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec update_message(
          channel_id :: String.t(),
          message_id :: String.t(),
          body :: map | Discord.MessageEditRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_message(channel_id, message_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, message_id: message_id, body: body],
      call: {Discord.Operations, :update_message},
      url: "/channels/#{channel_id}/messages/#{message_id}",
      body: body,
      method: :patch,
      request: [
        {"application/json", {Discord.MessageEditRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {Discord.MessageEditRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/applications/@me`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_my_application(body :: Discord.ApplicationFormPartial.t(), opts :: keyword) ::
          {:ok, Discord.PrivateApplicationResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_my_application(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Discord.Operations, :update_my_application},
      url: "/applications/@me",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.ApplicationFormPartial, :t}}],
      response: [
        {200, {Discord.PrivateApplicationResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/members/@me`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_my_guild_member(guild_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.PrivateGuildMemberResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_my_guild_member(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :update_my_guild_member},
      url: "/guilds/#{guild_id}/members/@me",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Discord.PrivateGuildMemberResponse, :t}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/users/@me`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_my_user(body :: Discord.BotAccountPatchRequest.t(), opts :: keyword) ::
          {:ok, Discord.UserPIIResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_my_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Discord.Operations, :update_my_user},
      url: "/users/@me",
      body: body,
      method: :patch,
      request: [{"application/json", {Discord.BotAccountPatchRequest, :t}}],
      response: [{200, {Discord.UserPIIResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}/messages/@original`

  ## Options

    * `thread_id`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec update_original_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          body :: map | Discord.IncomingWebhookUpdateRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_original_webhook_message(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:thread_id])

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Discord.Operations, :update_original_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/@original",
      body: body,
      method: :patch,
      query: query,
      request: [
        {"application/json", {Discord.IncomingWebhookUpdateRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {Discord.IncomingWebhookUpdateRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/voice-states/@me`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_self_voice_state(guild_id :: String.t(), body :: map, opts :: keyword) ::
          :ok | {:error, Discord.ErrorResponse.t()}
  def update_self_voice_state(guild_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, body: body],
      call: {Discord.Operations, :update_self_voice_state},
      url: "/guilds/#{guild_id}/voice-states/@me",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/stage-instances/{channel_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_stage_instance(channel_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Discord.StageInstanceResponse.t()} | {:error, Discord.ErrorResponse.t()}
  def update_stage_instance(channel_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [channel_id: channel_id, body: body],
      call: {Discord.Operations, :update_stage_instance},
      url: "/stage-instances/#{channel_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {Discord.StageInstanceResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/guilds/{guild_id}/voice-states/{user_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_voice_state(
          guild_id :: String.t(),
          user_id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: :ok | {:error, Discord.ErrorResponse.t()}
  def update_voice_state(guild_id, user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [guild_id: guild_id, user_id: user_id, body: body],
      call: {Discord.Operations, :update_voice_state},
      url: "/guilds/#{guild_id}/voice-states/#{user_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{204, :null}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_webhook(webhook_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok,
           Discord.ApplicationIncomingWebhookResponse.t()
           | Discord.ChannelFollowerWebhookResponse.t()
           | Discord.GuildIncomingWebhookResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_webhook(webhook_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, body: body],
      call: {Discord.Operations, :update_webhook},
      url: "/webhooks/#{webhook_id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200,
         {:union,
          [
            {Discord.ApplicationIncomingWebhookResponse, :t},
            {Discord.ChannelFollowerWebhookResponse, :t},
            {Discord.GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_webhook_by_token(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          body :: map,
          opts :: keyword
        ) ::
          {:ok,
           Discord.ApplicationIncomingWebhookResponse.t()
           | Discord.ChannelFollowerWebhookResponse.t()
           | Discord.GuildIncomingWebhookResponse.t()}
          | {:error, Discord.ErrorResponse.t()}
  def update_webhook_by_token(webhook_id, webhook_token, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [webhook_id: webhook_id, webhook_token: webhook_token, body: body],
      call: {Discord.Operations, :update_webhook_by_token},
      url: "/webhooks/#{webhook_id}/#{webhook_token}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200,
         {:union,
          [
            {Discord.ApplicationIncomingWebhookResponse, :t},
            {Discord.ChannelFollowerWebhookResponse, :t},
            {Discord.GuildIncomingWebhookResponse, :t}
          ]}},
        {"4XX", {Discord.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  patch `/webhooks/{webhook_id}/{webhook_token}/messages/{message_id}`

  ## Options

    * `thread_id`

  ## Request Body

  **Content Types**: `application/json`, `application/x-www-form-urlencoded`, `multipart/form-data`
  """
  @spec update_webhook_message(
          webhook_id :: String.t(),
          webhook_token :: String.t(),
          message_id :: String.t(),
          body :: map | Discord.IncomingWebhookUpdateRequestPartial.t(),
          opts :: keyword
        ) :: {:ok, Discord.MessageResponse.t()} | {:error, Discord.ErrorResponse.t()}
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
      call: {Discord.Operations, :update_webhook_message},
      url: "/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}",
      body: body,
      method: :patch,
      query: query,
      request: [
        {"application/json", {Discord.IncomingWebhookUpdateRequestPartial, :t}},
        {"application/x-www-form-urlencoded", {Discord.IncomingWebhookUpdateRequestPartial, :t}},
        {"multipart/form-data", :map}
      ],
      response: [{200, {Discord.MessageResponse, :t}}, {"4XX", {Discord.ErrorResponse, :t}}],
      opts: opts
    })
  end
end
