defmodule OpenAI.CreateTranscriptionRequest do
  @moduledoc """
  Provides struct and type for a CreateTranscriptionRequest
  """

  @type t :: %__MODULE__{
          file: binary,
          language: String.t() | nil,
          model: String.t(),
          prompt: String.t() | nil,
          response_format: String.t() | nil,
          temperature: number | nil,
          "timestamp_granularities[]": [String.t()] | nil
        }

  defstruct [
    :file,
    :language,
    :model,
    :prompt,
    :response_format,
    :temperature,
    :"timestamp_granularities[]"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file: {:string, "binary"},
      language: :string,
      model: {:union, [:string, const: "whisper-1"]},
      prompt: :string,
      response_format: {:enum, ["json", "text", "srt", "verbose_json", "vtt"]},
      temperature: :number,
      "timestamp_granularities[]": [enum: ["word", "segment"]]
    ]
  end
end
