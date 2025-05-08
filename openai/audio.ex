defmodule Audio do
  @moduledoc """
  Provides API endpoints related to audio
  """

  @default_client Client

  @doc """
  Generates audio from the input text.
  """
  @spec create_speech(body :: CreateSpeechRequest.t(), opts :: keyword) ::
          {:ok, String.t()} | :error
  def create_speech(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Audio, :create_speech},
      url: "/audio/speech",
      body: body,
      method: :post,
      request: [{"application/json", {CreateSpeechRequest, :t}}],
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  Transcribes audio into the input language.
  """
  @spec create_transcription(body :: CreateTranscriptionRequest.t(), opts :: keyword) ::
          {:ok, CreateTranscriptionResponseJson.t() | CreateTranscriptionResponseVerboseJson.t()}
          | :error
  def create_transcription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Audio, :create_transcription},
      url: "/audio/transcriptions",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {CreateTranscriptionRequest, :t}}],
      response: [
        {200,
         {:union,
          [{CreateTranscriptionResponseJson, :t}, {CreateTranscriptionResponseVerboseJson, :t}]}}
      ],
      opts: opts
    })
  end

  @doc """
  Translates audio into English.
  """
  @spec create_translation(body :: CreateTranslationRequest.t(), opts :: keyword) ::
          {:ok, CreateTranslationResponseJson.t() | CreateTranslationResponseVerboseJson.t()}
          | :error
  def create_translation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Audio, :create_translation},
      url: "/audio/translations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {CreateTranslationRequest, :t}}],
      response: [
        {200,
         {:union,
          [{CreateTranslationResponseJson, :t}, {CreateTranslationResponseVerboseJson, :t}]}}
      ],
      opts: opts
    })
  end
end
