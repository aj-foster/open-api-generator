defmodule Line.MessagingApiBlob do
  @moduledoc """
  Provides API endpoints related to messaging api blob
  """

  @default_client Line.Client

  @doc """
  get `/v2/bot/message/{messageId}/content`

  Download image, video, and audio data sent from users.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-content)

  """
  @spec get_message_content(messageId :: String.t(), opts :: keyword) :: {:ok, binary} | :error
  def get_message_content(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {Line.MessagingApiBlob, :get_message_content},
      url: "/v2/bot/message/#{messageId}/content",
      method: :get,
      response: [{200, {:string, "binary"}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/{messageId}/content/preview`

  Get a preview image of the image or video

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#get-image-or-video-preview)

  """
  @spec get_message_content_preview(messageId :: String.t(), opts :: keyword) ::
          {:ok, binary} | :error
  def get_message_content_preview(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {Line.MessagingApiBlob, :get_message_content_preview},
      url: "/v2/bot/message/#{messageId}/content/preview",
      method: :get,
      response: [{200, {:string, "binary"}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/message/{messageId}/content/transcoding`

  Verify the preparation status of a video or audio for getting

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#verify-video-or-audio-preparation-status)

  """
  @spec get_message_content_transcoding_by_message_id(messageId :: String.t(), opts :: keyword) ::
          {:ok, Line.GetMessageContentTranscodingResponse.t()} | :error
  def get_message_content_transcoding_by_message_id(messageId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [messageId: messageId],
      call: {Line.MessagingApiBlob, :get_message_content_transcoding_by_message_id},
      url: "/v2/bot/message/#{messageId}/content/transcoding",
      method: :get,
      response: [{200, {Line.GetMessageContentTranscodingResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  get `/v2/bot/richmenu/{richMenuId}/content`

  Download rich menu image.

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#download-rich-menu-image)

  """
  @spec get_rich_menu_image(richMenuId :: String.t(), opts :: keyword) :: {:ok, binary} | :error
  def get_rich_menu_image(richMenuId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId],
      call: {Line.MessagingApiBlob, :get_rich_menu_image},
      url: "/v2/bot/richmenu/#{richMenuId}/content",
      method: :get,
      response: [{200, {:string, "binary"}}],
      opts: opts
    })
  end

  @doc """
  post `/v2/bot/richmenu/{richMenuId}/content`

  Upload rich menu image

  ## Request Body

  **Content Types**: `*/*`

  ## Resources

    * [Documentation](https://developers.line.biz/en/reference/messaging-api/#upload-rich-menu-image)

  """
  @spec set_rich_menu_image(richMenuId :: String.t(), body :: binary, opts :: keyword) ::
          :ok | :error
  def set_rich_menu_image(richMenuId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [richMenuId: richMenuId, body: body],
      call: {Line.MessagingApiBlob, :set_rich_menu_image},
      url: "/v2/bot/richmenu/#{richMenuId}/content",
      body: body,
      method: :post,
      request: [{"*/*", {:string, "binary"}}],
      response: [{200, :null}],
      opts: opts
    })
  end
end
