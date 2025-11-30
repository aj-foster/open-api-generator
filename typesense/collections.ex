defmodule Typesense.Collections do
  @moduledoc """
  Provides API endpoints related to collections
  """

  @default_client Typesense.Client

  @doc """
  Create a new collection

  When a collection is created, we give it a name and describe the fields that will be indexed from the documents added to the collection.

  ## Request Body

  **Content Types**: `application/json`

  The collection object to be created
  """
  @spec create_collection(body :: Typesense.CollectionSchema.t(), opts :: keyword) ::
          {:ok, Typesense.CollectionResponse.t()} | {:error, Typesense.ApiResponse.t()}
  def create_collection(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Typesense.Collections, :create_collection},
      url: "/collections",
      body: body,
      method: :post,
      request: [{"application/json", {Typesense.CollectionSchema, :t}}],
      response: [
        {201, {Typesense.CollectionResponse, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {409, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an alias
  """
  @spec delete_alias(aliasName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.CollectionAlias.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_alias(aliasName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName],
      call: {Typesense.Collections, :delete_alias},
      url: "/aliases/#{aliasName}",
      method: :delete,
      response: [{200, {Typesense.CollectionAlias, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a collection

  Permanently drops a collection. This action cannot be undone. For large collections, this might have an impact on read latencies.
  """
  @spec delete_collection(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.CollectionResponse.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_collection(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Collections, :delete_collection},
      url: "/collections/#{collectionName}",
      method: :delete,
      response: [{200, {Typesense.CollectionResponse, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve an alias

  Find out which collection an alias points to by fetching it
  """
  @spec get_alias(aliasName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.CollectionAlias.t()} | {:error, Typesense.ApiResponse.t()}
  def get_alias(aliasName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName],
      call: {Typesense.Collections, :get_alias},
      url: "/aliases/#{aliasName}",
      method: :get,
      response: [{200, {Typesense.CollectionAlias, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all aliases

  List all aliases and the corresponding collections that they map to.
  """
  @spec get_aliases(opts :: keyword) :: {:ok, Typesense.CollectionAliasesResponse.t()} | :error
  def get_aliases(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Collections, :get_aliases},
      url: "/aliases",
      method: :get,
      response: [{200, {Typesense.CollectionAliasesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a single collection

  Retrieve the details of a collection, given its name.
  """
  @spec get_collection(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.CollectionResponse.t()} | {:error, Typesense.ApiResponse.t()}
  def get_collection(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Collections, :get_collection},
      url: "/collections/#{collectionName}",
      method: :get,
      response: [{200, {Typesense.CollectionResponse, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collections

  Returns a summary of all your collections. The collections are returned sorted by creation date, with the most recent collections appearing first.
  """
  @spec get_collections(opts :: keyword) :: {:ok, [Typesense.CollectionResponse.t()]} | :error
  def get_collections(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Collections, :get_collections},
      url: "/collections",
      method: :get,
      response: [{200, [{Typesense.CollectionResponse, :t}]}],
      opts: opts
    })
  end

  @doc """
  Update a collection

  Update a collection's schema to modify the fields and their types.

  ## Request Body

  **Content Types**: `application/json`

  The document object with fields to be updated
  """
  @spec update_collection(
          collectionName :: String.t(),
          body :: Typesense.CollectionUpdateSchema.t(),
          opts :: keyword
        ) :: {:ok, Typesense.CollectionUpdateSchema.t()} | {:error, Typesense.ApiResponse.t()}
  def update_collection(collectionName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, body: body],
      call: {Typesense.Collections, :update_collection},
      url: "/collections/#{collectionName}",
      body: body,
      method: :patch,
      request: [{"application/json", {Typesense.CollectionUpdateSchema, :t}}],
      response: [
        {200, {Typesense.CollectionUpdateSchema, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update a collection alias

  Create or update a collection alias. An alias is a virtual collection name that points to a real collection. If you're familiar with symbolic links on Linux, it's very similar to that. Aliases are useful when you want to reindex your data in the background on a new collection and switch your application to it without any changes to your code.

  ## Request Body

  **Content Types**: `application/json`

  Collection alias to be created/updated
  """
  @spec upsert_alias(
          aliasName :: String.t(),
          body :: Typesense.CollectionAliasSchema.t(),
          opts :: keyword
        ) :: {:ok, Typesense.CollectionAlias.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_alias(aliasName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [aliasName: aliasName, body: body],
      call: {Typesense.Collections, :upsert_alias},
      url: "/aliases/#{aliasName}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.CollectionAliasSchema, :t}}],
      response: [
        {200, {Typesense.CollectionAlias, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end
end
