defmodule OpenAI.Usage do
  @moduledoc """
  Provides API endpoints related to usage
  """

  @default_client OpenAI.Client

  @doc """
  Get audio speeches usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_audio_speeches(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_audio_speeches(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_audio_speeches},
      url: "/organization/usage/audio_speeches",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get audio transcriptions usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_audio_transcriptions(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_audio_transcriptions(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_audio_transcriptions},
      url: "/organization/usage/audio_transcriptions",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get code interpreter sessions usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_code_interpreter_sessions(opts :: keyword) ::
          {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_code_interpreter_sessions(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :page,
        :project_ids,
        :start_time
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_code_interpreter_sessions},
      url: "/organization/usage/code_interpreter_sessions",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get completions usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `batch`: If `true`, return batch jobs only. If `false`, return non-batch jobs only. By default, return both.
      
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `batch` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_completions(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_completions(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :batch,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_completions},
      url: "/organization/usage/completions",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get costs details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently only `1d` is supported, default to `1d`.
    * `project_ids`: Return only costs for these projects.
    * `group_by`: Group the costs by the specified fields. Support fields include `project_id`, `line_item` and any combination of them.
    * `limit`: A limit on the number of buckets to be returned. Limit can range between 1 and 180, and the default is 7.
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_costs(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_costs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :page,
        :project_ids,
        :start_time
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_costs},
      url: "/organization/costs",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get embeddings usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_embeddings(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_embeddings(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_embeddings},
      url: "/organization/usage/embeddings",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get images usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `sources`: Return only usages for these sources. Possible values are `image.generation`, `image.edit`, `image.variation` or any combination of them.
    * `sizes`: Return only usages for these image sizes. Possible values are `256x256`, `512x512`, `1024x1024`, `1792x1792`, `1024x1792` or any combination of them.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model`, `size`, `source` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_images(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_images(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :sizes,
        :sources,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_images},
      url: "/organization/usage/images",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get moderations usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `user_ids`: Return only usage for these users.
    * `api_key_ids`: Return only usage for these API keys.
    * `models`: Return only usage for these models.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`, `user_id`, `api_key_id`, `model` or any combination of them.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_moderations(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_moderations(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :api_key_ids,
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :models,
        :page,
        :project_ids,
        :start_time,
        :user_ids
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_moderations},
      url: "/organization/usage/moderations",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get vector stores usage details for the organization.

  ## Options

    * `start_time`: Start time (Unix seconds) of the query time range, inclusive.
    * `end_time`: End time (Unix seconds) of the query time range, exclusive.
    * `bucket_width`: Width of each time bucket in response. Currently `1m`, `1h` and `1d` are supported, default to `1d`.
    * `project_ids`: Return only usage for these projects.
    * `group_by`: Group the usage data by the specified fields. Support fields include `project_id`.
    * `limit`: Specifies the number of buckets to return.
      - `bucket_width=1d`: default: 7, max: 31
      - `bucket_width=1h`: default: 24, max: 168
      - `bucket_width=1m`: default: 60, max: 1440
      
    * `page`: A cursor for use in pagination. Corresponding to the `next_page` field from the previous response.

  """
  @spec usage_vector_stores(opts :: keyword) :: {:ok, OpenAI.UsageResponse.t()} | :error
  def usage_vector_stores(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :bucket_width,
        :end_time,
        :group_by,
        :limit,
        :page,
        :project_ids,
        :start_time
      ])

    client.request(%{
      args: [],
      call: {OpenAI.Usage, :usage_vector_stores},
      url: "/organization/usage/vector_stores",
      method: :get,
      query: query,
      response: [{200, {OpenAI.UsageResponse, :t}}],
      opts: opts
    })
  end
end
