defmodule VectorStores do
  @moduledoc """
  Provides API endpoints related to vector stores
  """

  @default_client Client

  @doc """
  Cancel a vector store file batch. This attempts to cancel the processing of files in this batch as soon as possible.
  """
  @spec cancel_vector_store_file_batch(
          vector_store_id :: String.t(),
          batch_id :: String.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileBatchObject.t()} | :error
  def cancel_vector_store_file_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {VectorStores, :cancel_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}/cancel",
      method: :post,
      response: [{200, {VectorStoreFileBatchObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_vector_store(body :: CreateVectorStoreRequest.t(), opts :: keyword) ::
          {:ok, VectorStoreObject.t()} | :error
  def create_vector_store(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {VectorStores, :create_vector_store},
      url: "/vector_stores",
      body: body,
      method: :post,
      request: [{"application/json", {CreateVectorStoreRequest, :t}}],
      response: [{200, {VectorStoreObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store file by attaching a [File](/docs/api-reference/files) to a [vector store](/docs/api-reference/vector-stores/object).

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_vector_store_file(
          vector_store_id :: String.t(),
          body :: CreateVectorStoreFileRequest.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileObject.t()} | :error
  def create_vector_store_file(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {VectorStores, :create_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files",
      body: body,
      method: :post,
      request: [{"application/json", {CreateVectorStoreFileRequest, :t}}],
      response: [{200, {VectorStoreFileObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Create a vector store file batch.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_vector_store_file_batch(
          vector_store_id :: String.t(),
          body :: CreateVectorStoreFileBatchRequest.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileBatchObject.t()} | :error
  def create_vector_store_file_batch(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {VectorStores, :create_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches",
      body: body,
      method: :post,
      request: [{"application/json", {CreateVectorStoreFileBatchRequest, :t}}],
      response: [{200, {VectorStoreFileBatchObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a vector store.
  """
  @spec delete_vector_store(vector_store_id :: String.t(), opts :: keyword) ::
          {:ok, DeleteVectorStoreResponse.t()} | :error
  def delete_vector_store(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {VectorStores, :delete_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      method: :delete,
      response: [{200, {DeleteVectorStoreResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a vector store file. This will remove the file from the vector store but the file itself will not be deleted. To delete the file, use the [delete file](/docs/api-reference/files/delete) endpoint.
  """
  @spec delete_vector_store_file(
          vector_store_id :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: {:ok, DeleteVectorStoreFileResponse.t()} | :error
  def delete_vector_store_file(vector_store_id, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id],
      call: {VectorStores, :delete_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}",
      method: :delete,
      response: [{200, {DeleteVectorStoreFileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store.
  """
  @spec get_vector_store(vector_store_id :: String.t(), opts :: keyword) ::
          {:ok, VectorStoreObject.t()} | :error
  def get_vector_store(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {VectorStores, :get_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      method: :get,
      response: [{200, {VectorStoreObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store file.
  """
  @spec get_vector_store_file(
          vector_store_id :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileObject.t()} | :error
  def get_vector_store_file(vector_store_id, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id],
      call: {VectorStores, :get_vector_store_file},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}",
      method: :get,
      response: [{200, {VectorStoreFileObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a vector store file batch.
  """
  @spec get_vector_store_file_batch(
          vector_store_id :: String.t(),
          batch_id :: String.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileBatchObject.t()} | :error
  def get_vector_store_file_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {VectorStores, :get_vector_store_file_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}",
      method: :get,
      response: [{200, {VectorStoreFileBatchObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector store files in a batch.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      
    * `filter`: Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.

  """
  @spec list_files_in_vector_store_batch(
          vector_store_id :: String.t(),
          batch_id :: String.t(),
          opts :: keyword
        ) :: {:ok, ListVectorStoreFilesResponse.t()} | :error
  def list_files_in_vector_store_batch(vector_store_id, batch_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :filter, :limit, :order])

    client.request(%{
      args: [vector_store_id: vector_store_id, batch_id: batch_id],
      call: {VectorStores, :list_files_in_vector_store_batch},
      url: "/vector_stores/#{vector_store_id}/file_batches/#{batch_id}/files",
      method: :get,
      query: query,
      response: [{200, {ListVectorStoreFilesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector store files.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      
    * `filter`: Filter by file status. One of `in_progress`, `completed`, `failed`, `cancelled`.

  """
  @spec list_vector_store_files(vector_store_id :: String.t(), opts :: keyword) ::
          {:ok, ListVectorStoreFilesResponse.t()} | :error
  def list_vector_store_files(vector_store_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :filter, :limit, :order])

    client.request(%{
      args: [vector_store_id: vector_store_id],
      call: {VectorStores, :list_vector_store_files},
      url: "/vector_stores/#{vector_store_id}/files",
      method: :get,
      query: query,
      response: [{200, {ListVectorStoreFilesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of vector stores.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `order`: Sort order by the `created_at` timestamp of the objects. `asc` for ascending order and `desc` for descending order.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_vector_stores(opts :: keyword) :: {:ok, ListVectorStoresResponse.t()} | :error
  def list_vector_stores(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :before, :limit, :order])

    client.request(%{
      args: [],
      call: {VectorStores, :list_vector_stores},
      url: "/vector_stores",
      method: :get,
      query: query,
      response: [{200, {ListVectorStoresResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a vector store.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec modify_vector_store(
          vector_store_id :: String.t(),
          body :: UpdateVectorStoreRequest.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreObject.t()} | :error
  def modify_vector_store(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {VectorStores, :modify_vector_store},
      url: "/vector_stores/#{vector_store_id}",
      body: body,
      method: :post,
      request: [{"application/json", {UpdateVectorStoreRequest, :t}}],
      response: [{200, {VectorStoreObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve the parsed contents of a vector store file.
  """
  @spec retrieve_vector_store_file_content(
          vector_store_id :: String.t(),
          file_id :: String.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileContentResponse.t()} | :error
  def retrieve_vector_store_file_content(vector_store_id, file_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id],
      call: {VectorStores, :retrieve_vector_store_file_content},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}/content",
      method: :get,
      response: [{200, {VectorStoreFileContentResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Search a vector store for relevant chunks based on a query and file attributes filter.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec search_vector_store(
          vector_store_id :: String.t(),
          body :: VectorStoreSearchRequest.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreSearchResultsPage.t()} | :error
  def search_vector_store(vector_store_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, body: body],
      call: {VectorStores, :search_vector_store},
      url: "/vector_stores/#{vector_store_id}/search",
      body: body,
      method: :post,
      request: [{"application/json", {VectorStoreSearchRequest, :t}}],
      response: [{200, {VectorStoreSearchResultsPage, :t}}],
      opts: opts
    })
  end

  @doc """
  Update attributes on a vector store file.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_vector_store_file_attributes(
          vector_store_id :: String.t(),
          file_id :: String.t(),
          body :: UpdateVectorStoreFileAttributesRequest.t(),
          opts :: keyword
        ) :: {:ok, VectorStoreFileObject.t()} | :error
  def update_vector_store_file_attributes(vector_store_id, file_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [vector_store_id: vector_store_id, file_id: file_id, body: body],
      call: {VectorStores, :update_vector_store_file_attributes},
      url: "/vector_stores/#{vector_store_id}/files/#{file_id}",
      body: body,
      method: :post,
      request: [{"application/json", {UpdateVectorStoreFileAttributesRequest, :t}}],
      response: [{200, {VectorStoreFileObject, :t}}],
      opts: opts
    })
  end
end
