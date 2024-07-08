defmodule ImageToVideo do
  @moduledoc """
  Provides API endpoints related to image to video
  """

  @default_client Client

  @type v2_beta_image_to_video_post_200_json_resp :: %{id: String.t()}

  @type v2_beta_image_to_video_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Start generation

  Generate a short video based on an initial image with [Stable Video Diffusion](https://static1.squarespace.com/static/6213c340453c3f502425776e/t/655ce779b9d47d342a93c890/1700587395994/stable_video_diffusion.pdf),
  a latent video diffusion model. 



  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`.

  The body of the request should include:
  - `image`

  The body may optionally include:
  - `seed`
  - `cfg_scale`
  - `motion_bucket_id`

  > **Note:** for more details about these parameters please see the request schema below.

  After invoking this endpoint with the required parameters, use the `id` in the response to poll for results at the
  [image-to-video/result/{id}](#tag/Image-to-Video/paths/~1v2beta~1image-to-video~1result~1%7Bid%7D/get) endpoint.  Rate-limiting or other errors may occur if you poll more than once every 10 seconds.

  ### Credits
  Flat rate of 20 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_image_to_video_post(map, keyword) ::
          {:ok, map} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_image_to_video_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {ImageToVideo, :v2_beta_image_to_video_post},
      url: "/v2beta/image-to-video",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200, {ImageToVideo, :v2_beta_image_to_video_post_200_json_resp}},
        {400, {ImageToVideo, :v2_beta_image_to_video_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {ImageToVideo, :v2_beta_image_to_video_post_413_json_resp}},
        {422, {ImageToVideo, :v2_beta_image_to_video_post_422_json_resp}},
        {429, {ImageToVideo, :v2_beta_image_to_video_post_429_json_resp}},
        {500, {ImageToVideo, :v2_beta_image_to_video_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_image_to_video_result_id_get_200__resp :: %{
          finish_reason: String.t(),
          seed: number | nil,
          video: String.t()
        }

  @type v2_beta_image_to_video_result_id_get_202_json_resp :: %{
          id: String.t(),
          status: String.t()
        }

  @type v2_beta_image_to_video_result_id_get_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_result_id_get_404_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_image_to_video_result_id_get_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Fetch generation result

  Fetch the result of an image-to-video generation by ID.

  Make sure to use the same API key to fetch the generation result that you used to create the generation, 
  otherwise you will receive a `404` response.

  ### How to use
  Please invoke this endpoint with a `GET` request.

  The headers of the request must include an API key in the `authorization` field and the ID
  of your generation must be in the path.

  ### How is progress reported?
  Your generation is either `in-progress` (i.e. status code `202`) or it is complete (i.e. status code `200`). 
  We may add more fine-grained progress reporting in the future (e.g. a numerical progress).

  ### How long are results stored?
  Results are stored for 24 hours after generation. After that, the results are deleted and you will need to 
  re-generate your video.
  """
  @spec v2_beta_image_to_video_result_id_get(String.t(), keyword) ::
          {:ok, map | String.t()} | {:error, map}
  def v2_beta_image_to_video_result_id_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {ImageToVideo, :v2_beta_image_to_video_result_id_get},
      url: "/v2beta/image-to-video/result/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [{ImageToVideo, :v2_beta_image_to_video_result_id_get_200__resp}, string: :generic]}},
        {202, {ImageToVideo, :v2_beta_image_to_video_result_id_get_202_json_resp}},
        {400, {ImageToVideo, :v2_beta_image_to_video_result_id_get_400_json_resp}},
        {404, {ImageToVideo, :v2_beta_image_to_video_result_id_get_404_json_resp}},
        {500, {ImageToVideo, :v2_beta_image_to_video_result_id_get_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_beta_image_to_video_post_200_json_resp) do
    [id: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_result_id_get_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      seed: :number,
      video: {:string, :generic}
    ]
  end

  def __fields__(:v2_beta_image_to_video_result_id_get_202_json_resp) do
    [id: {:string, :generic}, status: {:const, "in-progress"}]
  end

  def __fields__(:v2_beta_image_to_video_result_id_get_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_result_id_get_404_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_image_to_video_result_id_get_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end
end
