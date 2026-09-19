defmodule StabilityAI.ImageToImage do
  @moduledoc """
  Provides API endpoints related to image to image
  """

  @default_client StabilityAI.Client

  @doc """
  Image-to-image with prompt

  Produce an image from an existing image using a text prompt. 
  ### How to control strength of generation
  To preserve only roughly 35% of the initial image, pass in either `init_image_mode=IMAGE_STRENGTH` and `image_strength=0.35` or `init_image_mode=STEP_SCHEDULE` and `step_schedule_start=0.65`.  Both of these are equivalent, however `init_image_mode=STEP_SCHEDULE` also lets you pass in `step_schedule_end`, which can provide an extra level of control for those who need it.  For more details, see the specific fields below.  

  > NOTE: Only **Version 1** engines will work with this endpoint.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec image_to_image(
          engine_id :: String.t(),
          body :: StabilityAI.ImageToImageRequestBody.t(),
          opts :: keyword
        ) ::
          {:ok, binary | StabilityAI.GenerationResponse.json_resp()}
          | {:error, StabilityAI.Error.t()}
  def image_to_image(engine_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [engine_id: engine_id, body: body],
      call: {StabilityAI.ImageToImage, :image_to_image},
      url: "/v1/generation/#{engine_id}/image-to-image",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {StabilityAI.ImageToImageRequestBody, :t}}],
      response: [
        {200, {:union, [{StabilityAI.GenerationResponse, :json_resp}, string: "binary"]}},
        {400, {StabilityAI.Error, :t}},
        {401, {StabilityAI.Error, :t}},
        {403, {StabilityAI.Error, :t}},
        {404, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Image-to-image with a mask

  Selectively modify portions of an image using a mask. The `mask` must be the same shape and size as the init image. This endpoint also supports `image` parameters with alpha channels.  See below for more details. 

  > NOTE: Only **Version 1** engines will work with this endpoint.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec masking(
          engine_id :: String.t(),
          body :: StabilityAI.MaskingRequestBody.t(),
          opts :: keyword
        ) ::
          {:ok, binary | StabilityAI.GenerationResponse.json_resp()}
          | {:error, StabilityAI.Error.t()}
  def masking(engine_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [engine_id: engine_id, body: body],
      call: {StabilityAI.ImageToImage, :masking},
      url: "/v1/generation/#{engine_id}/image-to-image/masking",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {StabilityAI.MaskingRequestBody, :t}}],
      response: [
        {200, {:union, [{StabilityAI.GenerationResponse, :json_resp}, string: "binary"]}},
        {400, {StabilityAI.Error, :t}},
        {401, {StabilityAI.Error, :t}},
        {403, {StabilityAI.Error, :t}},
        {404, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Image-to-image upscale

  Create a higher resolution version of an input image.

  This operation outputs an image with a maximum pixel count of **4,194,304**. This is equivalent to dimensions such as `2048x2048` and `4096x1024`.

  By default, the input image will be upscaled by a factor of 2.  For additional control over the output dimensions, a `width` or `height` parameter may be specified.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec upscale_image(
          engine_id :: String.t(),
          body :: StabilityAI.RealESRGANUpscaleRequestBody.t(),
          opts :: keyword
        ) ::
          {:ok, binary | StabilityAI.GenerationResponse.json_resp()}
          | {:error, StabilityAI.Error.t()}
  def upscale_image(engine_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [engine_id: engine_id, body: body],
      call: {StabilityAI.ImageToImage, :upscale_image},
      url: "/v1/generation/#{engine_id}/image-to-image/upscale",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {StabilityAI.RealESRGANUpscaleRequestBody, :t}}],
      response: [
        {200, {:union, [{StabilityAI.GenerationResponse, :json_resp}, string: "binary"]}},
        {400, {StabilityAI.Error, :t}},
        {401, {StabilityAI.Error, :t}},
        {403, {StabilityAI.Error, :t}},
        {404, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          image: map,
          mode: String.t() | nil,
          model: String.t() | nil,
          negative_prompt: String.t() | nil,
          output_format: String.t() | nil,
          prompt: String.t(),
          seed: number | nil,
          strength: number
        }

  defstruct [:image, :mode, :model, :negative_prompt, :output_format, :prompt, :seed, :strength]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image: :map,
      mode: {:enum, ["text-to-image", "image-to-image"]},
      model: {:enum, ["sd3", "sd3-turbo"]},
      negative_prompt: :string,
      output_format: {:enum, ["png", "jpeg"]},
      prompt: :string,
      seed: :number,
      strength: :number
    ]
  end
end
