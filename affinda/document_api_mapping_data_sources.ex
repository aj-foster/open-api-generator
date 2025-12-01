defmodule Affinda.DocumentAPIMappingDataSources do
  @moduledoc """
  Provides API endpoints related to document api mapping data sources
  """

  @default_client Affinda.Client

  @doc """
  Add value for a mapping data source

  Adds a value to a mapping data source

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec add_mapping_data_source_value(identifier :: String.t(), body :: map, opts :: keyword) ::
          {:ok, map} | {:error, Affinda.RequestError.t()}
  def add_mapping_data_source_value(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIMappingDataSources, :add_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, :map},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a mapping

  Create a custom mapping.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_mapping(body :: Affinda.MappingCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Mapping.t()} | {:error, Affinda.RequestError.t()}
  def create_mapping(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIMappingDataSources, :create_mapping},
      url: "/v3/mappings",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.MappingCreate, :t}}],
      response: [
        {201, {Affinda.Mapping, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a mapping data source

  Create a custom mapping data source.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_mapping_data_source(body :: Affinda.MappingDataSourceCreate.t(), opts :: keyword) ::
          {:ok, Affinda.MappingDataSource.t()} | {:error, Affinda.RequestError.t()}
  def create_mapping_data_source(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIMappingDataSources, :create_mapping_data_source},
      url: "/v3/mapping_data_sources",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.MappingDataSourceCreate, :t}}],
      response: [
        {201, {Affinda.MappingDataSource, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete specific mapping

  Delete the specified mapping from the database.
  """
  @spec delete_mapping(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_mapping(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIMappingDataSources, :delete_mapping},
      url: "/v3/mappings/#{identifier}",
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
  Delete specific mapping data source

  Delete the specified mapping data source from the database.
  """
  @spec delete_mapping_data_source(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_mapping_data_source(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIMappingDataSources, :delete_mapping_data_source},
      url: "/v3/mapping_data_sources/#{identifier}",
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
  Delete specific mapping data source value

  Delete the specified mapping data source value from the database.
  """
  @spec delete_mapping_data_source_value(
          identifier :: String.t(),
          value :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Affinda.RequestError.t()}
  def delete_mapping_data_source_value(identifier, value, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, value: value],
      call: {Affinda.DocumentAPIMappingDataSources, :delete_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values/#{value}",
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
  Get specific mapping

  Return a specific mapping.
  """
  @spec get_mapping(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.Mapping.t()} | {:error, Affinda.RequestError.t()}
  def get_mapping(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIMappingDataSources, :get_mapping},
      url: "/v3/mappings/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.Mapping, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific mapping data source

  Return a specific mapping data source.
  """
  @spec get_mapping_data_source(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.MappingDataSource.t()} | {:error, Affinda.RequestError.t()}
  def get_mapping_data_source(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIMappingDataSources, :get_mapping_data_source},
      url: "/v3/mapping_data_sources/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.MappingDataSource, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific mapping data source value

  Return a specific mapping dta source value.
  """
  @spec get_mapping_data_source_value(
          identifier :: String.t(),
          value :: String.t(),
          opts :: keyword
        ) :: {:ok, map} | {:error, Affinda.RequestError.t()}
  def get_mapping_data_source_value(identifier, value, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, value: value],
      call: {Affinda.DocumentAPIMappingDataSources, :get_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values/#{value}",
      method: :get,
      response: [
        {200, :map},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type list_mapping_data_source_values_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [map]
        }

  @doc """
  List values for a mapping data source

  Returns the list of all values in a mapping data source

  ## Options

    * `limit`: The numbers of results to return.
    * `offset`: The number of documents to skip before starting to collect the result set.
    * `search`: Search for specific values
    * `annotation`: Filter based on annotation ID

  """
  @spec list_mapping_data_source_values(identifier :: String.t(), opts :: keyword) ::
          {:ok,
           Affinda.DocumentAPIMappingDataSources.list_mapping_data_source_values_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def list_mapping_data_source_values(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:annotation, :limit, :offset, :search])

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIMappingDataSources, :list_mapping_data_source_values},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      method: :get,
      query: query,
      response: [
        {200,
         {Affinda.DocumentAPIMappingDataSources, :list_mapping_data_source_values_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type list_mapping_data_sources_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.MappingDataSource.t()]
        }

  @doc """
  List mapping data sources

  Returns the list of all custom mapping data sources.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `name`: Filter by name.
    * `organization`: Filter by organization.
    * `identifier`: Filter by identifier.

  """
  @spec list_mapping_data_sources(opts :: keyword) ::
          {:ok, Affinda.DocumentAPIMappingDataSources.list_mapping_data_sources_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def list_mapping_data_sources(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:identifier, :limit, :name, :offset, :organization])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIMappingDataSources, :list_mapping_data_sources},
      url: "/v3/mapping_data_sources",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.DocumentAPIMappingDataSources, :list_mapping_data_sources_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type list_mappings_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.Mapping.t()]
        }

  @doc """
  List mappings

  Returns the list of all custom data mappings.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `mapping_data_source`: Mapping data source's identifier

  """
  @spec list_mappings(opts :: keyword) ::
          {:ok, Affinda.DocumentAPIMappingDataSources.list_mappings_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def list_mappings(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :mapping_data_source, :offset])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIMappingDataSources, :list_mappings},
      url: "/v3/mappings",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.DocumentAPIMappingDataSources, :list_mappings_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Replace values for a mapping data source

  Replaces the list of all values in a mapping data source

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_mapping_data_source_values(
          identifier :: String.t(),
          body :: [map],
          opts :: keyword
        ) :: {:ok, [map]} | {:error, Affinda.RequestError.t()}
  def replace_mapping_data_source_values(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIMappingDataSources, :replace_mapping_data_source_values},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      body: body,
      method: :put,
      request: [{"application/json", [:map]}],
      response: [
        {201, [:map]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update specific mapping

  Updates a specific mapping.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_mapping(
          identifier :: String.t(),
          body :: Affinda.MappingUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.Mapping.t()} | {:error, Affinda.RequestError.t()}
  def update_mapping(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIMappingDataSources, :update_mapping},
      url: "/v3/mappings/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.MappingUpdate, :t}}],
      response: [
        {200, {Affinda.Mapping, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_mapping_data_source_values_200_json_resp) do
    [count: :integer, next: :string, previous: :string, results: [:map]]
  end

  def __fields__(:list_mapping_data_sources_200_json_resp) do
    [
      count: :integer,
      next: :string,
      previous: :string,
      results: [{Affinda.MappingDataSource, :t}]
    ]
  end

  def __fields__(:list_mappings_200_json_resp) do
    [count: :integer, next: :string, previous: :string, results: [{Affinda.Mapping, :t}]]
  end
end
