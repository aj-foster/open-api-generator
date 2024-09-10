defmodule GDPR do
  @moduledoc """
  Provides API endpoint related to gdpr
  """

  @default_client Client

  @doc """
  GDPR DELETE

  Permanently delete a contact and all associated content to follow GDPR. Use optional property 'idProperty' set to 'email' to identify contact by email address. If email address is not found, the email address will be added to a blocklist and prevent it from being used in the future.
  """
  @spec gdpr_delete_purge(PublicGdprDeleteInput.t(), keyword) :: :ok | {:error, Error.t()}
  def gdpr_delete_purge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {GDPR, :gdpr_delete_purge},
      url: "/crm/v3/objects/companies/gdpr-delete",
      body: body,
      method: :post,
      request: [{"application/json", {PublicGdprDeleteInput, :t}}],
      response: [{204, :null}, default: {Error, :t}],
      opts: opts
    })
  end
end
