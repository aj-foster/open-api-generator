defmodule Delete.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoint related to delete/crm/v3/objects/companies
  """

  @default_client Client

  @doc """
  Archive

  Move an Object identified by `{companyId}` to the recycling bin.
  """
  @spec company_id_archive(String.t(), keyword) :: :ok | {:error, Error.t()}
  def company_id_archive(companyId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [companyId: companyId],
      call: {Delete.Crm.V3.Objects.Companies, :company_id_archive},
      url: "/crm/v3/objects/companies/#{companyId}",
      method: :delete,
      response: [{204, :null}, default: {Error, :t}],
      opts: opts
    })
  end
end
