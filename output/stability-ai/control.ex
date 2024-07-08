defmodule Control do
  @moduledoc """
  Provides API endpoints related to control
  """

  @default_client Client

  @type v2_beta_stable_image_control_sketch_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_sketch_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_sketch_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_sketch_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_sketch_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Sketch

  This service offers an ideal solution for design projects that require brainstorming and
  frequent iterations. It upgrades rough hand-drawn sketches to refined outputs with precise 
  control. For non-sketch images, it allows detailed manipulation of the final appearance by 
  leveraging the contour lines and edges within the image.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=ZKIAqHzJzzUo)

  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.

  The body of the request should include:
  - `image`
  - `prompt`

  The body may optionally include:
  - `control_strength`
  - `negative_prompt`
  - `seed`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will match that of the input image.

  ### Credits
  Flat rate of 3 credits per successful generation. You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_control_sketch_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_control_sketch_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Control, :v2_beta_stable_image_control_sketch_post},
      url: "/v2beta/stable-image/control/sketch",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union,
          [{Control, :v2_beta_stable_image_control_sketch_post_200__resp}, string: :generic]}},
        {400, {Control, :v2_beta_stable_image_control_sketch_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Control, :v2_beta_stable_image_control_sketch_post_413_json_resp}},
        {422, {Control, :v2_beta_stable_image_control_sketch_post_422_json_resp}},
        {429, {Control, :v2_beta_stable_image_control_sketch_post_429_json_resp}},
        {500, {Control, :v2_beta_stable_image_control_sketch_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_control_structure_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_structure_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_structure_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_structure_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_control_structure_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Structure

  This service excels in generating images by maintaining the structure of an input image, 
  making it especially valuable for advanced content creation scenarios such as recreating 
  scenes or rendering characters from models.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=59RaZazXz0AU)

  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.

  The body of the request should include:
  - `image`
  - `prompt`

  The body may optionally include:
  - `control_strength`
  - `negative_prompt`
  - `seed`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will match that of the input image.

  ### Credits
  Flat rate of 3 credits per successful generation. You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_control_structure_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_control_structure_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Control, :v2_beta_stable_image_control_structure_post},
      url: "/v2beta/stable-image/control/structure",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union,
          [{Control, :v2_beta_stable_image_control_structure_post_200__resp}, string: :generic]}},
        {400, {Control, :v2_beta_stable_image_control_structure_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Control, :v2_beta_stable_image_control_structure_post_413_json_resp}},
        {422, {Control, :v2_beta_stable_image_control_structure_post_422_json_resp}},
        {429, {Control, :v2_beta_stable_image_control_structure_post_429_json_resp}},
        {500, {Control, :v2_beta_stable_image_control_structure_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_beta_stable_image_control_sketch_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_control_sketch_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_sketch_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_sketch_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_sketch_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_sketch_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_control_structure_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end
end
