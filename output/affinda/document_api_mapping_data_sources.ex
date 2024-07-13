defmodule DocumentAPIMappingDataSources do
  @moduledoc """
  Provides API endpoints related to document api mapping data sources
  """

  @default_client Client

  @doc """
  Add value for a mapping data source

  Adds a value to a mapping data source
  """
  @spec add_mapping_data_source_value(String.t(), map, keyword) ::
          {:ok, map} | {:error, RequestError.t()}
  def add_mapping_data_source_value(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIMappingDataSources, :add_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {201, :map},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a mapping

  Create a custom mapping.
  """
  @spec create_mapping(MappingCreate.t(), keyword) ::
          {:ok, Mapping.t()} | {:error, RequestError.t()}
  def create_mapping(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIMappingDataSources, :create_mapping},
      url: "/v3/mappings",
      body: body,
      method: :post,
      request: [{"application/json", {MappingCreate, :t}}],
      response: [
        {201, {Mapping, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a mapping data source

  Create a custom mapping data source.
  """
  @spec create_mapping_data_source(MappingDataSourceCreate.t(), keyword) ::
          {:ok, MappingDataSource.t()} | {:error, RequestError.t()}
  def create_mapping_data_source(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIMappingDataSources, :create_mapping_data_source},
      url: "/v3/mapping_data_sources",
      body: body,
      method: :post,
      request: [{"application/json", {MappingDataSourceCreate, :t}}],
      response: [
        {201, {MappingDataSource, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete specific mapping

  Delete the specified mapping from the database.
  """
  @spec delete_mapping(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_mapping(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIMappingDataSources, :delete_mapping},
      url: "/v3/mappings/#{identifier}",
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
  Delete specific mapping data source

  Delete the specified mapping data source from the database.
  """
  @spec delete_mapping_data_source(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_mapping_data_source(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIMappingDataSources, :delete_mapping_data_source},
      url: "/v3/mapping_data_sources/#{identifier}",
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
  Delete specific mapping data source value

  Delete the specified mapping data source value from the database.
  """
  @spec delete_mapping_data_source_value(String.t(), String.t(), keyword) ::
          :ok | {:error, RequestError.t()}
  def delete_mapping_data_source_value(identifier, value, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, value: value],
      call: {DocumentAPIMappingDataSources, :delete_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values/#{value}",
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
  Get specific mapping

  Return a specific mapping.
  """
  @spec get_mapping(String.t(), keyword) :: {:ok, Mapping.t()} | {:error, RequestError.t()}
  def get_mapping(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIMappingDataSources, :get_mapping},
      url: "/v3/mappings/#{identifier}",
      method: :get,
      response: [
        {200, {Mapping, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific mapping data source

  Return a specific mapping data source.
  """
  @spec get_mapping_data_source(String.t(), keyword) ::
          {:ok, MappingDataSource.t()} | {:error, RequestError.t()}
  def get_mapping_data_source(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIMappingDataSources, :get_mapping_data_source},
      url: "/v3/mapping_data_sources/#{identifier}",
      method: :get,
      response: [
        {200, {MappingDataSource, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific mapping data source value

  Return a specific mapping dta source value.
  """
  @spec get_mapping_data_source_value(String.t(), String.t(), keyword) ::
          {:ok, map} | {:error, RequestError.t()}
  def get_mapping_data_source_value(identifier, value, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, value: value],
      call: {DocumentAPIMappingDataSources, :get_mapping_data_source_value},
      url: "/v3/mapping_data_sources/#{identifier}/values/#{value}",
      method: :get,
      response: [
        {200, :map},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
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
  @spec list_mapping_data_source_values(String.t(), keyword) ::
          {:ok, map} | {:error, RequestError.t()}
  def list_mapping_data_source_values(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:annotation, :limit, :offset, :search])

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIMappingDataSources, :list_mapping_data_source_values},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIMappingDataSources, :list_mapping_data_source_values_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type list_mapping_data_sources_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [MappingDataSource.t()]
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
  @spec list_mapping_data_sources(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def list_mapping_data_sources(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:identifier, :limit, :name, :offset, :organization])

    client.request(%{
      args: [],
      call: {DocumentAPIMappingDataSources, :list_mapping_data_sources},
      url: "/v3/mapping_data_sources",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIMappingDataSources, :list_mapping_data_sources_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type list_mappings_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Mapping.t()]
        }

  @doc """
  List mappings

  Returns the list of all custom data mappings.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `mapping_data_source`: Mapping data source's identifier

  """
  @spec list_mappings(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def list_mappings(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :mapping_data_source, :offset])

    client.request(%{
      args: [],
      call: {DocumentAPIMappingDataSources, :list_mappings},
      url: "/v3/mappings",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIMappingDataSources, :list_mappings_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Replace values for a mapping data source

  Replaces the list of all values in a mapping data source
  """
  @spec replace_mapping_data_source_values(String.t(), [map], keyword) ::
          {:ok, [map]} | {:error, RequestError.t()}
  def replace_mapping_data_source_values(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIMappingDataSources, :replace_mapping_data_source_values},
      url: "/v3/mapping_data_sources/#{identifier}/values",
      body: body,
      method: :put,
      request: [{"application/json", [:map]}],
      response: [
        {201, [:map]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update specific mapping

  Updates a specific mapping.
  """
  @spec update_mapping(String.t(), MappingUpdate.t(), keyword) ::
          {:ok, Mapping.t()} | {:error, RequestError.t()}
  def update_mapping(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIMappingDataSources, :update_mapping},
      url: "/v3/mappings/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {MappingUpdate, :t}}],
      response: [
        {200, {Mapping, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_mapping_data_source_values_200_json_resp) do
    [count: :integer, next: {:string, :generic}, previous: {:string, :generic}, results: [:map]]
  end

  def __fields__(:list_mapping_data_sources_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{MappingDataSource, :t}]
    ]
  end

  def __fields__(:list_mappings_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{Mapping, :t}]
    ]
  end
end
