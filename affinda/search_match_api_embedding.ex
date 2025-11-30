defmodule Affinda.SearchMatchAPIEmbedding do
  @moduledoc """
  Provides API endpoints related to search match api embedding
  """

  @default_client Affinda.Client

  @doc """
  Create a signed URL for the embeddable job description search tool

  Create and return a signed URL of the job description search tool which then can be embedded on a web page. An optional parameter `config_override` can be passed to override the user-level configurations of the embeddable search tool.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_job_description_search_embed_url(body :: map, opts :: keyword) ::
          {:ok, Affinda.JobDescriptionSearchEmbed.t()} | {:error, Affinda.RequestError.t()}
  def create_job_description_search_embed_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.SearchMatchAPIEmbedding, :create_job_description_search_embed_url},
      url: "/v3/job_description_search/embed",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Affinda.JobDescriptionSearchEmbed, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a signed URL for the embeddable resume search tool

  Create and return a signed URL of the resume search tool which then can be embedded on a web page. An optional parameter `config_override` can be passed to override the user-level configurations of the embeddable resume search tool.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_resume_search_embed_url(body :: map, opts :: keyword) ::
          {:ok, Affinda.ResumeSearchEmbed.t()} | {:error, Affinda.RequestError.t()}
  def create_resume_search_embed_url(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.SearchMatchAPIEmbedding, :create_resume_search_embed_url},
      url: "/v3/resume_search/embed",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Affinda.ResumeSearchEmbed, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get the config for the logged in user's embeddable job description search tool

  Return configurations such as which fields can be displayed in the logged in user's embeddable job description search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec get_job_description_search_config(opts :: keyword) ::
          {:ok, Affinda.JobDescriptionSearchConfig.t()} | {:error, Affinda.RequestError.t()}
  def get_job_description_search_config(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Affinda.SearchMatchAPIEmbedding, :get_job_description_search_config},
      url: "/v3/job_description_search/config",
      method: :get,
      response: [
        {200, {Affinda.JobDescriptionSearchConfig, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get the config for the logged in user's embeddable resume search tool

  Return configurations such as which fields can be displayed in the logged in user's embeddable resume search tool, what are their weights, what is the maximum number of results that can be returned, etc.
  """
  @spec get_resume_search_config(opts :: keyword) ::
          {:ok, Affinda.ResumeSearchConfig.t()} | {:error, Affinda.RequestError.t()}
  def get_resume_search_config(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Affinda.SearchMatchAPIEmbedding, :get_resume_search_config},
      url: "/v3/resume_search/config",
      method: :get,
      response: [
        {200, {Affinda.ResumeSearchConfig, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update the config for the logged in user's embeddable job description search tool

  Update configurations such as which fields can be displayed in the logged in user's embeddable job description search tool, what are their weights, what is the maximum number of results that can be returned, etc.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_job_description_search_config(
          body :: Affinda.JobDescriptionSearchConfig.t(),
          opts :: keyword
        ) :: {:ok, Affinda.JobDescriptionSearchConfig.t()} | {:error, Affinda.RequestError.t()}
  def update_job_description_search_config(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.SearchMatchAPIEmbedding, :update_job_description_search_config},
      url: "/v3/job_description_search/config",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.JobDescriptionSearchConfig, :t}}],
      response: [
        {200, {Affinda.JobDescriptionSearchConfig, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update the config for the logged in user's embeddable resume search tool

  Update configurations such as which fields can be displayed in the logged in user's embeddable resume search tool, what are their weights, what is the maximum number of results that can be returned, etc.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_resume_search_config(body :: Affinda.ResumeSearchConfig.t(), opts :: keyword) ::
          {:ok, Affinda.ResumeSearchConfig.t()} | {:error, Affinda.RequestError.t()}
  def update_resume_search_config(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.SearchMatchAPIEmbedding, :update_resume_search_config},
      url: "/v3/resume_search/config",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.ResumeSearchConfig, :t}}],
      response: [
        {200, {Affinda.ResumeSearchConfig, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end
end
