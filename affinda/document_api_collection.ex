defmodule Affinda.DocumentAPICollection do
  @moduledoc """
  Provides API endpoints related to document api collection
  """

  @default_client Affinda.Client

  @doc """
  Create a collection

  Create a collection

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_collection(body :: Affinda.CollectionCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Collection.t()} | {:error, Affinda.RequestError.t()}
  def create_collection(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPICollection, :create_collection},
      url: "/v3/collections",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.CollectionCreate, :t}}],
      response: [
        {201, {Affinda.Collection, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create data field for a collection along with a new data point.

  Create data field for a collection along with a new data point.

  ## Request Body

  **Content Types**: `application/json`

  The data field and data point to be created.
  """
  @spec create_data_field_for_collection(
          identifier :: String.t(),
          body :: Affinda.DataFieldCreate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.DataField.t()} | {:error, Affinda.RequestError.t()}
  def create_data_field_for_collection(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPICollection, :create_data_field_for_collection},
      url: "/v3/collections/#{identifier}/create_data_field",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.DataFieldCreate, :t}}],
      response: [
        {200, {Affinda.DataField, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a collection

  Deletes the specified collection from the database.
  """
  @spec delete_collection(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPICollection, :delete_collection},
      url: "/v3/collections/#{identifier}",
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
  Get list of all collections

  Returns your collections.

  ## Options

    * `workspace`: Filter by workspace.

  """
  @spec get_all_collections(opts :: keyword) ::
          {:ok, [Affinda.Collection.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_collections(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:workspace])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPICollection, :get_all_collections},
      url: "/v3/collections",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.Collection, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific collection

  Return a specific collection.
  """
  @spec get_collection(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.Collection.t()} | {:error, Affinda.RequestError.t()}
  def get_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPICollection, :get_collection},
      url: "/v3/collections/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.Collection, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get data field for a collection assosciated with a data point.

  Get a data field for a collection assosciated with a data point
  """
  @spec get_data_field_for_collection(
          identifier :: String.t(),
          datapoint_identifier :: String.t(),
          opts :: keyword
        ) :: {:ok, Affinda.CollectionField.t()} | {:error, Affinda.RequestError.t()}
  def get_data_field_for_collection(identifier, datapoint_identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, datapoint_identifier: datapoint_identifier],
      call: {Affinda.DocumentAPICollection, :get_data_field_for_collection},
      url: "/v3/collections/#{identifier}/fields/#{datapoint_identifier}",
      method: :get,
      response: [
        {200, {Affinda.CollectionField, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
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
  @spec get_usage_by_collection(identifier :: String.t(), opts :: keyword) ::
          {:ok, [Affinda.UsageByCollection.t()]} | {:error, Affinda.RequestError.t()}
  def get_usage_by_collection(identifier, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:end, :start])

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPICollection, :get_usage_by_collection},
      url: "/v3/collections/#{identifier}/usage",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.UsageByCollection, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a collection

  Update data of a collection.

  ## Request Body

  **Content Types**: `application/json`

  Collection data to update
  """
  @spec update_collection(
          identifier :: String.t(),
          body :: Affinda.CollectionUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.Collection.t()} | {:error, Affinda.RequestError.t()}
  def update_collection(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPICollection, :update_collection},
      url: "/v3/collections/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.CollectionUpdate, :t}}],
      response: [
        {200, {Affinda.Collection, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update data field for a collection assosciated with a data point.

  Update data field for a collection assosciated with a data point

  ## Request Body

  **Content Types**: `application/json`

  Data field properties to update
  """
  @spec update_data_field_for_collection(
          identifier :: String.t(),
          datapoint_identifier :: String.t(),
          body :: Affinda.CollectionField.t(),
          opts :: keyword
        ) :: {:ok, Affinda.CollectionField.t()} | {:error, Affinda.RequestError.t()}
  def update_data_field_for_collection(identifier, datapoint_identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, datapoint_identifier: datapoint_identifier, body: body],
      call: {Affinda.DocumentAPICollection, :update_data_field_for_collection},
      url: "/v3/collections/#{identifier}/fields/#{datapoint_identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.CollectionField, :t}}],
      response: [
        {200, {Affinda.CollectionField, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end
end
