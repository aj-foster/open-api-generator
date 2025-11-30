defmodule OpenAI.ResponseError do
  @moduledoc """
  Provides struct and type for a ResponseError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code:
        {:enum,
         [
           "server_error",
           "rate_limit_exceeded",
           "invalid_prompt",
           "vector_store_timeout",
           "invalid_image",
           "invalid_image_format",
           "invalid_base64_image",
           "invalid_image_url",
           "image_too_large",
           "image_too_small",
           "image_parse_error",
           "image_content_policy_violation",
           "invalid_image_mode",
           "image_file_too_large",
           "unsupported_image_media_type",
           "empty_image_file",
           "failed_to_download_image",
           "image_file_not_found"
         ]},
      message: :string
    ]
  end
end
