defmodule Collections do
  @moduledoc """
  Provides API endpoints related to collections
  """

  @default_client Client

  @doc """
  Create a new collection

  When a collection is created, we give it a name and describe the fields that will be indexed from the documents added to the collection.
  """
  @spec create_collection(CollectionSchema.t(), keyword) ::
          {:ok, CollectionResponse.t()} | {:error, ApiResponse.t()}
  def create_collection(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Collections, :create_collection},
      url: "/collections",
      body: body,
      method: :post,
      request: [{"application/json", {CollectionSchema, :t}}],
      response: [
        {201, {CollectionResponse, :t}},
        {400, {ApiResponse, :t}},
        {409, {ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an alias
  """
  @spec delete_alias(String.t(), keyword) ::
          {:ok, CollectionAlias.t()} | {:error, ApiResponse.t()}
  def delete_alias(aliasName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName],
      call: {Collections, :delete_alias},
      url: "/aliases/#{aliasName}",
      method: :delete,
      response: [{200, {CollectionAlias, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a collection

  Permanently drops a collection. This action cannot be undone. For large collections, this might have an impact on read latencies.
  """
  @spec delete_collection(String.t(), keyword) ::
          {:ok, CollectionResponse.t()} | {:error, ApiResponse.t()}
  def delete_collection(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Collections, :delete_collection},
      url: "/collections/#{collectionName}",
      method: :delete,
      response: [{200, {CollectionResponse, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve an alias

  Find out which collection an alias points to by fetching it
  """
  @spec get_alias(String.t(), keyword) :: {:ok, CollectionAlias.t()} | {:error, ApiResponse.t()}
  def get_alias(aliasName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName],
      call: {Collections, :get_alias},
      url: "/aliases/#{aliasName}",
      method: :get,
      response: [{200, {CollectionAlias, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all aliases

  List all aliases and the corresponding collections that they map to.
  """
  @spec get_aliases(keyword) :: {:ok, CollectionAliasesResponse.t()} | :error
  def get_aliases(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Collections, :get_aliases},
      url: "/aliases",
      method: :get,
      response: [{200, {CollectionAliasesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a single collection

  Retrieve the details of a collection, given its name.
  """
  @spec get_collection(String.t(), keyword) ::
          {:ok, CollectionResponse.t()} | {:error, ApiResponse.t()}
  def get_collection(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Collections, :get_collection},
      url: "/collections/#{collectionName}",
      method: :get,
      response: [{200, {CollectionResponse, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collections

  Returns a summary of all your collections. The collections are returned sorted by creation date, with the most recent collections appearing first.
  """
  @spec get_collections(keyword) :: {:ok, [CollectionResponse.t()]} | :error
  def get_collections(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Collections, :get_collections},
      url: "/collections",
      method: :get,
      response: [{200, [{CollectionResponse, :t}]}],
      opts: opts
    })
  end

  @doc """
  Update a collection

  Update a collection's schema to modify the fields and their types.
  """
  @spec update_collection(String.t(), CollectionUpdateSchema.t(), keyword) ::
          {:ok, CollectionUpdateSchema.t()} | {:error, ApiResponse.t()}
  def update_collection(collectionName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, body: body],
      call: {Collections, :update_collection},
      url: "/collections/#{collectionName}",
      body: body,
      method: :patch,
      request: [{"application/json", {CollectionUpdateSchema, :t}}],
      response: [
        {200, {CollectionUpdateSchema, :t}},
        {400, {ApiResponse, :t}},
        {404, {ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update a collection alias

  Create or update a collection alias. An alias is a virtual collection name that points to a real collection. If you're familiar with symbolic links on Linux, it's very similar to that. Aliases are useful when you want to reindex your data in the background on a new collection and switch your application to it without any changes to your code.
  """
  @spec upsert_alias(String.t(), CollectionAliasSchema.t(), keyword) ::
          {:ok, CollectionAlias.t()} | {:error, ApiResponse.t()}
  def upsert_alias(aliasName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName, body: body],
      call: {Collections, :upsert_alias},
      url: "/aliases/#{aliasName}",
      body: body,
      method: :put,
      request: [{"application/json", {CollectionAliasSchema, :t}}],
      response: [{200, {CollectionAlias, :t}}, {400, {ApiResponse, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end
end
