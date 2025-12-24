defmodule OpenAI.Completions do
  @moduledoc """
  Provides API endpoint related to completions
  """

  @default_client OpenAI.Client

  @doc """
  Creates a completion for the provided prompt and parameters.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_completion(body :: OpenAI.CreateCompletionRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.CreateCompletionResponse.t()} | :error
  def create_completion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Completions, :create_completion},
      url: "/completions",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateCompletionRequest, :t}}],
      response: [{200, {OpenAI.CreateCompletionResponse, :t}}],
      opts: opts
    })
  end
end
