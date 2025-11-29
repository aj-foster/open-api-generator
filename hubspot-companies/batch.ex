defmodule Batch do
  @moduledoc """
  Provides API endpoints related to batch
  """

  @default_client Client

  @doc """
  Archive a batch of companies by ID

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec archive_archive(body :: BatchInputSimplePublicObjectId.t(), opts :: keyword) ::
          :ok | {:error, Error.t()}
  def archive_archive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Batch, :archive_archive},
      url: "/crm/v3/objects/companies/batch/archive",
      body: body,
      method: :post,
      request: [{"application/json", {BatchInputSimplePublicObjectId, :t}}],
      response: [{204, :null}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  Create a batch of companies

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_create(body :: BatchInputSimplePublicObjectInputForCreate.t(), opts :: keyword) ::
          {:ok,
           BatchResponseSimplePublicObject.t() | BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, Error.t()}
  def create_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Batch, :create_create},
      url: "/crm/v3/objects/companies/batch/create",
      body: body,
      method: :post,
      request: [{"application/json", {BatchInputSimplePublicObjectInputForCreate, :t}}],
      response: [
        {201, {BatchResponseSimplePublicObject, :t}},
        {207, {BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Read a batch of companies by internal ID, or unique property values

  ## Options

    * `archived`: Whether to return only results that have been archived.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec read_read(body :: BatchReadInputSimplePublicObjectId.t(), opts :: keyword) ::
          {:ok,
           BatchResponseSimplePublicObject.t() | BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, Error.t()}
  def read_read(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived])

    client.request(%{
      args: [body: body],
      call: {Batch, :read_read},
      url: "/crm/v3/objects/companies/batch/read",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {BatchReadInputSimplePublicObjectId, :t}}],
      response: [
        {200, {BatchResponseSimplePublicObject, :t}},
        {207, {BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a batch of companies

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_update(body :: BatchInputSimplePublicObjectBatchInput.t(), opts :: keyword) ::
          {:ok,
           BatchResponseSimplePublicObject.t() | BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, Error.t()}
  def update_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Batch, :update_update},
      url: "/crm/v3/objects/companies/batch/update",
      body: body,
      method: :post,
      request: [{"application/json", {BatchInputSimplePublicObjectBatchInput, :t}}],
      response: [
        {200, {BatchResponseSimplePublicObject, :t}},
        {207, {BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end
end
