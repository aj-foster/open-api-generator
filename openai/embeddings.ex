defmodule Embeddings do
  @moduledoc """
  Provides API endpoint related to embeddings
  """

  @default_client Client

  @doc """
  Creates an embedding vector representing the input text.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_embedding(body :: CreateEmbeddingRequest.t(), opts :: keyword) ::
          {:ok, CreateEmbeddingResponse.t()} | :error
  def create_embedding(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Embeddings, :create_embedding},
      url: "/embeddings",
      body: body,
      method: :post,
      request: [{"application/json", {CreateEmbeddingRequest, :t}}],
      response: [{200, {CreateEmbeddingResponse, :t}}],
      opts: opts
    })
  end
end
