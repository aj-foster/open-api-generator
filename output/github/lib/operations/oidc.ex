defmodule GitHub.Oidc do
  @moduledoc """
  Provides API endpoints related to oidc
  """

  @default_client GitHub.Client

  @doc """
  Get the customization template for an OIDC subject claim for an organization

  Gets the customization template for an OpenID Connect (OIDC) subject claim.

  OAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/actions/oidc#get-the-customization-template-for-an-oidc-subject-claim-for-an-organization)

  """
  @spec get_oidc_custom_sub_template_for_org(String.t(), keyword) ::
          {:ok, GitHub.OIDCCustomSub.t()} | {:error, GitHub.Error.t()}
  def get_oidc_custom_sub_template_for_org(org, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org],
      call: {GitHub.Oidc, :get_oidc_custom_sub_template_for_org},
      url: "/orgs/#{org}/actions/oidc/customization/sub",
      method: :get,
      response: [{200, {GitHub.OIDCCustomSub, :t}}],
      opts: opts
    })
  end

  @doc """
  Set the customization template for an OIDC subject claim for an organization

  Creates or updates the customization template for an OpenID Connect (OIDC) subject claim.

  OAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/actions/oidc#set-the-customization-template-for-an-oidc-subject-claim-for-an-organization)

  """
  @spec update_oidc_custom_sub_template_for_org(String.t(), GitHub.OIDCCustomSub.t(), keyword) ::
          {:ok, GitHub.EmptyObject.t()} | {:error, GitHub.Error.t()}
  def update_oidc_custom_sub_template_for_org(org, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [org: org, body: body],
      call: {GitHub.Oidc, :update_oidc_custom_sub_template_for_org},
      url: "/orgs/#{org}/actions/oidc/customization/sub",
      body: body,
      method: :put,
      request: [{"application/json", {GitHub.OIDCCustomSub, :t}}],
      response: [
        {201, {GitHub.EmptyObject, :t}},
        {403, {GitHub.BasicError, :t}},
        {404, {GitHub.BasicError, :t}}
      ],
      opts: opts
    })
  end
end
