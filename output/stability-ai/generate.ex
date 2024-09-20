defmodule Generate do
  @moduledoc """
  Provides API endpoints related to generate
  """

  @default_client Client

  @type v2_beta_stable_image_generate_core_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_core_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_core_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_core_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Stable Image Core

  Our primary service for text-to-image generation, Stable Image Core represents the best quality achievable at high 
  speed. No prompt engineering is required! Try asking for a style, a scene, or a character, and see what you get.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=yXhs626oZdr1)

  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.

  The body of the request should include:
  - `prompt`

  The body may optionally include:
  - `aspect_ratio`
  - `negative_prompt`
  - `seed`
  - `style_preset`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will be 1.5 megapixels.

  ### Credits
  Flat rate of 3 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_generate_core_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_generate_core_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Generate, :v2_beta_stable_image_generate_core_post},
      url: "/v2beta/stable-image/generate/core",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union,
          [{Generate, :v2_beta_stable_image_generate_core_post_200__resp}, string: :generic]}},
        {400, {Generate, :v2_beta_stable_image_generate_core_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {422, {Generate, :v2_beta_stable_image_generate_core_post_422_json_resp}},
        {429, {Generate, :v2_beta_stable_image_generate_core_post_429_json_resp}},
        {500, {Generate, :v2_beta_stable_image_generate_core_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_generate_sd3_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_sd3_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_sd3_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_sd3_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_generate_sd3_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Stable Diffusion 3.0

  Generate images using Stable Diffusion 3.0 (SD3) or Stable Diffusion 3.0 Turbo (SD3 Turbo),
  using either a prompt (text-to-image) or a image + prompt (image-to-image) as the input. 

  This API is powered by [Fireworks AI](https://fireworks.ai/). 
  API status can be reviewed [here](https://readme.fireworks.ai/page/application-status). 

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to one of the following sites:    
  - [![Open Fireworks Playground](https://platform.stability.ai/svg/fireworks.svg)](https://fireworks.ai/models/stability/sd3)
  - [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/SD3_API.ipynb)


  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`.  The accept header should be set to one of the following:
  - `image/*` to receive the image in the format specified by the `output_format` parameter.
  - `application/json` to receive the image encoded as base64 in a JSON response.

  ### Switching between modes
  This endpoint supports two modes of generation: **text-to-image** and **image-to-image**.  You can switch between
  these modes by setting the `mode` parameter in the request body.  The default mode is **text-to-image**.

  #### **Text-to-Image**

  This mode only requires a `prompt` to generate an image.
  Additionally, in this mode you can pass in `aspect_ratio` to control the aspect ratio of the generated image.

  #### **Image-to-Image**

  Using this mode is slightly more involved, as you'll have to provide:
  - `prompt`
  - `mode` with the value `image-to-image`
  - `image`
  - `strength`

  > **Note:** maximum request size is 10MiB.

  #### *Optional* Parameters for both modes:
  - `negative_prompt`
  - `model`
  - `seed`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will be 1 megapixel. The default resolution is 1024x1024.

  ### Credits
  - SD3: Flat rate of 6.5 credits per successful generation of a 1MP image. You will not be charged for failed generations.
  - SD3 Turbo: Flat rate of 4 credits per successful generation of a 1MP image. You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_generate_sd3_post(ImageToImage.t() | TextToImage.t(), keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_generate_sd3_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Generate, :v2_beta_stable_image_generate_sd3_post},
      url: "/v2beta/stable-image/generate/sd3",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {:union, [{ImageToImage, :t}, {TextToImage, :t}]}}],
      response: [
        {200,
         {:union,
          [{Generate, :v2_beta_stable_image_generate_sd3_post_200__resp}, string: :generic]}},
        {400, {Generate, :v2_beta_stable_image_generate_sd3_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Generate, :v2_beta_stable_image_generate_sd3_post_413_json_resp}},
        {422, {Generate, :v2_beta_stable_image_generate_sd3_post_422_json_resp}},
        {429, {Generate, :v2_beta_stable_image_generate_sd3_post_429_json_resp}},
        {500, {Generate, :v2_beta_stable_image_generate_sd3_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_beta_stable_image_generate_core_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_generate_core_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_core_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_core_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_core_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_generate_sd3_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end
end
