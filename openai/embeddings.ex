defmodule OpenAI.Embeddings do
  @moduledoc """
  Provides API endpoint related to embeddings
  """

  @default_client OpenAI.Client

  @doc """
  Creates an embedding vector representing the input text.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_embedding(body :: OpenAI.CreateEmbeddingRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.CreateEmbeddingResponse.t()} | :error
  def create_embedding(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Embeddings, :create_embedding},
      url: "/embeddings",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateEmbeddingRequest, :t}}],
      response: [{200, {OpenAI.CreateEmbeddingResponse, :t}}],
      opts: opts
    })
  end
end
