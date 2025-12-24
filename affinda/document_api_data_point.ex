defmodule Affinda.DocumentAPIDataPoint do
  @moduledoc """
  Provides API endpoints related to document api data point
  """

  @default_client Affinda.Client

  @doc """
  Create a data point

  Create a custom data point.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_data_point(body :: Affinda.DataPointCreate.t(), opts :: keyword) ::
          {:ok, Affinda.DataPoint.t()} | {:error, Affinda.RequestError.t()}
  def create_data_point(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIDataPoint, :create_data_point},
      url: "/v3/data_points",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.DataPointCreate, :t}}],
      response: [
        {201, {Affinda.DataPoint, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a data point choice

  Create a custom data point choice.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_data_point_choice(body :: Affinda.DataPointChoiceCreate.t(), opts :: keyword) ::
          {:ok, Affinda.DataPointChoice.t()} | {:error, Affinda.RequestError.t()}
  def create_data_point_choice(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIDataPoint, :create_data_point_choice},
      url: "/v3/data_point_choices",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.DataPointChoiceCreate, :t}}],
      response: [
        {201, {Affinda.DataPointChoice, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a data point

  Deletes the specified data point from the database.
  """
  @spec delete_data_point(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_data_point(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIDataPoint, :delete_data_point},
      url: "/v3/data_points/#{identifier}",
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
  Delete a data point choice

  Deletes the specified data point choice from the database.
  """
  @spec delete_data_point_choice(id :: integer, opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_data_point_choice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPIDataPoint, :delete_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
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
  Get list of all data points

  Returns your custom data points as well as Affinda's off-the-shelf data points.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `organization`: Filter by organization.
    * `include_public`: Allows you to include public data points in the response when you're filtering by organization.
    * `extractor`: Filter by extractor.
    * `slug`: Filter by slug.
    * `description`: Filter by description.
    * `annotation_content_type`: Filter by annotation content type, e.g. text, integer, float, date, etc.
    * `identifier`: Filter by specific identifiers.

  """
  @spec get_all_data_points(opts :: keyword) ::
          {:ok, [Affinda.DataPoint.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_data_points(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :annotation_content_type,
        :description,
        :extractor,
        :identifier,
        :include_public,
        :limit,
        :offset,
        :organization,
        :slug
      ])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIDataPoint, :get_all_data_points},
      url: "/v3/data_points",
      method: :get,
      query: query,
      response: [
        {200, [{Affinda.DataPoint, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific data point

  Return a specific data point.
  """
  @spec get_data_point(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.DataPoint.t()} | {:error, Affinda.RequestError.t()}
  def get_data_point(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.DocumentAPIDataPoint, :get_data_point},
      url: "/v3/data_points/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.DataPoint, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific data point choice

  Return a specific data point choice.
  """
  @spec get_data_point_choice(id :: integer, opts :: keyword) ::
          {:ok, Affinda.DataPointChoice.t()} | {:error, Affinda.RequestError.t()}
  def get_data_point_choice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Affinda.DocumentAPIDataPoint, :get_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
      method: :get,
      response: [
        {200, {Affinda.DataPointChoice, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_data_point_choices_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.DataPointChoice.t()]
        }

  @doc """
  Get list of data point choices

  Returns available choices for a specific enum data point.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `data_point`: The data point to get choices for.
    * `collection`: The collection to get choices for.
    * `search`: Filter choices by searching for a substring.

  """
  @spec get_data_point_choices(opts :: keyword) ::
          {:ok, Affinda.DocumentAPIDataPoint.get_data_point_choices_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_data_point_choices(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:collection, :data_point, :limit, :offset, :search])

    client.request(%{
      args: [],
      call: {Affinda.DocumentAPIDataPoint, :get_data_point_choices},
      url: "/v3/data_point_choices",
      method: :get,
      query: query,
      response: [
        {200, {Affinda.DocumentAPIDataPoint, :get_data_point_choices_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Replace choices of a data point

  Replace choices of a data point. Existing choices and incoming choices are matched base on their `value`. New `value` will be created, existing `value` will be updated, and `value` not in incoming choices will be deleted.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec replace_data_point_choices(
          body :: Affinda.DataPointChoiceReplaceRequest.t(),
          opts :: keyword
        ) ::
          {:ok, Affinda.DataPointChoiceReplaceResponse.t()} | {:error, Affinda.RequestError.t()}
  def replace_data_point_choices(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.DocumentAPIDataPoint, :replace_data_point_choices},
      url: "/v3/data_point_choices/replace",
      body: body,
      method: :post,
      request: [{"application/json", {Affinda.DataPointChoiceReplaceRequest, :t}}],
      response: [
        {200, {Affinda.DataPointChoiceReplaceResponse, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a data point

  Update data of a data point.

  ## Request Body

  **Content Types**: `application/json`

  Data point to update
  """
  @spec update_data_point(
          identifier :: String.t(),
          body :: Affinda.DataPointUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.DataPoint.t()} | {:error, Affinda.RequestError.t()}
  def update_data_point(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.DocumentAPIDataPoint, :update_data_point},
      url: "/v3/data_points/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.DataPointUpdate, :t}}],
      response: [
        {200, {Affinda.DataPoint, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a data point choice

  Update data of a data point choice.

  ## Request Body

  **Content Types**: `application/json`

  Data point choice to update
  """
  @spec update_data_point_choice(
          id :: integer,
          body :: Affinda.DataPointChoiceUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.DataPointChoice.t()} | {:error, Affinda.RequestError.t()}
  def update_data_point_choice(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Affinda.DocumentAPIDataPoint, :update_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.DataPointChoiceUpdate, :t}}],
      response: [
        {200, {Affinda.DataPointChoice, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_data_point_choices_200_json_resp) do
    [count: :integer, next: :string, previous: :string, results: [{Affinda.DataPointChoice, :t}]]
  end
end
