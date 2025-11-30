defmodule StabilityAI.V2Alpha.Generation do
  @moduledoc """
  Provides API endpoints related to v2 alpha/generation
  """

  @default_client StabilityAI.Client

  @type v2_alpha_generation_image_to_video_post_200_json_resp :: %{id: String.t()}

  @type v2_alpha_generation_image_to_video_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_image_to_video_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  image-to-video

  Generate a short video based on an initial image with [Stable Video Diffusion](https://static1.squarespace.com/static/6213c340453c3f502425776e/t/655ce779b9d47d342a93c890/1700587395994/stable_video_diffusion.pdf),
  a latent video diffusion model. 


  ### How to generate a video
  Video generations are asynchronous, so after starting a generation use the `id` returned in the response to poll [/v2alpha/generation/image-to-video/result/{id}](#tag/v2alphageneration/paths/~1v2alpha~1generation~1image-to-video~1result~1%7Bid%7D/get) for results.

  ### Price
  Flat rate of 20 cents per generation.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec v2_alpha_generation_image_to_video_post(
          body :: StabilityAI.ImageToVideoRequest.t(),
          opts :: keyword
        ) ::
          {:ok,
           StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_post_200_json_resp()}
          | {:error,
             StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_post_400_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_post_500_json_resp()}
  def v2_alpha_generation_image_to_video_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_image_to_video_post},
      url: "/v2alpha/generation/image-to-video",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {StabilityAI.ImageToVideoRequest, :t}}],
      response: [
        {200,
         {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_image_to_video_post_200_json_resp}},
        {400,
         {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_image_to_video_post_400_json_resp}},
        {500,
         {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_image_to_video_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_alpha_generation_image_to_video_result_id_get_200__resp :: %{
          finish_reason: String.t(),
          seed: number | nil,
          video: String.t()
        }

  @type v2_alpha_generation_image_to_video_result_id_get_202_json_resp :: %{
          id: String.t(),
          status: String.t()
        }

  @type v2_alpha_generation_image_to_video_result_id_get_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_image_to_video_result_id_get_404_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_image_to_video_result_id_get_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  image-to-video/result

  Fetch the result of an image-to-video generation by ID. Make sure you use the same API key that you used to
  generate the video, otherwise you will receive a `404` response.

  ### How is progress reported?
  Your generation is either `in-progress` (i.e. status code `202`) or it is complete (i.e. status code `200`). 
  We may add more fine-grained progress reporting in the future (e.g. a numerical progress).

  ### How long are results stored?
  Results are stored for 24 hours after generation. After that, the results are deleted and you will need to 
  re-generate your video.
  """
  @spec v2_alpha_generation_image_to_video_result_id_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           binary
           | StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_result_id_get_200__resp()
           | StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_result_id_get_202_json_resp()}
          | {:error,
             StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_result_id_get_400_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_result_id_get_404_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_image_to_video_result_id_get_500_json_resp()}
  def v2_alpha_generation_image_to_video_result_id_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_image_to_video_result_id_get},
      url: "/v2alpha/generation/image-to-video/result/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {StabilityAI.V2Alpha.Generation,
             :v2_alpha_generation_image_to_video_result_id_get_200__resp},
            string: "binary"
          ]}},
        {202,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_image_to_video_result_id_get_202_json_resp}},
        {400,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_image_to_video_result_id_get_400_json_resp}},
        {404,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_image_to_video_result_id_get_404_json_resp}},
        {500,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_image_to_video_result_id_get_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_alpha_generation_stable_image_inpaint_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_stable_image_inpaint_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  stable-image/inpaint

  Inpaint an existing image, with or without a mask, using our latest-and-greatest inpainting model.

  ### Search-and-Replace Mode
  This mode is ideal for individuals of all levels of skill in design. It can be used for straightforward 
  adjustments to images. The service will automatically mask the most appropriate object based on the contents
  of the `search_prompt`, and replace it with a generated result based on the `prompt`.

  **How to use:** set the `mode` parameter to `search` and provide a short description of what to 
  search-and-replace in the `search_prompt` parameter.

  ### Mask Mode
  This mode allows for precise control of generative fill tasks on an image, down to the level of 
  individual pixels. Design professionals can provide a `mask` for the section of the image to be replaced, 
  and use standard image prompting to describe the full image as it should appear after the editing. 
  The resulting image will incorporate all of the elements described in the `prompt`.

  **How to use:** set the `mode` parameter to `mask` and either pass in an `image` with an alpha channel 
  or provide an explicit mask image to the `mask` parameter. If both are present the `mask` parameter will
  take precedence.

  ### Price
  - Requests with `mode` set to `search` cost 4 cents.
  - Requests with `mode` set to `mask` cost 3 cents.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec v2_alpha_generation_stable_image_inpaint_post(
          body ::
            StabilityAI.InpaintingMaskingModeRequestBody.t()
            | StabilityAI.InpaintingSearchModeRequestBody.t(),
          opts :: keyword
        ) ::
          {:ok,
           binary
           | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_inpaint_post_200__resp()}
          | {:error,
             StabilityAI.ContentModerationResponse.t()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_inpaint_post_400_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_inpaint_post_500_json_resp()}
  def v2_alpha_generation_stable_image_inpaint_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_stable_image_inpaint_post},
      url: "/v2alpha/generation/stable-image/inpaint",
      body: body,
      method: :post,
      request: [
        {"multipart/form-data",
         {:union,
          [
            {StabilityAI.InpaintingMaskingModeRequestBody, :t},
            {StabilityAI.InpaintingSearchModeRequestBody, :t}
          ]}}
      ],
      response: [
        {200,
         {:union,
          [
            {StabilityAI.V2Alpha.Generation,
             :v2_alpha_generation_stable_image_inpaint_post_200__resp},
            string: "binary"
          ]}},
        {400,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_inpaint_post_400_json_resp}},
        {403, {StabilityAI.ContentModerationResponse, :t}},
        {500,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_inpaint_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_alpha_generation_stable_image_upscale_post_200_json_resp :: %{id: String.t()}

  @type v2_alpha_generation_stable_image_upscale_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_stable_image_upscale_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  stable-image/upscale

  Takes images between 64x64 and 1 megapixel and upscales them all the way to **4K** resolution.  Put more 
  generally, it can upscale images ~20-40x times while preserving, and often enhancing, quality.

  ### How to use
    - Invoke this endpoint with the required parameters to start a generation
    - Use that `id` in the response to poll for results at the [upscale/result/{id}](#tag/v2alphageneration/paths/~1v2alpha~1generation~1stable-image~1upscale~1result~1%7Bid%7D/get) endpoint
      - Rate-limiting or other errors may occur if you poll more than once every 10 seconds
      
  ### Price
  Flat rate of 25 cents per generation.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec v2_alpha_generation_stable_image_upscale_post(body :: map, opts :: keyword) ::
          {:ok,
           StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_post_200_json_resp()}
          | {:error,
             StabilityAI.ContentModerationResponse.t()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_post_400_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_post_500_json_resp()}
  def v2_alpha_generation_stable_image_upscale_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_stable_image_upscale_post},
      url: "/v2alpha/generation/stable-image/upscale",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_post_200_json_resp}},
        {400,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_post_400_json_resp}},
        {403, {StabilityAI.ContentModerationResponse, :t}},
        {500,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_alpha_generation_stable_image_upscale_result_id_get_202_json_resp :: %{
          id: String.t(),
          status: String.t()
        }

  @type v2_alpha_generation_stable_image_upscale_result_id_get_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_stable_image_upscale_result_id_get_404_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_alpha_generation_stable_image_upscale_result_id_get_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  stable-image/upscale/result

  Fetch the result of an upscale generation by ID. Make sure to use the same API key to fetch the generation result
  that you used to create the generation, otherwise you will receive a `404` response.

  ### How is progress reported?
  Your generation is either `in-progress` (i.e. status code `202`) or it is complete (i.e. status code `200`). 
  We may add more fine-grained progress reporting in the future (e.g. a numerical progress).

  ### How long are results stored?
  Results are stored for 24 hours after generation. After that, the results are deleted.
  """
  @spec v2_alpha_generation_stable_image_upscale_result_id_get(id :: String.t(), opts :: keyword) ::
          {:ok,
           binary
           | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_result_id_get_200__resp()
           | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_result_id_get_202_json_resp()}
          | {:error,
             StabilityAI.ContentModerationResponse.t()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_result_id_get_400_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_result_id_get_404_json_resp()
             | StabilityAI.V2Alpha.Generation.v2_alpha_generation_stable_image_upscale_result_id_get_500_json_resp()}
  def v2_alpha_generation_stable_image_upscale_result_id_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call:
        {StabilityAI.V2Alpha.Generation, :v2_alpha_generation_stable_image_upscale_result_id_get},
      url: "/v2alpha/generation/stable-image/upscale/result/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {StabilityAI.V2Alpha.Generation,
             :v2_alpha_generation_stable_image_upscale_result_id_get_200__resp},
            string: "binary"
          ]}},
        {202,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_result_id_get_202_json_resp}},
        {400,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_result_id_get_400_json_resp}},
        {403, {StabilityAI.ContentModerationResponse, :t}},
        {404,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_result_id_get_404_json_resp}},
        {500,
         {StabilityAI.V2Alpha.Generation,
          :v2_alpha_generation_stable_image_upscale_result_id_get_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_alpha_generation_image_to_video_post_200_json_resp) do
    [id: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_post_400_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_post_500_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_result_id_get_200__resp) do
    [finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]}, seed: :number, video: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_result_id_get_202_json_resp) do
    [id: :string, status: {:const, "in-progress"}]
  end

  def __fields__(:v2_alpha_generation_image_to_video_result_id_get_400_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_result_id_get_404_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_image_to_video_result_id_get_500_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_inpaint_post_200__resp) do
    [finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]}, image: :string, seed: :number]
  end

  def __fields__(:v2_alpha_generation_stable_image_inpaint_post_400_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_inpaint_post_500_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_post_200_json_resp) do
    [id: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_post_400_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_post_500_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_result_id_get_200__resp) do
    [finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]}, image: :string, seed: :number]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_result_id_get_202_json_resp) do
    [id: :string, status: {:const, "in-progress"}]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_result_id_get_400_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_result_id_get_404_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end

  def __fields__(:v2_alpha_generation_stable_image_upscale_result_id_get_500_json_resp) do
    [errors: [:string], id: :string, name: :string]
  end
end
