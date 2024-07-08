defmodule Upscale do
  @moduledoc """
  Provides API endpoints related to upscale
  """

  @default_client Client

  @type v2_beta_stable_image_upscale_creative_post_200_json_resp :: %{id: String.t()}

  @type v2_beta_stable_image_upscale_creative_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Start Creative Upscale

  Takes images between 64x64 and 1 megapixel and upscales them all the way to **4K** resolution.  Put more 
  generally, it can upscale images ~20-40x times while preserving, and often enhancing, quality. 
  Creative Upscale **works best on highly degraded images and is not for photos of 1mp or above** as it performs 
  heavy reimagining (controlled by creativity scale).

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=QXxi9tfI425t)


  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`.

  The body of the request should include:
  - `image`
  - `prompt`

  The body may optionally include:
  - `seed`
  - `negative_prompt`
  - `output_format`
  - `creativity`

  > **Note:** for more details about these parameters please see the request schema below.

  After invoking this endpoint with the required parameters, use the `id` in the response to poll for results at the
  [upscale/result/{id}](#tag/Upscale/paths/~1v2beta~1stable-image~1upscale~1creative~1result~1%7Bid%7D/get) endpoint.  Rate-limiting or other errors may occur if you poll more than once every 10 seconds.

  ### Credits
  Flat rate of 25 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_upscale_creative_post(map, keyword) ::
          {:ok, map} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_upscale_creative_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Upscale, :v2_beta_stable_image_upscale_creative_post},
      url: "/v2beta/stable-image/upscale/creative",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200, {Upscale, :v2_beta_stable_image_upscale_creative_post_200_json_resp}},
        {400, {Upscale, :v2_beta_stable_image_upscale_creative_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Upscale, :v2_beta_stable_image_upscale_creative_post_413_json_resp}},
        {422, {Upscale, :v2_beta_stable_image_upscale_creative_post_422_json_resp}},
        {429, {Upscale, :v2_beta_stable_image_upscale_creative_post_429_json_resp}},
        {500, {Upscale, :v2_beta_stable_image_upscale_creative_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_upscale_creative_result_id_get_202_json_resp :: %{
          id: String.t(),
          status: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_result_id_get_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_result_id_get_404_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_upscale_creative_result_id_get_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Fetch Creative Upscale result

  Fetch the result of an upscale generation by ID. 

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
  Results are stored for 24 hours after generation. After that, the results are deleted.
  """
  @spec v2_beta_stable_image_upscale_creative_result_id_get(String.t(), keyword) ::
          {:ok, map | String.t()} | {:error, map}
  def v2_beta_stable_image_upscale_creative_result_id_get(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get},
      url: "/v2beta/stable-image/upscale/creative/result/#{id}",
      method: :get,
      response: [
        {200,
         {:union,
          [
            {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get_200__resp},
            string: :generic
          ]}},
        {202, {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get_202_json_resp}},
        {400, {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get_400_json_resp}},
        {404, {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get_404_json_resp}},
        {500, {Upscale, :v2_beta_stable_image_upscale_creative_result_id_get_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_beta_stable_image_upscale_creative_post_200_json_resp) do
    [id: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_result_id_get_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_result_id_get_202_json_resp) do
    [id: {:string, :generic}, status: {:const, "in-progress"}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_result_id_get_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_result_id_get_404_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_upscale_creative_result_id_get_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end
end
