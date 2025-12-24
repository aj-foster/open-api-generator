defmodule OpenAI.UsageCompletionsResult do
  @moduledoc """
  Provides struct and type for a UsageCompletionsResult
  """

  @type t :: %__MODULE__{
          api_key_id: String.t() | nil,
          batch: boolean | nil,
          input_audio_tokens: integer | nil,
          input_cached_tokens: integer | nil,
          input_tokens: integer,
          model: String.t() | nil,
          num_model_requests: integer,
          object: String.t(),
          output_audio_tokens: integer | nil,
          output_tokens: integer,
          project_id: String.t() | nil,
          user_id: String.t() | nil
        }

  defstruct [
    :api_key_id,
    :batch,
    :input_audio_tokens,
    :input_cached_tokens,
    :input_tokens,
    :model,
    :num_model_requests,
    :object,
    :output_audio_tokens,
    :output_tokens,
    :project_id,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :string,
      batch: :boolean,
      input_audio_tokens: :integer,
      input_cached_tokens: :integer,
      input_tokens: :integer,
      model: :string,
      num_model_requests: :integer,
      object: {:const, "organization.usage.completions.result"},
      output_audio_tokens: :integer,
      output_tokens: :integer,
      project_id: :string,
      user_id: :string
    ]
  end
end
