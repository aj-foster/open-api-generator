defmodule Affinda.DocumentAPIAnnotation do
  @moduledoc """
  Provides API endpoints related to document api annotation
  """

  @default_client Affinda.Client

  @doc """
  Batch create annotations

  Batch create annotations

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec batch_create_annotations(body :: [Affinda.AnnotationCreate.t()], opts :: keyword) ::
          {:ok, [Affinda.Annotation.t()]} | {:error, Affinda.RequestError.t()}
  def batch_create_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIAnnotation, :batch_create_annotations},
      url: "/v3/annotations/batch_create",
      body: body,
      method: :post,
      request: [{"application/json", [{Affinda.AnnotationCreate, :t}]}],
      response: [
        {201, [{Affinda.Annotation, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
          {:ok, Affinda.BatchDeleteAnnotationsResponse.t()} | {:error, Affinda.RequestError.t()}
  def batch_delete_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIAnnotation, :batch_delete_annotations},
      url: "/v3/annotations/batch_delete",
      body: body,
      method: :post,
      request: [{"application/json", [:integer]}],
      response: [
        {200, {Affinda.BatchDeleteAnnotationsResponse, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
  @spec batch_update_annotations(body :: [Affinda.AnnotationBatchUpdate.t()], opts :: keyword) ::
          {:ok, [Affinda.Annotation.t()]} | {:error, Affinda.RequestError.t()}
  def batch_update_annotations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIAnnotation, :batch_update_annotations},
      url: "/v3/annotations/batch_update",
      body: body,
      method: :post,
      request: [{"application/json", [{Affinda.AnnotationBatchUpdate, :t}]}],
      response: [
        {200, [{Affinda.Annotation, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
  @spec create_annotation(body :: Affinda.AnnotationCreate.t(), opts :: keyword) ::
          {:ok, Affinda.AnnotationWithValidationResults.t()} | {:error, Affinda.RequestError.t()}
  def create_annotation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIAnnotation, :create_annotation},
      url: "/v3/annotations",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.AnnotationCreate, :t}}],
      response: [
        {201, {Affinda.AnnotationWithValidationResults, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an annotation

  Deletes the specified annotation from the database.
  """
  @spec delete_annotation(id :: integer, opts :: keyword) ::
          {:ok, Affinda.AnotationDelete.t()} | {:error, Affinda.RequestError.t()}
  def delete_annotation(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPIAnnotation, :delete_annotation},
      url: "/v3/annotations/#{id}",
      method: :delete,
      response: [
        {200, {Affinda.AnotationDelete, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_all_annotations_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.Annotation.t()]
        }

  @doc """
  Get list of all annotations

  Returns your annotations.

  ## Options

    * `document`: Filter by document.

  """
  @spec get_all_annotations(opts :: keyword) ::
          {:ok, Affinda.DocumentAPIAnnotation.get_all_annotations_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_annotations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:document])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIAnnotation, :get_all_annotations},
      url: "/v3/annotations",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.DocumentAPIAnnotation, :get_all_annotations_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific annotation

  Return a specific annotation.
  """
  @spec get_annotation(id :: integer, opts :: keyword) ::
          {:ok, Affinda.Annotation.t()} | {:error, Affinda.RequestError.t()}
  def get_annotation(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPIAnnotation, :get_annotation},
      url: "/v3/annotations/#{id}",
      method: :get,
      response: [
        {200, {Affinda.Annotation, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
  @spec update_annotation(id :: integer, body :: Affinda.AnnotationUpdate.t(), opts :: keyword) ::
          {:ok, Affinda.Annotation.t()} | {:error, Affinda.RequestError.t()}
  def update_annotation(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Affinda.DocumentAPIAnnotation, :update_annotation},
      url: "/v3/annotations/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.AnnotationUpdate, :t}}],
      response: [
        {200, {Affinda.Annotation, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_annotations_200_json_resp) do
    [count: :integer, next: :string, previous: :string, results: [{Affinda.Annotation, :t}]]
  end
end
