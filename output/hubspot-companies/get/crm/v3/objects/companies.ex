defmodule Get.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoint related to get/crm/v3/objects/companies
  """

  @default_client Client

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
      call: {Get.Crm.V3.Objects.Companies, :company_id_get_by_id},
      url: "/crm/v3/objects/companies/#{companyId}",
      method: :get,
      query: query,
      response: [{200, {SimplePublicObjectWithAssociations, :t}}, default: {Error, :t}],
      opts: opts
    })
  end
end
