defmodule HubSpot.Companies.Batch do
  @moduledoc """
  Provides API endpoints related to batch
  """

  @default_client HubSpot.Companies.Client

  @doc """
  Archive a batch of companies by ID

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec archive_archive(
          body :: HubSpot.Companies.BatchInputSimplePublicObjectId.t(),
          opts :: keyword
        ) :: :ok | {:error, HubSpot.Companies.Error.t()}
  def archive_archive(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Batch, :archive_archive},
      url: "/crm/v3/objects/companies/batch/archive",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.BatchInputSimplePublicObjectId, :t}}],
      response: [{204, :null}, default: {HubSpot.Companies.Error, :t}],
      opts: opts
    })
  end

  @doc """
  Create a batch of companies

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_create(
          body :: HubSpot.Companies.BatchInputSimplePublicObjectInputForCreate.t(),
          opts :: keyword
        ) ::
          {:ok,
           HubSpot.Companies.BatchResponseSimplePublicObject.t()
           | HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, HubSpot.Companies.Error.t()}
  def create_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Batch, :create_create},
      url: "/crm/v3/objects/companies/batch/create",
      body: body,
      method: :post,
      request: [
        {"application/json", {HubSpot.Companies.BatchInputSimplePublicObjectInputForCreate, :t}}
      ],
      response: [
        {201, {HubSpot.Companies.BatchResponseSimplePublicObject, :t}},
        {207, {HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {HubSpot.Companies.Error, :t}
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
  @spec read_read(
          body :: HubSpot.Companies.BatchReadInputSimplePublicObjectId.t(),
          opts :: keyword
        ) ::
          {:ok,
           HubSpot.Companies.BatchResponseSimplePublicObject.t()
           | HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, HubSpot.Companies.Error.t()}
  def read_read(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:archived])

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Batch, :read_read},
      url: "/crm/v3/objects/companies/batch/read",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {HubSpot.Companies.BatchReadInputSimplePublicObjectId, :t}}],
      response: [
        {200, {HubSpot.Companies.BatchResponseSimplePublicObject, :t}},
        {207, {HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update a batch of companies

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_update(
          body :: HubSpot.Companies.BatchInputSimplePublicObjectBatchInput.t(),
          opts :: keyword
        ) ::
          {:ok,
           HubSpot.Companies.BatchResponseSimplePublicObject.t()
           | HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors.t()}
          | {:error, HubSpot.Companies.Error.t()}
  def update_update(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Batch, :update_update},
      url: "/crm/v3/objects/companies/batch/update",
      body: body,
      method: :post,
      request: [
        {"application/json", {HubSpot.Companies.BatchInputSimplePublicObjectBatchInput, :t}}
      ],
      response: [
        {200, {HubSpot.Companies.BatchResponseSimplePublicObject, :t}},
        {207, {HubSpot.Companies.BatchResponseSimplePublicObjectWithErrors, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end
end
