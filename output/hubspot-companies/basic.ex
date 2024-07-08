defmodule Basic do
  @moduledoc """
  Provides API endpoints related to basic
  """

  @default_client Client

  @doc """
  Create

  Create a company with the given properties and return a copy of the object, including the ID. Documentation and examples for creating standard companies is provided.
  """
  @spec companies_create(SimplePublicObjectInputForCreate.t(), keyword) ::
          {:ok, SimplePublicObject.t()} | {:error, Error.t()}
  def companies_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Basic, :companies_create},
      url: "/crm/v3/objects/companies",
      body: body,
      method: :post,
      request: [{"application/json", {SimplePublicObjectInputForCreate, :t}}],
      response: [{201, {SimplePublicObject, :t}}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  List

  Read a page of companies. Control what is returned via the `properties` query param.

  ## Options

    * `limit`: The maximum number of results to display per page.
    * `after`: The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    * `properties`: A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    * `propertiesWithHistory`: A comma separated list of the properties to be returned along with their history of previous values. If any of the specified properties are not present on the requested object(s), they will be ignored. Usage of this parameter will reduce the maximum number of objects that can be read by a single request.
    * `associations`: A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    * `archived`: Whether to return only results that have been archived.

  """
  @spec companies_get_page(keyword) ::
          {:ok, CollectionResponseSimplePublicObjectWithAssociationsForwardPaging.t()}
          | {:error, Error.t()}
  def companies_get_page(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :after,
        :archived,
        :associations,
        :limit,
        :properties,
        :propertiesWithHistory
      ])

    client.request(%{
      args: [],
      call: {Basic, :companies_get_page},
      url: "/crm/v3/objects/companies",
      method: :get,
      query: query,
      response: [
        {200, {CollectionResponseSimplePublicObjectWithAssociationsForwardPaging, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Archive

  Move an Object identified by `{companyId}` to the recycling bin.
  """
  @spec company_id_archive(String.t(), keyword) :: :ok | {:error, Error.t()}
  def company_id_archive(companyId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [companyId: companyId],
      call: {Basic, :company_id_archive},
      url: "/crm/v3/objects/companies/#{companyId}",
      method: :delete,
      response: [{204, :null}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  Read

  Read an Object identified by `{companyId}`. `{companyId}` refers to the internal object ID by default, or optionally any unique property value as specified by the `idProperty` query param.  Control what is returned via the `properties` query param.

  ## Options

    * `properties`: A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    * `propertiesWithHistory`: A comma separated list of the properties to be returned along with their history of previous values. If any of the specified properties are not present on the requested object(s), they will be ignored.
    * `associations`: A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    * `archived`: Whether to return only results that have been archived.
    * `idProperty`: The name of a property whose values are unique for this object type

  """
  @spec company_id_get_by_id(String.t(), keyword) ::
          {:ok, SimplePublicObjectWithAssociations.t()} | {:error, Error.t()}
  def company_id_get_by_id(companyId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :archived,
        :associations,
        :idProperty,
        :properties,
        :propertiesWithHistory
      ])

    client.request(%{
      args: [companyId: companyId],
      call: {Basic, :company_id_get_by_id},
      url: "/crm/v3/objects/companies/#{companyId}",
      method: :get,
      query: query,
      response: [{200, {SimplePublicObjectWithAssociations, :t}}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  Update

  Perform a partial update of an Object identified by `{companyId}`. `{companyId}` refers to the internal object ID by default, or optionally any unique property value as specified by the `idProperty` query param. Provided property values will be overwritten. Read-only and non-existent properties will be ignored. Properties values can be cleared by passing an empty string.

  ## Options

    * `idProperty`: The name of a property whose values are unique for this object type

  """
  @spec company_id_update(String.t(), SimplePublicObjectInput.t(), keyword) ::
          {:ok, SimplePublicObject.t()} | {:error, Error.t()}
  def company_id_update(companyId, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:idProperty])

    client.request(%{
      args: [companyId: companyId, body: body],
      call: {Basic, :company_id_update},
      url: "/crm/v3/objects/companies/#{companyId}",
      body: body,
      method: :patch,
      query: query,
      request: [{"application/json", {SimplePublicObjectInput, :t}}],
      response: [{200, {SimplePublicObject, :t}}, default: {Error, :t}],
      opts: opts
    })
  end
end
