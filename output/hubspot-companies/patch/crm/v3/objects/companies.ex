defmodule Patch.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoint related to patch/crm/v3/objects/companies
  """

  @default_client Client

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
      call: {Patch.Crm.V3.Objects.Companies, :company_id_update},
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
