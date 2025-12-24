defmodule HubSpot.Companies.Delete.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoint related to delete/crm/v3/objects/companies
  """

  @default_client HubSpot.Companies.Client

  @doc """
  Archive

  Move an Object identified by `{companyId}` to the recycling bin.
  """
  @spec company_id_archive(companyId :: String.t(), opts :: keyword) ::
          :ok | {:error, HubSpot.Companies.Error.t()}
  def company_id_archive(companyId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [companyId: companyId],
      call: {HubSpot.Companies.Delete.Crm.V3.Objects.Companies, :company_id_archive},
      url: "/crm/v3/objects/companies/#{companyId}",
      method: :delete,
      response: [{204, :null}, default: {HubSpot.Companies.Error, :t}],
      opts: opts
    })
  end
end
