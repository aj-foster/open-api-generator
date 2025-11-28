defmodule Responses do
  @moduledoc """
  Provides API endpoints related to responses
  """

  @default_client Client

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
  @spec create_response(body :: CreateResponse.t(), opts :: keyword) ::
          {:ok,
           Response.t()
           | ResponseAudioDeltaEvent.t()
           | ResponseAudioDoneEvent.t()
           | ResponseAudioTranscriptDeltaEvent.t()
           | ResponseAudioTranscriptDoneEvent.t()
           | ResponseCodeInterpreterCallCodeDeltaEvent.t()
           | ResponseCodeInterpreterCallCodeDoneEvent.t()
           | ResponseCodeInterpreterCallCompletedEvent.t()
           | ResponseCodeInterpreterCallInProgressEvent.t()
           | ResponseCodeInterpreterCallInterpretingEvent.t()
           | ResponseCompletedEvent.t()
           | ResponseContentPartAddedEvent.t()
           | ResponseContentPartDoneEvent.t()
           | ResponseCreatedEvent.t()
           | ResponseErrorEvent.t()
           | ResponseFailedEvent.t()
           | ResponseFileSearchCallCompletedEvent.t()
           | ResponseFileSearchCallInProgressEvent.t()
           | ResponseFileSearchCallSearchingEvent.t()
           | ResponseFunctionCallArgumentsDeltaEvent.t()
           | ResponseFunctionCallArgumentsDoneEvent.t()
           | ResponseInProgressEvent.t()
           | ResponseIncompleteEvent.t()
           | ResponseOutputItemAddedEvent.t()
           | ResponseOutputItemDoneEvent.t()
           | ResponseRefusalDeltaEvent.t()
           | ResponseRefusalDoneEvent.t()
           | ResponseTextAnnotationDeltaEvent.t()
           | ResponseTextDeltaEvent.t()
           | ResponseTextDoneEvent.t()
           | ResponseWebSearchCallCompletedEvent.t()
           | ResponseWebSearchCallInProgressEvent.t()
           | ResponseWebSearchCallSearchingEvent.t()}
          | :error
  def create_response(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Responses, :create_response},
      url: "/responses",
      body: body,
      method: :post,
      request: [{"application/json", {CreateResponse, :t}}],
      response: [
        {200,
         {:union,
          [
            {Response, :t},
            {ResponseAudioDeltaEvent, :t},
            {ResponseAudioDoneEvent, :t},
            {ResponseAudioTranscriptDeltaEvent, :t},
            {ResponseAudioTranscriptDoneEvent, :t},
            {ResponseCodeInterpreterCallCodeDeltaEvent, :t},
            {ResponseCodeInterpreterCallCodeDoneEvent, :t},
            {ResponseCodeInterpreterCallCompletedEvent, :t},
            {ResponseCodeInterpreterCallInProgressEvent, :t},
            {ResponseCodeInterpreterCallInterpretingEvent, :t},
            {ResponseCompletedEvent, :t},
            {ResponseContentPartAddedEvent, :t},
            {ResponseContentPartDoneEvent, :t},
            {ResponseCreatedEvent, :t},
            {ResponseErrorEvent, :t},
            {ResponseFailedEvent, :t},
            {ResponseFileSearchCallCompletedEvent, :t},
            {ResponseFileSearchCallInProgressEvent, :t},
            {ResponseFileSearchCallSearchingEvent, :t},
            {ResponseFunctionCallArgumentsDeltaEvent, :t},
            {ResponseFunctionCallArgumentsDoneEvent, :t},
            {ResponseInProgressEvent, :t},
            {ResponseIncompleteEvent, :t},
            {ResponseOutputItemAddedEvent, :t},
            {ResponseOutputItemDoneEvent, :t},
            {ResponseRefusalDeltaEvent, :t},
            {ResponseRefusalDoneEvent, :t},
            {ResponseTextAnnotationDeltaEvent, :t},
            {ResponseTextDeltaEvent, :t},
            {ResponseTextDoneEvent, :t},
            {ResponseWebSearchCallCompletedEvent, :t},
            {ResponseWebSearchCallInProgressEvent, :t},
            {ResponseWebSearchCallSearchingEvent, :t}
          ]}}
      ],
      opts: opts
    })
  end

  @doc """
  Deletes a model response with the given ID.

  """
  @spec delete_response(response_id :: String.t(), opts :: keyword) :: :ok | {:error, Error.t()}
  def delete_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [response_id: response_id],
      call: {Responses, :delete_response},
      url: "/responses/#{response_id}",
      method: :delete,
      response: [{200, :null}, {404, {Error, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a model response with the given ID.

  ## Options

    * `include`: Additional fields to include in the response. See the `include`
      parameter for Response creation above for more information.
      

  """
  @spec get_response(response_id :: String.t(), opts :: keyword) :: {:ok, Response.t()} | :error
  def get_response(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [response_id: response_id],
      call: {Responses, :get_response},
      url: "/responses/#{response_id}",
      method: :get,
      query: query,
      response: [{200, {Response, :t}}],
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
          {:ok, ResponseItemList.t()} | :error
  def list_input_items(response_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [response_id: response_id],
      call: {Responses, :list_input_items},
      url: "/responses/#{response_id}/input_items",
      method: :get,
      query: query,
      response: [{200, {ResponseItemList, :t}}],
      opts: opts
    })
  end
end
