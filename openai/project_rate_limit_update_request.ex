defmodule OpenAI.ProjectRateLimitUpdateRequest do
  @moduledoc """
  Provides struct and type for a ProjectRateLimitUpdateRequest
  """

  @type t :: %__MODULE__{
          batch_1_day_max_input_tokens: integer | nil,
          max_audio_megabytes_per_1_minute: integer | nil,
          max_images_per_1_minute: integer | nil,
          max_requests_per_1_day: integer | nil,
          max_requests_per_1_minute: integer | nil,
          max_tokens_per_1_minute: integer | nil
        }

  defstruct [
    :batch_1_day_max_input_tokens,
    :max_audio_megabytes_per_1_minute,
    :max_images_per_1_minute,
    :max_requests_per_1_day,
    :max_requests_per_1_minute,
    :max_tokens_per_1_minute
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batch_1_day_max_input_tokens: :integer,
      max_audio_megabytes_per_1_minute: :integer,
      max_images_per_1_minute: :integer,
      max_requests_per_1_day: :integer,
      max_requests_per_1_minute: :integer,
      max_tokens_per_1_minute: :integer
    ]
  end
end
