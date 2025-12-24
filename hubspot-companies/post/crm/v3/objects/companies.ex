defmodule HubSpot.Companies.Post.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoints related to post/crm/v3/objects/companies
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
      call: {HubSpot.Companies.Post.Crm.V3.Objects.Companies, :gdpr_delete_purge},
      url: "/crm/v3/objects/companies/gdpr-delete",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicGdprDeleteInput, :t}}],
      response: [{204, :null}, default: {HubSpot.Companies.Error, :t}],
      opts: opts
    })
  end

  @doc """
  Merge two companies with same type

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec merge_merge(body :: HubSpot.Companies.PublicMergeInput.t(), opts :: keyword) ::
          {:ok, HubSpot.Companies.SimplePublicObject.t()} | {:error, HubSpot.Companies.Error.t()}
  def merge_merge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Post.Crm.V3.Objects.Companies, :merge_merge},
      url: "/crm/v3/objects/companies/merge",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicMergeInput, :t}}],
      response: [
        {200, {HubSpot.Companies.SimplePublicObject, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end

  @doc """
  post `/crm/v3/objects/companies/search`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec search_do_search(body :: HubSpot.Companies.PublicObjectSearchRequest.t(), opts :: keyword) ::
          {:ok, HubSpot.Companies.CollectionResponseWithTotalSimplePublicObjectForwardPaging.t()}
          | {:error, HubSpot.Companies.Error.t()}
  def search_do_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Post.Crm.V3.Objects.Companies, :search_do_search},
      url: "/crm/v3/objects/companies/search",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicObjectSearchRequest, :t}}],
      response: [
        {200, {HubSpot.Companies.CollectionResponseWithTotalSimplePublicObjectForwardPaging, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end
end
