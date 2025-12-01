defmodule OpenAI.ProjectRateLimit do
  @moduledoc """
  Provides struct and type for a ProjectRateLimit
  """

  @type t :: %__MODULE__{
          batch_1_day_max_input_tokens: integer | nil,
          id: String.t(),
          max_audio_megabytes_per_1_minute: integer | nil,
          max_images_per_1_minute: integer | nil,
          max_requests_per_1_day: integer | nil,
          max_requests_per_1_minute: integer,
          max_tokens_per_1_minute: integer,
          model: String.t(),
          object: String.t()
        }

  defstruct [
    :batch_1_day_max_input_tokens,
    :id,
    :max_audio_megabytes_per_1_minute,
    :max_images_per_1_minute,
    :max_requests_per_1_day,
    :max_requests_per_1_minute,
    :max_tokens_per_1_minute,
    :model,
    :object
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      batch_1_day_max_input_tokens: :integer,
      id: :string,
      max_audio_megabytes_per_1_minute: :integer,
      max_images_per_1_minute: :integer,
      max_requests_per_1_day: :integer,
      max_requests_per_1_minute: :integer,
      max_tokens_per_1_minute: :integer,
      model: :string,
      object: {:const, "project.rate_limit"}
    ]
  end
end
