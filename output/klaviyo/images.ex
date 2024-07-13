defmodule Images do
  @moduledoc """
  Provides API endpoints related to images
  """

  @default_client Client

  @doc """
  Get Image

  Get the image with the given image ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `images:read`

  ## Options

    * `fields[image]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_image(String.t(), keyword) ::
          {:ok, GetImageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_image(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[image]"])

    client.request(%{
      args: [id: id],
      call: {Images, :get_image},
      url: "/api/images/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetImageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Images

  Get all images in an account.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `images:read`

  ## Options

    * `fields[image]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`, `equals`<br>`updated_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`format`: `any`, `equals`<br>`name`: `any`, `contains`, `ends-with`, `equals`, `starts-with`<br>`size`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`hidden`: `any`, `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_images(keyword) ::
          {:ok, GetImageResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_images(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[image]", :filter, :"page[cursor]", :"page[size]", :sort])

    client.request(%{
      args: [],
      call: {Images, :get_images},
      url: "/api/images/",
      method: :get,
      query: query,
      response: [
        {200, {GetImageResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Image

  Update the image with the given image ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `images:write`
  """
  @spec update_image(String.t(), ImagePartialUpdateQuery.t(), keyword) ::
          {:ok, PatchImageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_image(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Images, :update_image},
      url: "/api/images/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {ImagePartialUpdateQuery, :t}}],
      response: [
        {200, {PatchImageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Upload Image From File

  Upload an image from a file.

  If you want to import an image from an existing url or a data uri, use the Upload Image From URL endpoint instead.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `100/m`<br>Daily: `100/d`

  **Scopes:**
  `images:write`
  """
  @spec upload_image_from_file(ImageUploadQuery.t(), keyword) ::
          {:ok, PostImageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def upload_image_from_file(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Images, :upload_image_from_file},
      url: "/api/image-upload/",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {ImageUploadQuery, :t}}],
      response: [
        {201, {PostImageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Upload Image From URL

  Import an image from a url or data uri.

  If you want to upload an image from a file, use the Upload Image From File endpoint instead.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `100/m`<br>Daily: `100/d`

  **Scopes:**
  `images:write`
  """
  @spec upload_image_from_url(ImageCreateQuery.t(), keyword) ::
          {:ok, PostImageResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def upload_image_from_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Images, :upload_image_from_url},
      url: "/api/images/",
      body: body,
      method: :post,
      request: [{"application/json", {ImageCreateQuery, :t}}],
      response: [
        {201, {PostImageResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
