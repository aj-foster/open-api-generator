defmodule Batch do
  @moduledoc """
  Provides API endpoints related to batch
  """

  @default_client Client

  @doc """
  Archive a batch of companies by ID
  """
  @spec archive_archive(BatchInputSimplePublicObjectId.t(), keyword) :: :ok | {:error, Error.t()}
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
  """
  @spec create_create(BatchInputSimplePublicObjectInputForCreate.t(), keyword) ::
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

  """
  @spec read_read(BatchReadInputSimplePublicObjectId.t(), keyword) ::
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
  """
  @spec update_update(BatchInputSimplePublicObjectBatchInput.t(), keyword) ::
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
