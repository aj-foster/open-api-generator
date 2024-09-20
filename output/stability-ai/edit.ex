defmodule Edit do
  @moduledoc """
  Provides API endpoints related to edit
  """

  @default_client Client

  @type v2_beta_stable_image_edit_inpaint_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_inpaint_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_inpaint_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_inpaint_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_inpaint_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Inpaint

  Intelligently modify images by filling in or replacing specified areas with new content based
  on the content of a "mask" image. 

  The "mask" is provided in one of two ways:
    1. Explicitly passing in a separate image via the `mask` parameter 
    2. Derived from the alpha channel of the `image` parameter.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=t1Q4w2uvvza0)

  ### How to use

  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.
    
  The body of the request must include:
  - `image`
  - `prompt`

  Optionally, the body of the request may also include:
  - `mask`
  - `negative_prompt`
  - `seed`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will be 4 megapixels.

  ### Credits
  Flat rate of 3 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_edit_inpaint_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_edit_inpaint_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Edit, :v2_beta_stable_image_edit_inpaint_post},
      url: "/v2beta/stable-image/edit/inpaint",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union, [{Edit, :v2_beta_stable_image_edit_inpaint_post_200__resp}, string: :generic]}},
        {400, {Edit, :v2_beta_stable_image_edit_inpaint_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Edit, :v2_beta_stable_image_edit_inpaint_post_413_json_resp}},
        {422, {Edit, :v2_beta_stable_image_edit_inpaint_post_422_json_resp}},
        {429, {Edit, :v2_beta_stable_image_edit_inpaint_post_429_json_resp}},
        {500, {Edit, :v2_beta_stable_image_edit_inpaint_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_edit_outpaint_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_outpaint_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_outpaint_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_outpaint_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_outpaint_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Outpaint

  The Outpaint service inserts additional content in an image to fill in the space in any direction. 
  Compared to other automated or manual attempts to expand the content in an image, the Outpaint service 
  should minimize artifacts and signs that the original image has been edited.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=bZ2yK7VQSgLw)

  ### How to use

  Please invoke this endpoint with a POST request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.
    
  The body of the request must include:
  - `image`

  Along with _at least one_ outpaint direction:
  - `left`
  - `right`
  - `up`
  - `down`

  Each of these parameters should be set to a number between 0 and 512, representing the number of pixels to outpaint in that direction.

  Optionally, the body of the request may also include:
  - `prompt`
  - `seed`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Credits
  Flat rate of 4 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_edit_outpaint_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_edit_outpaint_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Edit, :v2_beta_stable_image_edit_outpaint_post},
      url: "/v2beta/stable-image/edit/outpaint",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union, [{Edit, :v2_beta_stable_image_edit_outpaint_post_200__resp}, string: :generic]}},
        {400, {Edit, :v2_beta_stable_image_edit_outpaint_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Edit, :v2_beta_stable_image_edit_outpaint_post_413_json_resp}},
        {422, {Edit, :v2_beta_stable_image_edit_outpaint_post_422_json_resp}},
        {429, {Edit, :v2_beta_stable_image_edit_outpaint_post_429_json_resp}},
        {500, {Edit, :v2_beta_stable_image_edit_outpaint_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_edit_remove_background_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_remove_background_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_remove_background_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_remove_background_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Remove Background

  The Remove Background service accurately segments the foreground from an image and implements 
  and removes the background.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=VHofb3LAVmqi)


  ### How to use

  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.
    
  The body of the request must include:
  - `image`

  Optionally, the body of the request may also include:
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Credits
  Flat rate of 2 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_edit_remove_background_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_edit_remove_background_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Edit, :v2_beta_stable_image_edit_remove_background_post},
      url: "/v2beta/stable-image/edit/remove-background",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union,
          [{Edit, :v2_beta_stable_image_edit_remove_background_post_200__resp}, string: :generic]}},
        {400, {Edit, :v2_beta_stable_image_edit_remove_background_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Edit, :v2_beta_stable_image_edit_remove_background_post_413_json_resp}},
        {429, {Edit, :v2_beta_stable_image_edit_remove_background_post_429_json_resp}},
        {500, {Edit, :v2_beta_stable_image_edit_remove_background_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @type v2_beta_stable_image_edit_search_and_replace_post_400_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_search_and_replace_post_413_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_search_and_replace_post_422_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_search_and_replace_post_429_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @type v2_beta_stable_image_edit_search_and_replace_post_500_json_resp :: %{
          errors: [String.t()],
          id: String.t(),
          name: String.t()
        }

  @doc """
  Search and Replace

  The Search and Replace service is a specific version of inpainting that does not require a mask. 
  Instead, users can leverage a `search_prompt` to identify an object in simple language to be replaced. 
  The service will automatically segment the object and replace it with the object requested in the prompt.

  ### Try it out
  Grab your [API key](https://platform.stability.ai/account/keys) and head over to [![Open Google Colab](https://platform.stability.ai/svg/google-colab.svg)](https://colab.research.google.com/github/stability-ai/stability-sdk/blob/main/nbs/Stable_Image_API_Public.ipynb#scrollTo=0lDpGa2jAmAs)

  ### How to use
  Please invoke this endpoint with a `POST` request.

  The headers of the request must include an API key in the `authorization` field. The body of the request must be
  `multipart/form-data`, and the `accept` header should be set to one of the following:
    - `image/*` to receive the image in the format specified by the `output_format` parameter.
    - `application/json` to receive the image encoded as base64 in a JSON response.

  The body of the request should include:
  - `image`
  - `prompt`
  - `search_prompt`

  The body may optionally include:
  - `seed`
  - `negative_prompt`
  - `output_format`

  > **Note:** for more details about these parameters please see the request schema below.

  ### Output
  The resolution of the generated image will be 4 megapixels.

  ### Credits
  Flat rate of 4 credits per successful generation.  You will not be charged for failed generations.
  """
  @spec v2_beta_stable_image_edit_search_and_replace_post(map, keyword) ::
          {:ok, map | String.t()} | {:error, map | ContentModerationResponse.t()}
  def v2_beta_stable_image_edit_search_and_replace_post(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Edit, :v2_beta_stable_image_edit_search_and_replace_post},
      url: "/v2beta/stable-image/edit/search-and-replace",
      body: body,
      method: :post,
      request: [{"multipart/form-data", :map}],
      response: [
        {200,
         {:union,
          [{Edit, :v2_beta_stable_image_edit_search_and_replace_post_200__resp}, string: :generic]}},
        {400, {Edit, :v2_beta_stable_image_edit_search_and_replace_post_400_json_resp}},
        {403, {ContentModerationResponse, :t}},
        {413, {Edit, :v2_beta_stable_image_edit_search_and_replace_post_413_json_resp}},
        {422, {Edit, :v2_beta_stable_image_edit_search_and_replace_post_422_json_resp}},
        {429, {Edit, :v2_beta_stable_image_edit_search_and_replace_post_429_json_resp}},
        {500, {Edit, :v2_beta_stable_image_edit_search_and_replace_post_500_json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:v2_beta_stable_image_edit_inpaint_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_edit_inpaint_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_inpaint_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_inpaint_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_inpaint_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_inpaint_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_outpaint_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_remove_background_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_edit_remove_background_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_remove_background_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_remove_background_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_remove_background_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_200__resp) do
    [
      finish_reason: {:enum, ["SUCCESS", "CONTENT_FILTERED"]},
      image: {:string, :generic},
      seed: :number
    ]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_400_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_413_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_422_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_429_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end

  def __fields__(:v2_beta_stable_image_edit_search_and_replace_post_500_json_resp) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:string, :generic}]
  end
end
