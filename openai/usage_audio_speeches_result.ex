defmodule OpenAI.UsageAudioSpeechesResult do
  @moduledoc """
  Provides struct and type for a UsageAudioSpeechesResult
  """

  @type t :: %__MODULE__{
          api_key_id: String.t() | nil,
          characters: integer,
          model: String.t() | nil,
          num_model_requests: integer,
          object: String.t(),
          project_id: String.t() | nil,
          user_id: String.t() | nil
        }

  defstruct [
    :api_key_id,
    :characters,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :string,
      characters: :integer,
      model: :string,
      num_model_requests: :integer,
      object: {:const, "organization.usage.audio_speeches.result"},
      project_id: :string,
      user_id: :string
    ]
  end
end
