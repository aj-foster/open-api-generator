defmodule SearchMatchAPIEmbedding do
  @moduledoc """
  Provides API endpoints related to search match api embedding
  """

  @default_client Client

  @doc """
  Create a signed URL for the embeddable job description search tool

  Create and return a signed URL of the job description search tool which then can be embedded on a web page. An optional parameter `config_override` can be passed to override the user-level configurations of the embeddable search tool.
  """
  @spec create_job_description_search_embed_url(map, keyword) ::
          {:ok, JobDescriptionSearchEmbed.t()} | {:error, RequestError.t()}
  def create_job_description_search_embed_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPIEmbedding, :create_job_description_search_embed_url},
      url: "/v3/job_description_search/embed",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {JobDescriptionSearchEmbed, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a signed URL for the embeddable resume search tool

  Create and return a signed URL of the resume search tool which then can be embedded on a web page. An optional parameter `config_override` can be passed to override the user-level configurations of the embeddable resume search tool.
  """
  @spec create_resume_search_embed_url(map, keyword) ::
          {:ok, ResumeSearchEmbed.t()} | {:error, RequestError.t()}
  def create_resume_search_embed_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPIEmbedding, :create_resume_search_embed_url},
      url: "/v3/resume_search/embed",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {ResumeSearchEmbed, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get the config for the logged in user's embeddable job description search tool

  Return configurations such as which fields can be displayed in the logged in user's embeddable job description search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec get_job_description_search_config(keyword) ::
          {:ok, JobDescriptionSearchConfig.t()} | {:error, RequestError.t()}
  def get_job_description_search_config(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SearchMatchAPIEmbedding, :get_job_description_search_config},
      url: "/v3/job_description_search/config",
      method: :get,
      response: [
        {200, {JobDescriptionSearchConfig, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get the config for the logged in user's embeddable resume search tool

  Return configurations such as which fields can be displayed in the logged in user's embeddable resume search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec get_resume_search_config(keyword) ::
          {:ok, ResumeSearchConfig.t()} | {:error, RequestError.t()}
  def get_resume_search_config(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SearchMatchAPIEmbedding, :get_resume_search_config},
      url: "/v3/resume_search/config",
      method: :get,
      response: [
        {200, {ResumeSearchConfig, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update the config for the logged in user's embeddable job description search tool

  Update configurations such as which fields can be displayed in the logged in user's embeddable job description search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec update_job_description_search_config(JobDescriptionSearchConfig.t(), keyword) ::
          {:ok, JobDescriptionSearchConfig.t()} | {:error, RequestError.t()}
  def update_job_description_search_config(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPIEmbedding, :update_job_description_search_config},
      url: "/v3/job_description_search/config",
      body: body,
      method: :patch,
      request: [{"application/json", {JobDescriptionSearchConfig, :t}}],
      response: [
        {200, {JobDescriptionSearchConfig, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update the config for the logged in user's embeddable resume search tool

  Update configurations such as which fields can be displayed in the logged in user's embeddable resume search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec update_resume_search_config(ResumeSearchConfig.t(), keyword) ::
          {:ok, ResumeSearchConfig.t()} | {:error, RequestError.t()}
  def update_resume_search_config(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SearchMatchAPIEmbedding, :update_resume_search_config},
      url: "/v3/resume_search/config",
      body: body,
      method: :patch,
      request: [{"application/json", {ResumeSearchConfig, :t}}],
      response: [
        {200, {ResumeSearchConfig, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
