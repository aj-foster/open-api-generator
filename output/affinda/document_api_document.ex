defmodule DocumentAPIDocument do
  @moduledoc """
  Provides API endpoints related to document api document
  """

  @default_client Client

  @doc """
  Upload a document for parsing


  Uploads a document for parsing. When successful, returns an `identifier` in the response for subsequent use with the [/documents/{identifier}](#get-/v3/documents/-identifier-) endpoint to check processing status and retrieve results.<br/>
  """
  @spec create_document(DocumentCreate.t(), keyword) ::
          {:ok, Document.t()} | {:error, RequestError.t()}
  def create_document(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIDocument, :create_document},
      url: "/v3/documents",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {DocumentCreate, :t}}],
      response: [
        {200, {Document, :t}},
        {201, {Document, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a validation result

  Create a validation result.
  """
  @spec create_validation_result(ValidationResultCreate.t(), keyword) ::
          {:ok, ValidationResult.t()} | {:error, RequestError.t()}
  def create_validation_result(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIDocument, :create_validation_result},
      url: "/v3/validation_results",
      body: body,
      method: :post,
      request: [{"application/json", {ValidationResultCreate, :t}}],
      response: [
        {201, {ValidationResult, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a document

  Deletes the specified document from the database.
  """
  @spec delete_document(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_document(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIDocument, :delete_document},
      url: "/v3/documents/#{identifier}",
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
  Delete a validation result

  Remove validation result.
  """
  @spec delete_validation_result(integer, keyword) :: :ok | {:error, RequestError.t()}
  def delete_validation_result(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIDocument, :delete_validation_result},
      url: "/v3/validation_results/#{id}",
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
  Edit pages of a document

  Split / merge / rotate / delete pages of a document.
  Documents with multiple pages can be splitted into multiple documents, or merged into one document.
  Each page can also be rotated. Edit operations will trigger re-parsing of the documents involved.

  """
  @spec edit_document_pages(String.t(), DocumentEditRequest.t(), keyword) ::
          {:ok, [Meta.t()]} | {:error, RequestError.t()}
  def edit_document_pages(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIDocument, :edit_document_pages},
      url: "/v3/validate/#{identifier}/split",
      body: body,
      method: :post,
      request: [{"application/json", {DocumentEditRequest, :t}}],
      response: [
        {200, [{Meta, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_documents_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Document.t()]
        }

  @doc """
  Get list of all documents

  Returns all the document summaries for that user, limited to 300 per page.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `workspace`: Filter by workspace.
    * `collection`: Filter by collection.
    * `state`: Filter by the document's state.
    * `tags`: Filter by tag's IDs.
    * `created_dt`: Filter by created datetime.
    * `search`: Partial, case-insensitive match with file name or tag name.
    * `ordering`: Sort the result set. A "-" at the beginning denotes DESC sort, e.g. -created_dt. Sort by multiple fields is supported. Supported values include: 'file_name', 'extractor', 'created_dt', 'validated_dt', 'archived_dt' and 'parsed__<dataPointSlug>'.
    * `include_data`: By default, this endpoint returns only the meta data of the documents. Set this to `true` will return a summary of the data that was parsed. If you want to retrieve the full set of data for a document, use the `GET /documents/{identifier}` endpoint.
    * `exclude`: Exclude some documents from the result.
    * `in_review`: Exclude documents that are currently being reviewed.
    * `failed`: Filter by failed status.
    * `ready`: Filter by ready status.
    * `validatable`: Filter for validatable documents.
    * `has_challenges`: Filter for documents with challenges.
    * `custom_identifier`: Filter for documents with this custom identifier.
    * `compact`: If "true", the response is compacted to annotations' parsed data. Annotations' meta data are excluded. Default is "false".
    * `count`: If "false", the documents count is not computed, thus saving time for large collections. Default is "true".

  """
  @spec get_all_documents(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_all_documents(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :collection,
        :compact,
        :count,
        :created_dt,
        :custom_identifier,
        :exclude,
        :failed,
        :has_challenges,
        :in_review,
        :include_data,
        :limit,
        :offset,
        :ordering,
        :ready,
        :search,
        :state,
        :tags,
        :validatable,
        :workspace
      ])

    client.request(%{
      args: [],
      call: {DocumentAPIDocument, :get_all_documents},
      url: "/v3/documents",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIDocument, :get_all_documents_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get list of all validation results

  Returns the validation results of a document.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `document`: Filter by document.

  """
  @spec get_all_validation_results(keyword) ::
          {:ok, [ValidationResult.t()]} | {:error, RequestError.t()}
  def get_all_validation_results(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:document, :limit, :offset])

    client.request(%{
      args: [],
      call: {DocumentAPIDocument, :get_all_validation_results},
      url: "/v3/validation_results",
      method: :get,
      query: query,
      response: [
        {200, [{ValidationResult, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific document

  Return a specific document.

  ## Options

    * `format`: Specify which format you want the response to be. Default is "json"
    * `compact`: If "true", the response is compacted to annotations' parsed data. Annotations' meta data are excluded. Default is "false".

  """
  @spec get_document(String.t(), keyword) :: {:ok, Document.t()} | {:error, RequestError.t()}
  def get_document(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:compact, :format])

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIDocument, :get_document},
      url: "/v3/documents/#{identifier}",
      method: :get,
      query: query,
      response: [
        {200, {Document, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific validation result

  Return a specific validation result.
  """
  @spec get_validation_result(integer, keyword) ::
          {:ok, ValidationResult.t()} | {:error, RequestError.t()}
  def get_validation_result(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIDocument, :get_validation_result},
      url: "/v3/validation_results/#{id}",
      method: :get,
      response: [
        {200, {ValidationResult, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a document

  Update file name, expiry time, or move to another collection, etc.
  """
  @spec update_document(String.t(), DocumentUpdate.t(), keyword) ::
          {:ok, Document.t()} | {:error, RequestError.t()}
  def update_document(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIDocument, :update_document},
      url: "/v3/documents/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {DocumentUpdate, :t}}],
      response: [
        {200, {Document, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a document's data

  Update data of a document.
  Only applicable for resumes and job descriptions. For other document types, please use the `PATCH /annotations/{id}` endpoint or the `POST /annotations/batch_update` endpoint.
  """
  @spec update_document_data(String.t(), JobDescriptionDataUpdate.t() | ResumeData.t(), keyword) ::
          {:ok, Document.t()} | {:error, RequestError.t()}
  def update_document_data(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIDocument, :update_document_data},
      url: "/v3/documents/#{identifier}/update_data",
      body: body,
      method: :post,
      request: [
        {"application/json", {:union, [{JobDescriptionDataUpdate, :t}, {ResumeData, :t}]}}
      ],
      response: [
        {200, {Document, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a validation result

  Update a validation result.
  """
  @spec update_validation_result(integer, ValidationResultUpdate.t(), keyword) ::
          {:ok, ValidationResult.t()} | {:error, RequestError.t()}
  def update_validation_result(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {DocumentAPIDocument, :update_validation_result},
      url: "/v3/validation_results/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {ValidationResultUpdate, :t}}],
      response: [
        {200, {ValidationResult, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_documents_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{Document, :t}]
    ]
  end
end
