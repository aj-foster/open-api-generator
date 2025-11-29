defmodule DocumentAPIAnnotation do
  @moduledoc """
  Provides API endpoints related to document api annotation
  """

  @default_client Client

  @doc """
  Batch create annotations

  Batch create annotations

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec batch_create_annotations(body :: [AnnotationCreate.t()], opts :: keyword) ::
          {:ok, [Annotation.t()]} | {:error, RequestError.t()}
  def batch_create_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIAnnotation, :batch_create_annotations},
      url: "/v3/annotations/batch_create",
      body: body,
      method: :post,
      request: [{"application/json", [{AnnotationCreate, :t}]}],
      response: [
        {201, [{Annotation, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Batch delete annotations

  Batch delete annotations

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec batch_delete_annotations(body :: [integer], opts :: keyword) ::
          {:ok, BatchDeleteAnnotationsResponse.t()} | {:error, RequestError.t()}
  def batch_delete_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIAnnotation, :batch_delete_annotations},
      url: "/v3/annotations/batch_delete",
      body: body,
      method: :post,
      request: [{"application/json", [:integer]}],
      response: [
        {200, {BatchDeleteAnnotationsResponse, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Batch update annotations

  Batch update annotations

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec batch_update_annotations(body :: [AnnotationBatchUpdate.t()], opts :: keyword) ::
          {:ok, [Annotation.t()]} | {:error, RequestError.t()}
  def batch_update_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIAnnotation, :batch_update_annotations},
      url: "/v3/annotations/batch_update",
      body: body,
      method: :post,
      request: [{"application/json", [{AnnotationBatchUpdate, :t}]}],
      response: [
        {200, [{Annotation, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a annotation

  Create a annotation

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_annotation(body :: AnnotationCreate.t(), opts :: keyword) ::
          {:ok, AnnotationWithValidationResults.t()} | {:error, RequestError.t()}
  def create_annotation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIAnnotation, :create_annotation},
      url: "/v3/annotations",
      body: body,
      method: :post,
      request: [{"application/json", {AnnotationCreate, :t}}],
      response: [
        {201, {AnnotationWithValidationResults, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an annotation

  Deletes the specified annotation from the database.
  """
  @spec delete_annotation(id :: integer, opts :: keyword) ::
          {:ok, AnotationDelete.t()} | {:error, RequestError.t()}
  def delete_annotation(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIAnnotation, :delete_annotation},
      url: "/v3/annotations/#{id}",
      method: :delete,
      response: [
        {200, {AnotationDelete, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_annotations_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Annotation.t()]
        }

  @doc """
  Get list of all annotations

  Returns your annotations.

  ## Options

    * `document`: Filter by document.

  """
  @spec get_all_annotations(opts :: keyword) ::
          {:ok, DocumentAPIAnnotation.get_all_annotations_200_json_resp()}
          | {:error, RequestError.t()}
  def get_all_annotations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:document])

    client.request(%{
      args: [],
      call: {DocumentAPIAnnotation, :get_all_annotations},
      url: "/v3/annotations",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIAnnotation, :get_all_annotations_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific annotation

  Return a specific annotation.
  """
  @spec get_annotation(id :: integer, opts :: keyword) ::
          {:ok, Annotation.t()} | {:error, RequestError.t()}
  def get_annotation(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIAnnotation, :get_annotation},
      url: "/v3/annotations/#{id}",
      method: :get,
      response: [
        {200, {Annotation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an annotation

  Update data of an annotation.

  ## Request Body

  **Content Types**: `application/json`

  Annotation data to update
  """
  @spec update_annotation(id :: integer, body :: AnnotationUpdate.t(), opts :: keyword) ::
          {:ok, Annotation.t()} | {:error, RequestError.t()}
  def update_annotation(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {DocumentAPIAnnotation, :update_annotation},
      url: "/v3/annotations/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {AnnotationUpdate, :t}}],
      response: [
        {200, {Annotation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_annotations_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{Annotation, :t}]
    ]
  end
end
