defmodule DocumentAPIExtractor do
  @moduledoc """
  Provides API endpoints related to document api extractor
  """

  @default_client Client

  @doc """
  Create an extractor

  Create a custom extractor.
  """
  @spec create_extractor(ExtractorCreate.t(), keyword) ::
          {:ok, Extractor.t()} | {:error, RequestError.t()}
  def create_extractor(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIExtractor, :create_extractor},
      url: "/v3/extractors",
      body: body,
      method: :post,
      request: [{"application/json", {ExtractorCreate, :t}}],
      response: [
        {201, {Extractor, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an extractor

  Deletes the specified extractor from the database.
  """
  @spec delete_extractor(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_extractor(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIExtractor, :delete_extractor},
      url: "/v3/extractors/#{identifier}",
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
  Get list of all extractors

  Returns your custom extractors as well as Affinda's off-the-shelf extractors.

  ## Options

    * `organization`: Filter by organization.
    * `include_public_extractors`: Whether to include Affinda's off-the-shelf extractors.
    * `name`: Filter by name.
    * `validatable`: Filter by validatable.

  """
  @spec get_all_extractors(keyword) :: {:ok, [Extractor.t()]} | {:error, RequestError.t()}
  def get_all_extractors(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_public_extractors, :name, :organization, :validatable])

    client.request(%{
      args: [],
      call: {DocumentAPIExtractor, :get_all_extractors},
      url: "/v3/extractors",
      method: :get,
      query: query,
      response: [
        {200, [{Extractor, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific extractor

  Return a specific extractor.
  """
  @spec get_extractor(String.t(), keyword) :: {:ok, Extractor.t()} | {:error, RequestError.t()}
  def get_extractor(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIExtractor, :get_extractor},
      url: "/v3/extractors/#{identifier}",
      method: :get,
      response: [
        {200, {Extractor, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an extractor

  Update data of an extractor.
  """
  @spec update_extractor(String.t(), ExtractorUpdate.t(), keyword) ::
          {:ok, Extractor.t()} | {:error, RequestError.t()}
  def update_extractor(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIExtractor, :update_extractor},
      url: "/v3/extractors/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {ExtractorUpdate, :t}}],
      response: [
        {200, {Extractor, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
