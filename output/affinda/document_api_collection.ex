defmodule DocumentAPICollection do
  @moduledoc """
  Provides API endpoints related to document api collection
  """

  @default_client Client

  @doc """
  Create a collection

  Create a collection
  """
  @spec create_collection(CollectionCreate.t(), keyword) ::
          {:ok, Collection.t()} | {:error, RequestError.t()}
  def create_collection(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPICollection, :create_collection},
      url: "/v3/collections",
      body: body,
      method: :post,
      request: [{"application/json", {CollectionCreate, :t}}],
      response: [
        {201, {Collection, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create data field for a collection along with a new data point.

  Create data field for a collection along with a new data point.
  """
  @spec create_data_field_for_collection(String.t(), DataFieldCreate.t(), keyword) ::
          {:ok, DataField.t()} | {:error, RequestError.t()}
  def create_data_field_for_collection(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPICollection, :create_data_field_for_collection},
      url: "/v3/collections/#{identifier}/create_data_field",
      body: body,
      method: :post,
      request: [{"application/json", {DataFieldCreate, :t}}],
      response: [
        {200, {DataField, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a collection

  Deletes the specified collection from the database.
  """
  @spec delete_collection(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPICollection, :delete_collection},
      url: "/v3/collections/#{identifier}",
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
  Get list of all collections

  Returns your collections.

  ## Options

    * `workspace`: Filter by workspace.

  """
  @spec get_all_collections(keyword) :: {:ok, [Collection.t()]} | {:error, RequestError.t()}
  def get_all_collections(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:workspace])

    client.request(%{
      args: [],
      call: {DocumentAPICollection, :get_all_collections},
      url: "/v3/collections",
      method: :get,
      query: query,
      response: [
        {200, [{Collection, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific collection

  Return a specific collection.
  """
  @spec get_collection(String.t(), keyword) :: {:ok, Collection.t()} | {:error, RequestError.t()}
  def get_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPICollection, :get_collection},
      url: "/v3/collections/#{identifier}",
      method: :get,
      response: [
        {200, {Collection, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get data field for a collection assosciated with a data point.

  Get a data field for a collection assosciated with a data point
  """
  @spec get_data_field_for_collection(String.t(), String.t(), keyword) ::
          {:ok, CollectionField.t()} | {:error, RequestError.t()}
  def get_data_field_for_collection(identifier, datapoint_identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, datapoint_identifier: datapoint_identifier],
      call: {DocumentAPICollection, :get_data_field_for_collection},
      url: "/v3/collections/#{identifier}/fields/#{datapoint_identifier}",
      method: :get,
      response: [
        {200, {CollectionField, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get usage by collection

  Return monthly credits consumption of a collection.

  ## Options

    * `start`: Start date of the period to retrieve. Format: YYYY-MM
    * `end`: End date of the period to retrieve. Format: YYYY-MM

  """
  @spec get_usage_by_collection(String.t(), keyword) ::
          {:ok, [UsageByCollection.t()]} | {:error, RequestError.t()}
  def get_usage_by_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:end, :start])

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPICollection, :get_usage_by_collection},
      url: "/v3/collections/#{identifier}/usage",
      method: :get,
      query: query,
      response: [
        {200, [{UsageByCollection, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a collection

  Update data of a collection.
  """
  @spec update_collection(String.t(), CollectionUpdate.t(), keyword) ::
          {:ok, Collection.t()} | {:error, RequestError.t()}
  def update_collection(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPICollection, :update_collection},
      url: "/v3/collections/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {CollectionUpdate, :t}}],
      response: [
        {200, {Collection, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update data field for a collection assosciated with a data point.

  Update data field for a collection assosciated with a data point
  """
  @spec update_data_field_for_collection(String.t(), String.t(), CollectionField.t(), keyword) ::
          {:ok, CollectionField.t()} | {:error, RequestError.t()}
  def update_data_field_for_collection(identifier, datapoint_identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, datapoint_identifier: datapoint_identifier, body: body],
      call: {DocumentAPICollection, :update_data_field_for_collection},
      url: "/v3/collections/#{identifier}/fields/#{datapoint_identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {CollectionField, :t}}],
      response: [
        {200, {CollectionField, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
