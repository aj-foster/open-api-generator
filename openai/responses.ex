defmodule OpenAI.Responses do
  @moduledoc """
  Provides API endpoints related to responses
  """

  @default_client OpenAI.Client

  @doc """
  Creates a model response. Provide [text](/docs/guides/text) or
  [image](/docs/guides/images) inputs to generate [text](/docs/guides/text)
  or [JSON](/docs/guides/structured-outputs) outputs. Have the model call
  your own [custom code](/docs/guides/function-calling) or use built-in
  [tools](/docs/guides/tools) like [web search](/docs/guides/tools-web-search)
  or [file search](/docs/guides/tools-file-search) to use your own data
  as input for the model's response.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_response(body :: OpenAI.CreateResponse.t(), opts :: keyword) ::
          {:ok,
           OpenAI.Response.t()
           | OpenAI.ResponseAudioDeltaEvent.t()
           | OpenAI.ResponseAudioDoneEvent.t()
           | OpenAI.ResponseAudioTranscriptDeltaEvent.t()
           | OpenAI.ResponseAudioTranscriptDoneEvent.t()
           | OpenAI.ResponseCodeInterpreterCallCodeDeltaEvent.t()
           | OpenAI.ResponseCodeInterpreterCallCodeDoneEvent.t()
           | OpenAI.ResponseCodeInterpreterCallCompletedEvent.t()
           | OpenAI.ResponseCodeInterpreterCallInProgressEvent.t()
           | OpenAI.ResponseCodeInterpreterCallInterpretingEvent.t()
           | OpenAI.ResponseCompletedEvent.t()
           | OpenAI.ResponseContentPartAddedEvent.t()
           | OpenAI.ResponseContentPartDoneEvent.t()
           | OpenAI.ResponseCreatedEvent.t()
           | OpenAI.ResponseErrorEvent.t()
           | OpenAI.ResponseFailedEvent.t()
           | OpenAI.ResponseFileSearchCallCompletedEvent.t()
           | OpenAI.ResponseFileSearchCallInProgressEvent.t()
           | OpenAI.ResponseFileSearchCallSearchingEvent.t()
           | OpenAI.ResponseFunctionCallArgumentsDeltaEvent.t()
           | OpenAI.ResponseFunctionCallArgumentsDoneEvent.t()
           | OpenAI.ResponseInProgressEvent.t()
           | OpenAI.ResponseIncompleteEvent.t()
           | OpenAI.ResponseOutputItemAddedEvent.t()
           | OpenAI.ResponseOutputItemDoneEvent.t()
           | OpenAI.ResponseRefusalDeltaEvent.t()
           | OpenAI.ResponseRefusalDoneEvent.t()
           | OpenAI.ResponseTextAnnotationDeltaEvent.t()
           | OpenAI.ResponseTextDeltaEvent.t()
           | OpenAI.ResponseTextDoneEvent.t()
           | OpenAI.ResponseWebSearchCallCompletedEvent.t()
           | OpenAI.ResponseWebSearchCallInProgressEvent.t()
           | OpenAI.ResponseWebSearchCallSearchingEvent.t()}
          | :error
  def create_response(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Responses, :create_response},
      url: "/responses",
      body: body,
      method: :post,
      request: [{"application/json", {OpenAI.CreateResponse, :t}}],
      response: [
        {200,
         {:union,
          [
            {OpenAI.Response, :t},
            {OpenAI.ResponseAudioDeltaEvent, :t},
            {OpenAI.ResponseAudioDoneEvent, :t},
            {OpenAI.ResponseAudioTranscriptDeltaEvent, :t},
            {OpenAI.ResponseAudioTranscriptDoneEvent, :t},
            {OpenAI.ResponseCodeInterpreterCallCodeDeltaEvent, :t},
            {OpenAI.ResponseCodeInterpreterCallCodeDoneEvent, :t},
            {OpenAI.ResponseCodeInterpreterCallCompletedEvent, :t},
            {OpenAI.ResponseCodeInterpreterCallInProgressEvent, :t},
            {OpenAI.ResponseCodeInterpreterCallInterpretingEvent, :t},
            {OpenAI.ResponseCompletedEvent, :t},
            {OpenAI.ResponseContentPartAddedEvent, :t},
            {OpenAI.ResponseContentPartDoneEvent, :t},
            {OpenAI.ResponseCreatedEvent, :t},
            {OpenAI.ResponseErrorEvent, :t},
            {OpenAI.ResponseFailedEvent, :t},
            {OpenAI.ResponseFileSearchCallCompletedEvent, :t},
            {OpenAI.ResponseFileSearchCallInProgressEvent, :t},
            {OpenAI.ResponseFileSearchCallSearchingEvent, :t},
            {OpenAI.ResponseFunctionCallArgumentsDeltaEvent, :t},
            {OpenAI.ResponseFunctionCallArgumentsDoneEvent, :t},
            {OpenAI.ResponseInProgressEvent, :t},
            {OpenAI.ResponseIncompleteEvent, :t},
            {OpenAI.ResponseOutputItemAddedEvent, :t},
            {OpenAI.ResponseOutputItemDoneEvent, :t},
            {OpenAI.ResponseRefusalDeltaEvent, :t},
            {OpenAI.ResponseRefusalDoneEvent, :t},
            {OpenAI.ResponseTextAnnotationDeltaEvent, :t},
            {OpenAI.ResponseTextDeltaEvent, :t},
            {OpenAI.ResponseTextDoneEvent, :t},
            {OpenAI.ResponseWebSearchCallCompletedEvent, :t},
            {OpenAI.ResponseWebSearchCallInProgressEvent, :t},
            {OpenAI.ResponseWebSearchCallSearchingEvent, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Deletes a model response with the given ID.

  """
  @spec delete_response(response_id :: String.t(), opts :: keyword) ::
          :ok | {:error, OpenAI.Error.t()}
  def delete_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAI.Responses, :delete_response},
      url: "/responses/#{response_id}",
      method: :delete,
      response: [{200, :null}, {404, {OpenAI.Error, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a model response with the given ID.

  ## Options

    * `include`: Additional fields to include in the response. See the `include`
      parameter for Response creation above for more information.
      

  """
  @spec get_response(response_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.Response.t()} | :error
  def get_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAI.Responses, :get_response},
      url: "/responses/#{response_id}",
      method: :get,
      query: query,
      response: [{200, {OpenAI.Response, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of input items for a given response.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between
      1 and 100, and the default is 20.
      
    * `order`: The order to return the input items in. Default is `asc`.
      - `asc`: Return the input items in ascending order.
      - `desc`: Return the input items in descending order.
      
    * `after`: An item ID to list items after, used in pagination.
      
    * `before`: An item ID to list items before, used in pagination.
      

  """
  @spec list_input_items(response_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.ResponseItemList.t()} | :error
  def list_input_items(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [response_id: response_id],
      call: {OpenAI.Responses, :list_input_items},
      url: "/responses/#{response_id}/input_items",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ResponseItemList, :t}}],
      opts: opts
    })
  end
end
