defmodule Get.Crm.V3.Objects do
  @moduledoc """
  Provides API endpoint related to get/crm/v3/objects
  """

  @default_client Client

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
      call: {Get.Crm.V3.Objects, :companies_get_page},
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
end
