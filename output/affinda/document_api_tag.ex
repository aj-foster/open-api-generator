defmodule DocumentAPITag do
  @moduledoc """
  Provides API endpoints related to document api tag
  """

  @default_client Client

  @doc """
  Add a tag to documents

  Add a tag to documents.
  Tags are used to group documents together.
  Tags can be used to filter documents.

  """
  @spec batch_add_tag(BatchAddTagRequest.t(), keyword) :: :ok | {:error, RequestError.t()}
  def batch_add_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPITag, :batch_add_tag},
      url: "/v3/documents/batch_add_tag",
      body: body,
      method: :post,
      request: [{"application/json", {BatchAddTagRequest, :t}}],
      response: [
        {204, :null},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a tag from documents

  Remove a tag from documents.
  """
  @spec batch_remove_tag(BatchRemoveTagRequest.t(), keyword) :: :ok | {:error, RequestError.t()}
  def batch_remove_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPITag, :batch_remove_tag},
      url: "/v3/documents/batch_remove_tag",
      body: body,
      method: :post,
      request: [{"application/json", {BatchRemoveTagRequest, :t}}],
      response: [
        {204, :null},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a tag

  Create a tag
  """
  @spec create_tag(TagCreate.t(), keyword) :: {:ok, Tag.t()} | {:error, RequestError.t()}
  def create_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPITag, :create_tag},
      url: "/v3/tags",
      body: body,
      method: :post,
      request: [{"application/json", {TagCreate, :t}}],
      response: [
        {201, {Tag, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an tag

  Deletes the specified tag from the database.
  """
  @spec delete_tag(integer, keyword) :: :ok | {:error, RequestError.t()}
  def delete_tag(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPITag, :delete_tag},
      url: "/v3/tags/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get list of all tags

  Returns your tags.

  ## Options

    * `limit`: The numbers of results to return.
    * `offset`: The number of documents to skip before starting to collect the result set.
    * `workspace`: Filter by workspace.

  """
  @spec get_all_tags(keyword) :: {:ok, [Tag.t()]} | {:error, RequestError.t()}
  def get_all_tags(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :workspace])

    client.request(%{
      args: [],
      call: {DocumentAPITag, :get_all_tags},
      url: "/v3/tags",
      method: :get,
      query: query,
      response: [
        {200, [{Tag, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific tag

  Return a specific tag.
  """
  @spec get_tag(integer, keyword) :: {:ok, Tag.t()} | {:error, RequestError.t()}
  def get_tag(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPITag, :get_tag},
      url: "/v3/tags/#{id}",
      method: :get,
      response: [
        {200, {Tag, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a tag

  Update data of an tag.
  """
  @spec update_tag(integer, TagUpdate.t(), keyword) :: {:ok, Tag.t()} | {:error, RequestError.t()}
  def update_tag(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {DocumentAPITag, :update_tag},
      url: "/v3/tags/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {TagUpdate, :t}}],
      response: [
        {200, {Tag, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
