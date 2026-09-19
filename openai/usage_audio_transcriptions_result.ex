defmodule OpenAI.UsageAudioTranscriptionsResult do
  @moduledoc """
  Provides struct and type for a UsageAudioTranscriptionsResult
  """

  @type t :: %__MODULE__{
          api_key_id: String.t() | nil,
          model: String.t() | nil,
          num_model_requests: integer,
          object: String.t(),
          project_id: String.t() | nil,
          seconds: integer,
          user_id: String.t() | nil
        }

  defstruct [:api_key_id, :model, :num_model_requests, :object, :project_id, :seconds, :user_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :string,
      model: :string,
      num_model_requests: :integer,
      object: {:const, "organization.usage.audio_transcriptions.result"},
      project_id: :string,
      seconds: :integer,
      user_id: :string
    ]
  end
end
