defmodule OpenAI.Chat do
  @moduledoc """
  Provides API endpoints related to chat
  """

  @default_client OpenAI.Client

  @doc """
  **Starting a new project?** We recommend trying [Responses](/docs/api-reference/responses) 
  to take advantage of the latest OpenAI platform features. Compare
  [Chat Completions with Responses](/docs/guides/responses-vs-chat-completions?api-mode=responses).

  ---

  Creates a model response for the given chat conversation. Learn more in the
  [text generation](/docs/guides/text-generation), [vision](/docs/guides/vision),
  and [audio](/docs/guides/audio) guides.

  Parameter support can differ depending on the model used to generate the
  response, particularly for newer reasoning models. Parameters that are only
  supported for reasoning models are noted below. For the current state of 
  unsupported parameters in reasoning models, 
  [refer to the reasoning guide](/docs/guides/reasoning).

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_chat_completion(body :: OpenAI.CreateChatCompletionRequest.t(), opts :: keyword) ::
          {:ok,
           OpenAI.CreateChatCompletionResponse.t() | OpenAI.CreateChatCompletionStreamResponse.t()}
          | :error
  def create_chat_completion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Chat, :create_chat_completion},
      url: "/chat/completions",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateChatCompletionRequest, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAI.CreateChatCompletionResponse, :t},
            {OpenAI.CreateChatCompletionStreamResponse, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a stored chat completion. Only Chat Completions that have been
  created with the `store` parameter set to `true` can be deleted.

  """
  @spec delete_chat_completion(completion_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.ChatCompletionDeleted.t()} | :error
  def delete_chat_completion(completion_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [completion_id: completion_id],
      call: {OpenAI.Chat, :delete_chat_completion},
      url: "/chat/completions/#{completion_id}",
      method: :delete,
      response: [{200, {OpenAI.ChatCompletionDeleted, :t}}],
      opts: opts
    })
  end

  @doc """
  Get a stored chat completion. Only Chat Completions that have been created
  with the `store` parameter set to `true` will be returned.

  """
  @spec get_chat_completion(completion_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.CreateChatCompletionResponse.t()} | :error
  def get_chat_completion(completion_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [completion_id: completion_id],
      call: {OpenAI.Chat, :get_chat_completion},
      url: "/chat/completions/#{completion_id}",
      method: :get,
      response: [{200, {OpenAI.CreateChatCompletionResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get the messages in a stored chat completion. Only Chat Completions that
  have been created with the `store` parameter set to `true` will be
  returned.

  ## Options

    * `after`: Identifier for the last message from the previous pagination request.
    * `limit`: Number of messages to retrieve.
    * `order`: Sort order for messages by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.

  """
  @spec get_chat_completion_messages(completion_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.ChatCompletionMessageList.t()} | :error
  def get_chat_completion_messages(completion_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :order])

    client.request(%{
      args: [completion_id: completion_id],
      call: {OpenAI.Chat, :get_chat_completion_messages},
      url: "/chat/completions/#{completion_id}/messages",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ChatCompletionMessageList, :t}}],
      opts: opts
    })
  end

  @doc """
  List stored Chat Completions. Only Chat Completions that have been stored
  with the `store` parameter set to `true` will be returned.

  ## Options

    * `model`: The model used to generate the Chat Completions.
    * `metadata`: A list of metadata keys to filter the Chat Completions by. Example:
      
      `metadata[key1]=value1&metadata[key2]=value2`
      
    * `after`: Identifier for the last chat completion from the previous pagination request.
    * `limit`: Number of Chat Completions to retrieve.
    * `order`: Sort order for Chat Completions by timestamp. Use `asc` for ascending order or `desc` for descending order. Defaults to `asc`.

  """
  @spec list_chat_completions(opts :: keyword) :: {:ok, OpenAI.ChatCompletionList.t()} | :error
  def list_chat_completions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :metadata, :model, :order])

    client.request(%{
      args: [],
      call: {OpenAI.Chat, :list_chat_completions},
      url: "/chat/completions",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ChatCompletionList, :t}}],
      opts: opts
    })
  end

  @doc """
  Modify a stored chat completion. Only Chat Completions that have been
  created with the `store` parameter set to `true` can be modified. Currently,
  the only supported modification is to update the `metadata` field.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_chat_completion(completion_id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, OpenAI.CreateChatCompletionResponse.t()} | :error
  def update_chat_completion(completion_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [completion_id: completion_id, body: body],
      call: {OpenAI.Chat, :update_chat_completion},
      url: "/chat/completions/#{completion_id}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {OpenAI.CreateChatCompletionResponse, :t}}],
      opts: opts
    })
  end
end
