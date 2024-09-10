defmodule DocumentAPIDataPoint do
  @moduledoc """
  Provides API endpoints related to document api data point
  """

  @default_client Client

  @doc """
  Create a data point

  Create a custom data point.
  """
  @spec create_data_point(DataPointCreate.t(), keyword) ::
          {:ok, DataPoint.t()} | {:error, RequestError.t()}
  def create_data_point(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIDataPoint, :create_data_point},
      url: "/v3/data_points",
      body: body,
      method: :post,
      request: [{"application/json", {DataPointCreate, :t}}],
      response: [
        {201, {DataPoint, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Create a data point choice

  Create a custom data point choice.
  """
  @spec create_data_point_choice(DataPointChoiceCreate.t(), keyword) ::
          {:ok, DataPointChoice.t()} | {:error, RequestError.t()}
  def create_data_point_choice(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIDataPoint, :create_data_point_choice},
      url: "/v3/data_point_choices",
      body: body,
      method: :post,
      request: [{"application/json", {DataPointChoiceCreate, :t}}],
      response: [
        {201, {DataPointChoice, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete a data point

  Deletes the specified data point from the database.
  """
  @spec delete_data_point(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_data_point(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIDataPoint, :delete_data_point},
      url: "/v3/data_points/#{identifier}",
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
  Delete a data point choice

  Deletes the specified data point choice from the database.
  """
  @spec delete_data_point_choice(integer, keyword) :: :ok | {:error, RequestError.t()}
  def delete_data_point_choice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIDataPoint, :delete_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
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
  @spec get_all_data_points(keyword) :: {:ok, [DataPoint.t()]} | {:error, RequestError.t()}
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
      call: {DocumentAPIDataPoint, :get_all_data_points},
      url: "/v3/data_points",
      method: :get,
      query: query,
      response: [
        {200, [{DataPoint, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific data point

  Return a specific data point.
  """
  @spec get_data_point(String.t(), keyword) :: {:ok, DataPoint.t()} | {:error, RequestError.t()}
  def get_data_point(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {DocumentAPIDataPoint, :get_data_point},
      url: "/v3/data_points/#{identifier}",
      method: :get,
      response: [
        {200, {DataPoint, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get specific data point choice

  Return a specific data point choice.
  """
  @spec get_data_point_choice(integer, keyword) ::
          {:ok, DataPointChoice.t()} | {:error, RequestError.t()}
  def get_data_point_choice(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {DocumentAPIDataPoint, :get_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
      method: :get,
      response: [
        {200, {DataPointChoice, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @type get_data_point_choices_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [DataPointChoice.t()]
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
  @spec get_data_point_choices(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_data_point_choices(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:collection, :data_point, :limit, :offset, :search])

    client.request(%{
      args: [],
      call: {DocumentAPIDataPoint, :get_data_point_choices},
      url: "/v3/data_point_choices",
      method: :get,
      query: query,
      response: [
        {200, {DocumentAPIDataPoint, :get_data_point_choices_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Replace choices of a data point

  Replace choices of a data point. Existing choices and incoming choices are matched base on their `value`. New `value` will be created, existing `value` will be updated, and `value` not in incoming choices will be deleted.
  """
  @spec replace_data_point_choices(DataPointChoiceReplaceRequest.t(), keyword) ::
          {:ok, DataPointChoiceReplaceResponse.t()} | {:error, RequestError.t()}
  def replace_data_point_choices(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DocumentAPIDataPoint, :replace_data_point_choices},
      url: "/v3/data_point_choices/replace",
      body: body,
      method: :post,
      request: [{"application/json", {DataPointChoiceReplaceRequest, :t}}],
      response: [
        {200, {DataPointChoiceReplaceResponse, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a data point

  Update data of a data point.
  """
  @spec update_data_point(String.t(), DataPointUpdate.t(), keyword) ::
          {:ok, DataPoint.t()} | {:error, RequestError.t()}
  def update_data_point(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {DocumentAPIDataPoint, :update_data_point},
      url: "/v3/data_points/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {DataPointUpdate, :t}}],
      response: [
        {200, {DataPoint, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a data point choice

  Update data of a data point choice.
  """
  @spec update_data_point_choice(integer, DataPointChoiceUpdate.t(), keyword) ::
          {:ok, DataPointChoice.t()} | {:error, RequestError.t()}
  def update_data_point_choice(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {DocumentAPIDataPoint, :update_data_point_choice},
      url: "/v3/data_point_choices/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", {DataPointChoiceUpdate, :t}}],
      response: [
        {200, {DataPointChoice, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_data_point_choices_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{DataPointChoice, :t}]
    ]
  end
end
