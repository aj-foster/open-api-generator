defmodule Affinda.SearchMatchAPIIndexing do
  @moduledoc """
  Provides API endpoints related to search match api indexing
  """

  @default_client Affinda.Client

  @doc """
  Create a new index

  Create an index for the search tool

  ## Request Body

  **Content Types**: `application/json`

  Index to create
  """
  @spec create_index(body :: Affinda.IndexCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Index.t()} | {:error, Affinda.RequestError.t()}
  def create_index(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.SearchMatchAPIIndexing, :create_index},
      url: "/v3/index",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.IndexCreate, :t}}],
      response: [
        {201, {Affinda.Index, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type create_index_document_201_json_resp :: %{document: String.t() | nil}

  @doc """
  Index a new document

  Create an indexed document for the search tool

  ## Request Body

  **Content Types**: `application/json`

  Document to index
  """
  @spec create_index_document(name :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Affinda.SearchMatchAPIIndexing.create_index_document_201_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def create_index_document(name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, body: body],
      call: {Affinda.SearchMatchAPIIndexing, :create_index_document},
      url: "/v3/index/#{name}/documents",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, {Affinda.SearchMatchAPIIndexing, :create_index_document_201_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an index

  Deletes the specified index from the database
  """
  @spec delete_index(name :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_index(name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name],
      call: {Affinda.SearchMatchAPIIndexing, :delete_index},
      url: "/v3/index/#{name}",
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
  Delete an indexed document

  Delete the specified indexed document from the database
  """
  @spec delete_index_document(name :: String.t(), identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_index_document(name, identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, identifier: identifier],
      call: {Affinda.SearchMatchAPIIndexing, :delete_index_document},
      url: "/v3/index/#{name}/documents/#{identifier}",
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

  @type get_all_index_documents_200_json_resp :: %{
          count: integer | nil,
          next: String.t() | nil,
          previous: String.t() | nil,
          results:
            [Affinda.SearchMatchAPIIndexing.get_all_index_documents_200_json_resp_results()] | nil
        }

  @type get_all_index_documents_200_json_resp_results :: %{document: String.t() | nil}

  @doc """
  Get indexed documents for a specific index

  Returns all the indexed documents for that index

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.

  """
  @spec get_all_index_documents(name :: String.t(), opts :: keyword) ::
          {:ok, Affinda.SearchMatchAPIIndexing.get_all_index_documents_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_index_documents(name, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset])

    client.request(%{
      args: [name: name],
      call: {Affinda.SearchMatchAPIIndexing, :get_all_index_documents},
      url: "/v3/index/#{name}/documents",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.SearchMatchAPIIndexing, :get_all_index_documents_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_indexes_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.Index.t()]
        }

  @doc """
  Get list of all indexes

  Returns all the indexes

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `document_type`: Filter indices by a document type

  """
  @spec get_all_indexes(opts :: keyword) ::
          {:ok, Affinda.SearchMatchAPIIndexing.get_all_indexes_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_indexes(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:document_type, :limit, :offset])

    client.request(%{
      args: [],
      call: {Affinda.SearchMatchAPIIndexing, :get_all_indexes},
      url: "/v3/index",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.SearchMatchAPIIndexing, :get_all_indexes_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Re-index a document

  Re-index a document.
  This is relevant if you updated the document's data via the /annotations endpoint, and want to refresh
  the document's data in the search index.

  """
  @spec re_index_document(name :: String.t(), identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def re_index_document(name, identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, identifier: identifier],
      call: {Affinda.SearchMatchAPIIndexing, :re_index_document},
      url: "/v3/index/#{name}/documents/#{identifier}/re_index",
      method: :post,
      response: [
        {200, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an index

  Updates the specified index

  ## Request Body

  **Content Types**: `application/json`

  Index data to update
  """
  @spec update_index(name :: String.t(), body :: Affinda.IndexUpdate.t(), opts :: keyword) ::
          {:ok, Affinda.Index.t()} | {:error, Affinda.RequestError.t()}
  def update_index(name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [name: name, body: body],
      call: {Affinda.SearchMatchAPIIndexing, :update_index},
      url: "/v3/index/#{name}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.IndexUpdate, :t}}],
      response: [
        {200, {Affinda.Index, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_index_document_201_json_resp) do
    [document: :string]
  end

  def __fields__(:get_all_index_documents_200_json_resp) do
    [
      count: :integer,
      next: :string,
      previous: :string,
      results: [{Affinda.SearchMatchAPIIndexing, :get_all_index_documents_200_json_resp_results}]
    ]
  end

  def __fields__(:get_all_index_documents_200_json_resp_results) do
    [document: :string]
  end

  def __fields__(:get_all_indexes_200_json_resp) do
    [count: :integer, next: :string, previous: :string, results: [{Affinda.Index, :t}]]
  end
end
