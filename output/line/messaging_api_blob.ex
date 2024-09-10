defmodule MessagingApiBlob do
  @moduledoc """
  Provides API endpoints related to messaging api blob
  """

  @default_client Client

  @doc """
  get `/v2/bot/message/{messageId}/content`

  Download image, video, and audio data sent from users.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-content)

  """
  @spec get_message_content(String.t(), keyword) :: {:ok, String.t()} | :error
  def get_message_content(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {MessagingApiBlob, :get_message_content},
      url: "/v2/bot/message/#{messageId}/content",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/{messageId}/content/preview`

  Get a preview image of the image or video

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-image-or-video-preview)

  """
  @spec get_message_content_preview(String.t(), keyword) :: {:ok, String.t()} | :error
  def get_message_content_preview(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {MessagingApiBlob, :get_message_content_preview},
      url: "/v2/bot/message/#{messageId}/content/preview",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/{messageId}/content/transcoding`

  Verify the preparation status of a video or audio for getting

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#verify-video-or-audio-preparation-status)

  """
  @spec get_message_content_transcoding_by_message_id(String.t(), keyword) ::
          {:ok, GetMessageContentTranscodingResponse.t()} | :error
  def get_message_content_transcoding_by_message_id(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {MessagingApiBlob, :get_message_content_transcoding_by_message_id},
      url: "/v2/bot/message/#{messageId}/content/transcoding",
      method: :get,
      response: [{200, {GetMessageContentTranscodingResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/{richMenuId}/content`

  Download rich menu image.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#download-rich-menu-image)

  """
  @spec get_rich_menu_image(String.t(), keyword) :: {:ok, String.t()} | :error
  def get_rich_menu_image(richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId],
      call: {MessagingApiBlob, :get_rich_menu_image},
      url: "/v2/bot/richmenu/#{richMenuId}/content",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/{richMenuId}/content`

  Upload rich menu image

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#upload-rich-menu-image)

  """
  @spec set_rich_menu_image(String.t(), String.t(), keyword) :: :ok | :error
  def set_rich_menu_image(richMenuId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId, body: body],
      call: {MessagingApiBlob, :set_rich_menu_image},
      url: "/v2/bot/richmenu/#{richMenuId}/content",
      body: body,
      method: :post,
      request: [{"*/*", {:string, :generic}}],
      response: [{200, :null}],
      opts: opts
    })
  end
end
