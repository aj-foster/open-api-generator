defmodule TextToImage do
  @moduledoc """
  Provides API endpoint related to text to image
  """

  @default_client Client

  @doc """
  Text-to-image

  Generate an image from a text prompt. 
  ### Using SDXL 1.0
  Use `stable-diffusion-xl-1024-v1-0` as the `engine_id` of your request and pass in `height` & `width` as one of the following combinations:
  - 1024x1024
  - 1152x896
  - 896x1152
  - 1216x832
  - 1344x768
  - 768x1344
  - 1536x640
  - 640x1536. 

  ### Using SD 1.6
  Pass in `stable-diffusion-v1-6` as the `engine_id` of your request and ensure the `height` & `width` you pass in adhere to the following restrictions:
  - No dimension can be less than 320 pixels
  - No dimension can be greater than 1536 pixels

  ### Using SD Beta
  Pass in `stable-diffusion-xl-beta-v2-2-2` as the `engine_id` of your request and ensure the `height` & `width` you pass in adhere to the following restrictions:
  - dimensions must be between 128x128 and 512x896 (or 896x512)
  - only one dimension can be greater than 512, but not both 

  > NOTE: Only **Version 1** engines will work with this endpoint.
  """
  @spec text_to_image(String.t(), TextToImageRequestBody.t(), keyword) ::
          {:ok, GenerationResponse.json_resp() | String.t()} | {:error, Error.t()}
  def text_to_image(engine_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [engine_id: engine_id, body: body],
      call: {TextToImage, :text_to_image},
      url: "/v1/generation/#{engine_id}/text-to-image",
      body: body,
      method: :post,
      request: [{"application/json", {TextToImageRequestBody, :t}}],
      response: [
        {200, {:union, [{GenerationResponse, :json_resp}, string: :generic]}},
        {400, {Error, :t}},
        {401, {Error, :t}},
        {403, {Error, :t}},
        {404, {Error, :t}},
        {500, {Error, :t}}
      ],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          aspect_ratio: String.t() | nil,
          mode: String.t() | nil,
          model: String.t() | nil,
          negative_prompt: String.t() | nil,
          output_format: String.t() | nil,
          prompt: String.t(),
          seed: number | nil
        }

  defstruct [:aspect_ratio, :mode, :model, :negative_prompt, :output_format, :prompt, :seed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      aspect_ratio: {:enum, ["21:9", "16:9", "3:2", "5:4", "1:1", "4:5", "2:3", "9:16", "9:21"]},
      mode: {:enum, ["text-to-image", "image-to-image"]},
      model: {:enum, ["sd3", "sd3-turbo"]},
      negative_prompt: {:string, :generic},
      output_format: {:enum, ["png", "jpeg"]},
      prompt: {:string, :generic},
      seed: :number
    ]
  end
end
