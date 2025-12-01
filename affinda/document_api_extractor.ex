defmodule Affinda.DocumentAPIExtractor do
  @moduledoc """
  Provides API endpoints related to document api extractor
  """

  @default_client Affinda.Client

  @doc """
  Create an extractor

  Create a custom extractor.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_extractor(body :: Affinda.ExtractorCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Extractor.t()} | {:error, Affinda.RequestError.t()}
  def create_extractor(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIExtractor, :create_extractor},
      url: "/v3/extractors",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.ExtractorCreate, :t}}],
      response: [
        {201, {Affinda.Extractor, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an extractor

  Deletes the specified extractor from the database.
  """
  @spec delete_extractor(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_extractor(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIExtractor, :delete_extractor},
      url: "/v3/extractors/#{identifier}",
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
  Get list of all extractors

  Returns your custom extractors as well as Affinda's off-the-shelf extractors.

  ## Options

    * `organization`: Filter by organization.
    * `include_public_extractors`: Whether to include Affinda's off-the-shelf extractors.
    * `name`: Filter by name.
    * `validatable`: Filter by validatable.

  """
  @spec get_all_extractors(opts :: keyword) ::
          {:ok, [Affinda.Extractor.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_extractors(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include_public_extractors, :name, :organization, :validatable])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIExtractor, :get_all_extractors},
      url: "/v3/extractors",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.Extractor, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific extractor

  Return a specific extractor.
  """
  @spec get_extractor(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.Extractor.t()} | {:error, Affinda.RequestError.t()}
  def get_extractor(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIExtractor, :get_extractor},
      url: "/v3/extractors/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.Extractor, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an extractor

  Update data of an extractor.

  ## Request Body

  **Content Types**: `application/json`

  Extractor data to update
  """
  @spec update_extractor(
          identifier :: String.t(),
          body :: Affinda.ExtractorUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.Extractor.t()} | {:error, Affinda.RequestError.t()}
  def update_extractor(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIExtractor, :update_extractor},
      url: "/v3/extractors/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.ExtractorUpdate, :t}}],
      response: [
        {200, {Affinda.Extractor, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end
end
