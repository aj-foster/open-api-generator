defmodule OpenAI.Images do
  @moduledoc """
  Provides API endpoints related to images
  """

  @default_client OpenAI.Client

  @doc """
  Creates an image given a prompt.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_image(body :: OpenAI.CreateImageRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.ImagesResponse.t()} | :error
  def create_image(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Images, :create_image},
      url: "/images/generations",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateImageRequest, :t}}],
      response: [{200, {OpenAI.ImagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates an edited or extended image given an original image and a prompt.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_image_edit(body :: OpenAI.CreateImageEditRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.ImagesResponse.t()} | :error
  def create_image_edit(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Images, :create_image_edit},
      url: "/images/edits",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAI.CreateImageEditRequest, :t}}],
      response: [{200, {OpenAI.ImagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a variation of a given image.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_image_variation(body :: OpenAI.CreateImageVariationRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.ImagesResponse.t()} | :error
  def create_image_variation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Images, :create_image_variation},
      url: "/images/variations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAI.CreateImageVariationRequest, :t}}],
      response: [{200, {OpenAI.ImagesResponse, :t}}],
      opts: opts
    })
  end
end
