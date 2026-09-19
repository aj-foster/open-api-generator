defmodule Affinda.DocumentAPITag do
  @moduledoc """
  Provides API endpoints related to document api tag
  """

  @default_client Affinda.Client

  @doc """
  Add a tag to documents

  Add a tag to documents.
  Tags are used to group documents together.
  Tags can be used to filter documents.

  ## Request Body

  **Content Types**: `application/json`

  Specify the tag and the documents to tag
  """
  @spec batch_add_tag(body :: Affinda.BatchAddTagRequest.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def batch_add_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPITag, :batch_add_tag},
      url: "/v3/documents/batch_add_tag",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.BatchAddTagRequest, :t}}],
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Remove a tag from documents

  Remove a tag from documents.

  ## Request Body

  **Content Types**: `application/json`

  Specify the tag and the documents to remove the tag from
  """
  @spec batch_remove_tag(body :: Affinda.BatchRemoveTagRequest.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def batch_remove_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPITag, :batch_remove_tag},
      url: "/v3/documents/batch_remove_tag",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.BatchRemoveTagRequest, :t}}],
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a tag

  Create a tag

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_tag(body :: Affinda.TagCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Tag.t()} | {:error, Affinda.RequestError.t()}
  def create_tag(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPITag, :create_tag},
      url: "/v3/tags",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.TagCreate, :t}}],
      response: [
        {201, {Affinda.Tag, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an tag

  Deletes the specified tag from the database.
  """
  @spec delete_tag(id :: integer, opts :: keyword) :: :ok | {:error, Affinda.RequestError.t()}
  def delete_tag(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPITag, :delete_tag},
      url: "/v3/tags/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
  @spec get_all_tags(opts :: keyword) ::
          {:ok, [Affinda.Tag.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_tags(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :workspace])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPITag, :get_all_tags},
      url: "/v3/tags",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.Tag, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific tag

  Return a specific tag.
  """
  @spec get_tag(id :: integer, opts :: keyword) ::
          {:ok, Affinda.Tag.t()} | {:error, Affinda.RequestError.t()}
  def get_tag(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPITag, :get_tag},
      url: "/v3/tags/#{id}",
      method: :get,
      response: [
        {200, {Affinda.Tag, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a tag

  Update data of an tag.

  ## Request Body

  **Content Types**: `application/json`

  Tag data to update
  """
  @spec update_tag(id :: integer, body :: Affinda.TagUpdate.t(), opts :: keyword) ::
          {:ok, Affinda.Tag.t()} | {:error, Affinda.RequestError.t()}
  def update_tag(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Affinda.DocumentAPITag, :update_tag},
      url: "/v3/tags/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.TagUpdate, :t}}],
      response: [
        {200, {Affinda.Tag, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end
end
