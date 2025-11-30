defmodule OpenAI.Audio do
  @moduledoc """
  Provides API endpoints related to audio
  """

  @default_client OpenAI.Client

  @doc """
  Generates audio from the input text.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_speech(body :: OpenAI.CreateSpeechRequest.t(), opts :: keyword) ::
          {:ok, binary} | :error
  def create_speech(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Audio, :create_speech},
      url: "/audio/speech",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateSpeechRequest, :t}}],
      response: [{200, {:string, "binary"}}],
      opts: opts
    })
  end

  @doc """
  Transcribes audio into the input language.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_transcription(body :: OpenAI.CreateTranscriptionRequest.t(), opts :: keyword) ::
          {:ok,
           OpenAI.CreateTranscriptionResponseJson.t()
           | OpenAI.CreateTranscriptionResponseVerboseJson.t()}
          | :error
  def create_transcription(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Audio, :create_transcription},
      url: "/audio/transcriptions",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAI.CreateTranscriptionRequest, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAI.CreateTranscriptionResponseJson, :t},
            {OpenAI.CreateTranscriptionResponseVerboseJson, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Translates audio into English.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec create_translation(body :: OpenAI.CreateTranslationRequest.t(), opts :: keyword) ::
          {:ok,
           OpenAI.CreateTranslationResponseJson.t()
           | OpenAI.CreateTranslationResponseVerboseJson.t()}
          | :error
  def create_translation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Audio, :create_translation},
      url: "/audio/translations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OpenAI.CreateTranslationRequest, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAI.CreateTranslationResponseJson, :t},
            {OpenAI.CreateTranslationResponseVerboseJson, :t}
          ]}}
      ],
      opts: opts
    })
  end
end
