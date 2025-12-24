defmodule HubSpot.Companies.GDPR do
  @moduledoc """
  Provides API endpoint related to gdpr
  """

  @default_client HubSpot.Companies.Client

  @doc """
  GDPR DELETE

  Permanently delete a contact and all associated content to follow GDPR. Use optional property 'idProperty' set to 'email' to identify contact by email address. If email address is not found, the email address will be added to a blocklist and prevent it from being used in the future.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec gdpr_delete_purge(body :: HubSpot.Companies.PublicGdprDeleteInput.t(), opts :: keyword) ::
          :ok | {:error, HubSpot.Companies.Error.t()}
  def gdpr_delete_purge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.GDPR, :gdpr_delete_purge},
      url: "/crm/v3/objects/companies/gdpr-delete",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicGdprDeleteInput, :t}}],
      response: [{204, :null}, default: {HubSpot.Companies.Error, :t}],
      opts: opts
    })
  end
end
