defmodule Typesense.Documents do
  @moduledoc """
  Provides API endpoints related to documents
  """

  @default_client Typesense.Client

  @doc """
  Delete a document

  Delete an individual document from a collection by using its ID.
  """
  @spec delete_document(collectionName :: String.t(), documentId :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Typesense.ApiResponse.t()}
  def delete_document(collectionName, documentId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, documentId: documentId],
      call: {Typesense.Documents, :delete_document},
      url: "/collections/#{collectionName}/documents/#{documentId}",
      method: :delete,
      response: [{200, :map}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @type delete_documents_200_json_resp :: %{num_deleted: integer}

  @doc """
  Delete a bunch of documents

  Delete a bunch of documents that match a specific filter condition. Use the `batch_size` parameter to control the number of documents that should deleted at a time. A larger value will speed up deletions, but will impact performance of other operations running on the server.

  ## Options

    * `deleteDocumentsParameters`

  """
  @spec delete_documents(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.Documents.delete_documents_200_json_resp()}
          | {:error, Typesense.ApiResponse.t()}
  def delete_documents(collectionName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:deleteDocumentsParameters])

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Documents, :delete_documents},
      url: "/collections/#{collectionName}/documents",
      method: :delete,
      query: query,
      response: [
        {200, {Typesense.Documents, :delete_documents_200_json_resp}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an override associated with a collection
  """
  @spec delete_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Typesense.Documents, :delete_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :delete,
      response: [{200, {Typesense.SearchOverride, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete a synonym associated with a collection
  """
  @spec delete_search_synonym(
          collectionName :: String.t(),
          synonymId :: String.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchSynonym.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_search_synonym(collectionName, synonymId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, synonymId: synonymId],
      call: {Typesense.Documents, :delete_search_synonym},
      url: "/collections/#{collectionName}/synonyms/#{synonymId}",
      method: :delete,
      response: [{200, {Typesense.SearchSynonym, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Export all documents in a collection

  Export all documents in a collection in JSON lines format.

  ## Options

    * `exportDocumentsParameters`

  """
  @spec export_documents(collectionName :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, Typesense.ApiResponse.t()}
  def export_documents(collectionName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:exportDocumentsParameters])

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Documents, :export_documents},
      url: "/collections/#{collectionName}/documents/export",
      method: :get,
      query: query,
      response: [{200, :string}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retreive a document

  Fetch an individual document from a collection by using its ID.
  """
  @spec get_document(collectionName :: String.t(), documentId :: String.t(), opts :: keyword) ::
          {:ok, map} | {:error, Typesense.ApiResponse.t()}
  def get_document(collectionName, documentId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, documentId: documentId],
      call: {Typesense.Documents, :get_document},
      url: "/collections/#{collectionName}/documents/#{documentId}",
      method: :get,
      response: [{200, :map}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a single search override

  Retrieve the details of a search override, given its id.
  """
  @spec get_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | :error
  def get_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Typesense.Documents, :get_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :get,
      response: [{200, {Typesense.SearchOverride, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collection overrides
  """
  @spec get_search_overrides(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.SearchOverridesResponse.t()} | :error
  def get_search_overrides(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Documents, :get_search_overrides},
      url: "/collections/#{collectionName}/overrides",
      method: :get,
      response: [{200, {Typesense.SearchOverridesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieve a single search synonym

  Retrieve the details of a search synonym, given its id.
  """
  @spec get_search_synonym(collectionName :: String.t(), synonymId :: String.t(), opts :: keyword) ::
          {:ok, Typesense.SearchSynonym.t()} | {:error, Typesense.ApiResponse.t()}
  def get_search_synonym(collectionName, synonymId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, synonymId: synonymId],
      call: {Typesense.Documents, :get_search_synonym},
      url: "/collections/#{collectionName}/synonyms/#{synonymId}",
      method: :get,
      response: [{200, {Typesense.SearchSynonym, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collection synonyms
  """
  @spec get_search_synonyms(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.SearchSynonymsResponse.t()} | {:error, Typesense.ApiResponse.t()}
  def get_search_synonyms(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Documents, :get_search_synonyms},
      url: "/collections/#{collectionName}/synonyms",
      method: :get,
      response: [
        {200, {Typesense.SearchSynonymsResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Import documents into a collection

  The documents to be imported must be formatted in a newline delimited JSON structure. You can feed the output file from a Typesense export operation directly as import.

  ## Options

    * `importDocumentsParameters`

  ## Request Body

  **Content Types**: `application/octet-stream`

  The json array of documents or the JSONL file to import
  """
  @spec import_documents(collectionName :: String.t(), body :: String.t(), opts :: keyword) ::
          {:ok, String.t()} | {:error, Typesense.ApiResponse.t()}
  def import_documents(collectionName, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:importDocumentsParameters])

    client.request(%{
      args: [collectionName: collectionName, body: body],
      call: {Typesense.Documents, :import_documents},
      url: "/collections/#{collectionName}/documents/import",
      body: body,
      method: :post,
      query: query,
      request: [{"application/octet-stream", :string}],
      response: [
        {200, :string},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Index a document

  A document to be indexed in a given collection must conform to the schema of the collection.

  ## Options

    * `action`: Additional action to perform

  ## Request Body

  **Content Types**: `application/json`

  The document object to be indexed
  """
  @spec index_document(collectionName :: String.t(), body :: map, opts :: keyword) ::
          {:ok, map} | {:error, Typesense.ApiResponse.t()}
  def index_document(collectionName, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:action])

    client.request(%{
      args: [collectionName: collectionName, body: body],
      call: {Typesense.Documents, :index_document},
      url: "/collections/#{collectionName}/documents",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [{201, :map}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  send multiple search requests in a single HTTP request

  This is especially useful to avoid round-trip network latencies incurred otherwise if each of these requests are sent in separate HTTP requests. You can also use this feature to do a federated search across multiple collections in a single HTTP request.

  ## Options

    * `multiSearchParameters`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec multi_search(body :: Typesense.MultiSearchSearchesParameter.t(), opts :: keyword) ::
          {:ok, Typesense.MultiSearchResult.t()} | {:error, Typesense.ApiResponse.t()}
  def multi_search(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:multiSearchParameters])

    client.request(%{
      args: [body: body],
      call: {Typesense.Documents, :multi_search},
      url: "/multi_search",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {Typesense.MultiSearchSearchesParameter, :t}}],
      response: [{200, {Typesense.MultiSearchResult, :t}}, {400, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Search for documents in a collection

  Search for documents in a collection that match the search criteria.

  ## Options

    * `searchParameters`

  """
  @spec search_collection(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.SearchResult.t()} | {:error, Typesense.ApiResponse.t()}
  def search_collection(collectionName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:searchParameters])

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Documents, :search_collection},
      url: "/collections/#{collectionName}/documents/search",
      method: :get,
      query: query,
      response: [
        {200, {Typesense.SearchResult, :t}},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update a document

  Update an individual document from a collection by using its ID. The update can be partial.

  ## Request Body

  **Content Types**: `application/json`

  The document object with fields to be updated
  """
  @spec update_document(
          collectionName :: String.t(),
          documentId :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, map} | {:error, Typesense.ApiResponse.t()}
  def update_document(collectionName, documentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, documentId: documentId, body: body],
      call: {Typesense.Documents, :update_document},
      url: "/collections/#{collectionName}/documents/#{documentId}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, :map}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @type update_documents_200_json_resp :: %{num_updated: integer}

  @doc """
  Update documents with conditional query

  The filter_by query parameter is used to filter to specify a condition against which the documents are matched. The request body contains the fields that should be updated for any documents that match the filter condition. This endpoint is only available if the Typesense server is version `0.25.0.rc12` or later.

  ## Options

    * `updateDocumentsParameters`

  ## Request Body

  **Content Types**: `application/json`

  The document fields to be updated
  """
  @spec update_documents(collectionName :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Typesense.Documents.update_documents_200_json_resp()}
          | {:error, Typesense.ApiResponse.t()}
  def update_documents(collectionName, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:updateDocumentsParameters])

    client.request(%{
      args: [collectionName: collectionName, body: body],
      call: {Typesense.Documents, :update_documents},
      url: "/collections/#{collectionName}/documents",
      body: body,
      method: :patch,
      query: query,
      request: [{"application/json", :map}],
      response: [
        {200, {Typesense.Documents, :update_documents_200_json_resp}},
        {400, {Typesense.ApiResponse, :t}},
        {404, {Typesense.ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or update an override to promote certain documents over others

  Create or update an override to promote certain documents over others. Using overrides, you can include or exclude specific documents for a given query.

  ## Request Body

  **Content Types**: `application/json`

  The search override object to be created/updated
  """
  @spec upsert_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          body :: Typesense.SearchOverrideSchema.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_search_override(collectionName, overrideId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId, body: body],
      call: {Typesense.Documents, :upsert_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.SearchOverrideSchema, :t}}],
      response: [{200, {Typesense.SearchOverride, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create or update a synonym

  Create or update a synonym  to define search terms that should be considered equivalent.

  ## Request Body

  **Content Types**: `application/json`

  The search synonym object to be created/updated
  """
  @spec upsert_search_synonym(
          collectionName :: String.t(),
          synonymId :: String.t(),
          body :: Typesense.SearchSynonymSchema.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchSynonym.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_search_synonym(collectionName, synonymId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, synonymId: synonymId, body: body],
      call: {Typesense.Documents, :upsert_search_synonym},
      url: "/collections/#{collectionName}/synonyms/#{synonymId}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.SearchSynonymSchema, :t}}],
      response: [{200, {Typesense.SearchSynonym, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_documents_200_json_resp) do
    [num_deleted: :integer]
  end

  def __fields__(:update_documents_200_json_resp) do
    [num_updated: :integer]
  end
end
