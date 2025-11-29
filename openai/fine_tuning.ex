defmodule FineTuning do
  @moduledoc """
  Provides API endpoints related to fine tuning
  """

  @default_client Client

  @doc """
  Immediately cancel a fine-tune job.

  """
  @spec cancel_fine_tuning_job(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, FineTuningJob.t()} | :error
  def cancel_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {FineTuning, :cancel_fine_tuning_job},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/cancel",
      method: :post,
      response: [{200, {FineTuningJob, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a fine-tuning job which begins the process of creating a new model from a given dataset.

  Response includes details of the enqueued job including job status and the name of the fine-tuned models once complete.

  [Learn more about fine-tuning](/docs/guides/fine-tuning)

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_fine_tuning_job(body :: CreateFineTuningJobRequest.t(), opts :: keyword) ::
          {:ok, FineTuningJob.t()} | :error
  def create_fine_tuning_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {FineTuning, :create_fine_tuning_job},
      url: "/fine_tuning/jobs",
      body: body,
      method: :post,
      request: [{"application/json", {CreateFineTuningJobRequest, :t}}],
      response: [{200, {FineTuningJob, :t}}],
      opts: opts
    })
  end

  @doc """
  Get status updates for a fine-tuning job.

  ## Options

    * `after`: Identifier for the last event from the previous pagination request.
    * `limit`: Number of events to retrieve.

  """
  @spec list_fine_tuning_events(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, ListFineTuningJobEventsResponse.t()} | :error
  def list_fine_tuning_events(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {FineTuning, :list_fine_tuning_events},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/events",
      method: :get,
      query: query,
      response: [{200, {ListFineTuningJobEventsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List checkpoints for a fine-tuning job.

  ## Options

    * `after`: Identifier for the last checkpoint ID from the previous pagination request.
    * `limit`: Number of checkpoints to retrieve.

  """
  @spec list_fine_tuning_job_checkpoints(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, ListFineTuningJobCheckpointsResponse.t()} | :error
  def list_fine_tuning_job_checkpoints(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {FineTuning, :list_fine_tuning_job_checkpoints},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}/checkpoints",
      method: :get,
      query: query,
      response: [{200, {ListFineTuningJobCheckpointsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List your organization's fine-tuning jobs

  ## Options

    * `after`: Identifier for the last job from the previous pagination request.
    * `limit`: Number of fine-tuning jobs to retrieve.
    * `metadata`: Optional metadata filter. To filter, use the syntax `metadata[k]=v`. Alternatively, set `metadata=null` to indicate no metadata.
      

  """
  @spec list_paginated_fine_tuning_jobs(opts :: keyword) ::
          {:ok, ListPaginatedFineTuningJobsResponse.t()} | :error
  def list_paginated_fine_tuning_jobs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit, :metadata])

    client.request(%{
      args: [],
      call: {FineTuning, :list_paginated_fine_tuning_jobs},
      url: "/fine_tuning/jobs",
      method: :get,
      query: query,
      response: [{200, {ListPaginatedFineTuningJobsResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get info about a fine-tuning job.

  [Learn more about fine-tuning](/docs/guides/fine-tuning)

  """
  @spec retrieve_fine_tuning_job(fine_tuning_job_id :: String.t(), opts :: keyword) ::
          {:ok, FineTuningJob.t()} | :error
  def retrieve_fine_tuning_job(fine_tuning_job_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [fine_tuning_job_id: fine_tuning_job_id],
      call: {FineTuning, :retrieve_fine_tuning_job},
      url: "/fine_tuning/jobs/#{fine_tuning_job_id}",
      method: :get,
      response: [{200, {FineTuningJob, :t}}],
      opts: opts
    })
  end
end
