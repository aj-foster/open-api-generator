defmodule OpenAI.Batch do
  @moduledoc """
  Provides API endpoints related to batch
  """

  @default_client OpenAI.Client

  @doc """
  Cancels an in-progress batch. The batch will be in status `cancelling` for up to 10 minutes, before changing to `cancelled`, where it will have partial results (if any) available in the output file.
  """
  @spec cancel_batch(batch_id :: String.t(), opts :: keyword) :: {:ok, OpenAI.Batch.t()} | :error
  def cancel_batch(batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [batch_id: batch_id],
      call: {OpenAI.Batch, :cancel_batch},
      url: "/batches/#{batch_id}/cancel",
      method: :post,
      response: [{200, {OpenAI.Batch, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates and executes a batch from an uploaded file of requests

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_batch(body :: map, opts :: keyword) :: {:ok, OpenAI.Batch.t()} | :error
  def create_batch(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OpenAI.Batch, :create_batch},
      url: "/batches",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {OpenAI.Batch, :t}}],
      opts: opts
    })
  end

  @doc """
  List your organization's batches.

  ## Options

    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      

  """
  @spec list_batches(opts :: keyword) :: {:ok, OpenAI.ListBatchesResponse.t()} | :error
  def list_batches(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [],
      call: {OpenAI.Batch, :list_batches},
      url: "/batches",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ListBatchesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a batch.
  """
  @spec retrieve_batch(batch_id :: String.t(), opts :: keyword) ::
          {:ok, OpenAI.Batch.t()} | :error
  def retrieve_batch(batch_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [batch_id: batch_id],
      call: {OpenAI.Batch, :retrieve_batch},
      url: "/batches/#{batch_id}",
      method: :get,
      response: [{200, {OpenAI.Batch, :t}}],
      opts: opts
    })
  end

  @type t :: %__MODULE__{
          cancelled_at: integer | nil,
          cancelling_at: integer | nil,
          completed_at: integer | nil,
          completion_window: String.t(),
          created_at: integer,
          endpoint: String.t(),
          error_file_id: String.t() | nil,
          errors: OpenAI.BatchErrors.t() | nil,
          expired_at: integer | nil,
          expires_at: integer | nil,
          failed_at: integer | nil,
          finalizing_at: integer | nil,
          id: String.t(),
          in_progress_at: integer | nil,
          input_file_id: String.t(),
          metadata: map | nil,
          object: String.t(),
          output_file_id: String.t() | nil,
          request_counts: OpenAI.BatchRequestCounts.t() | nil,
          status: String.t()
        }

  defstruct [
    :cancelled_at,
    :cancelling_at,
    :completed_at,
    :completion_window,
    :created_at,
    :endpoint,
    :error_file_id,
    :errors,
    :expired_at,
    :expires_at,
    :failed_at,
    :finalizing_at,
    :id,
    :in_progress_at,
    :input_file_id,
    :metadata,
    :object,
    :output_file_id,
    :request_counts,
    :status
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cancelled_at: :integer,
      cancelling_at: :integer,
      completed_at: :integer,
      completion_window: :string,
      created_at: :integer,
      endpoint: :string,
      error_file_id: :string,
      errors: {OpenAI.BatchErrors, :t},
      expired_at: :integer,
      expires_at: :integer,
      failed_at: :integer,
      finalizing_at: :integer,
      id: :string,
      in_progress_at: :integer,
      input_file_id: :string,
      metadata: :map,
      object: {:const, "batch"},
      output_file_id: :string,
      request_counts: {OpenAI.BatchRequestCounts, :t},
      status:
        {:enum,
         [
           "validating",
           "failed",
           "in_progress",
           "finalizing",
           "completed",
           "expired",
           "cancelling",
           "cancelled"
         ]}
    ]
  end
end
