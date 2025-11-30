defmodule OpenAI.Moderations do
  @moduledoc """
  Provides API endpoint related to moderations
  """

  @default_client OpenAI.Client

  @doc """
  Classifies if text and/or image inputs are potentially harmful. Learn
  more in the [moderation guide](/docs/guides/moderation).

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_moderation(body :: OpenAI.CreateModerationRequest.t(), opts :: keyword) ::
          {:ok, OpenAI.CreateModerationResponse.t()} | :error
  def create_moderation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Moderations, :create_moderation},
      url: "/moderations",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateModerationRequest, :t}}],
      response: [{200, {OpenAI.CreateModerationResponse, :t}}],
      opts: opts
    })
  end
end
