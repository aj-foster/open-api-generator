defmodule Completions do
  @moduledoc """
  Provides API endpoint related to completions
  """

  @default_client Client

  @doc """
  Creates a completion for the provided prompt and parameters.
  """
  @spec create_completion(body :: CreateCompletionRequest.t(), opts :: keyword) ::
          {:ok, CreateCompletionResponse.t()} | :error
  def create_completion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Completions, :create_completion},
      url: "/completions",
      body: body,
      method: :post,
      request: [{"application/json", {CreateCompletionRequest, :t}}],
      response: [{200, {CreateCompletionResponse, :t}}],
      opts: opts
    })
  end
end
