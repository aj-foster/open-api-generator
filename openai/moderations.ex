defmodule Moderations do
  @moduledoc """
  Provides API endpoint related to moderations
  """

  @default_client Client

  @doc """
  Classifies if text and/or image inputs are potentially harmful. Learn
  more in the [moderation guide](/docs/guides/moderation).

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_moderation(body :: CreateModerationRequest.t(), opts :: keyword) ::
          {:ok, CreateModerationResponse.t()} | :error
  def create_moderation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Moderations, :create_moderation},
      url: "/moderations",
      body: body,
      method: :post,
      request: [{"application/json", {CreateModerationRequest, :t}}],
      response: [{200, {CreateModerationResponse, :t}}],
      opts: opts
    })
  end
end
