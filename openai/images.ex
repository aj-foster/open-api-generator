defmodule Images do
  @moduledoc """
  Provides API endpoints related to images
  """

  @default_client Client

  @doc """
  Creates an image given a prompt.
  """
  @spec create_image(body :: CreateImageRequest.t(), opts :: keyword) ::
          {:ok, ImagesResponse.t()} | :error
  def create_image(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Images, :create_image},
      url: "/images/generations",
      body: body,
      method: :post,
      request: [{"application/json", {CreateImageRequest, :t}}],
      response: [{200, {ImagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates an edited or extended image given an original image and a prompt.
  """
  @spec create_image_edit(body :: CreateImageEditRequest.t(), opts :: keyword) ::
          {:ok, ImagesResponse.t()} | :error
  def create_image_edit(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Images, :create_image_edit},
      url: "/images/edits",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {CreateImageEditRequest, :t}}],
      response: [{200, {ImagesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a variation of a given image.
  """
  @spec create_image_variation(body :: CreateImageVariationRequest.t(), opts :: keyword) ::
          {:ok, ImagesResponse.t()} | :error
  def create_image_variation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Images, :create_image_variation},
      url: "/images/variations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {CreateImageVariationRequest, :t}}],
      response: [{200, {ImagesResponse, :t}}],
      opts: opts
    })
  end
end
