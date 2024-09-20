defmodule Post.Crm.V3.Objects.Companies do
  @moduledoc """
  Provides API endpoints related to post/crm/v3/objects/companies
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
      call: {Post.Crm.V3.Objects.Companies, :gdpr_delete_purge},
      url: "/crm/v3/objects/companies/gdpr-delete",
      body: body,
      method: :post,
      request: [{"application/json", {PublicGdprDeleteInput, :t}}],
      response: [{204, :null}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  Merge two companies with same type
  """
  @spec merge_merge(PublicMergeInput.t(), keyword) ::
          {:ok, SimplePublicObject.t()} | {:error, Error.t()}
  def merge_merge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Post.Crm.V3.Objects.Companies, :merge_merge},
      url: "/crm/v3/objects/companies/merge",
      body: body,
      method: :post,
      request: [{"application/json", {PublicMergeInput, :t}}],
      response: [{200, {SimplePublicObject, :t}}, default: {Error, :t}],
      opts: opts
    })
  end

  @doc """
  post `/crm/v3/objects/companies/search`
  """
  @spec search_do_search(PublicObjectSearchRequest.t(), keyword) ::
          {:ok, CollectionResponseWithTotalSimplePublicObjectForwardPaging.t()}
          | {:error, Error.t()}
  def search_do_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Post.Crm.V3.Objects.Companies, :search_do_search},
      url: "/crm/v3/objects/companies/search",
      body: body,
      method: :post,
      request: [{"application/json", {PublicObjectSearchRequest, :t}}],
      response: [
        {200, {CollectionResponseWithTotalSimplePublicObjectForwardPaging, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end
end
