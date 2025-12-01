defmodule Mollie.OrganizationsAPI do
  @moduledoc """
  Provides API endpoints related to organizations api
  """

  @default_client Mollie.Client

  @doc """
  Get current organization

  Retrieve the currently authenticated organization. A convenient alias of the [Get organization](get-organization)
  endpoint.

  For a complete reference of the organization object, refer to the [Get organization](get-organization) endpoint
  documentation.
  """
  @spec get_current_organization(opts :: keyword) :: {:ok, Mollie.EntityOrganization.t()} | :error
  def get_current_organization(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.OrganizationsAPI, :get_current_organization},
      url: "/organizations/me",
      method: :get,
      response: [{200, {Mollie.EntityOrganization, :t}}],
      opts: opts
    })
  end

  @doc """
  Get organization

  Retrieve a single organization by its ID.

  You can normally only retrieve the currently authenticated organization with this endpoint. This is primarily useful
  for OAuth apps. See also [Get current organization](get-current-organization).

  If you have a *partner account*', you can retrieve organization details of connected organizations.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_organization(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityOrganization.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_organization(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.OrganizationsAPI, :get_organization},
      url: "/organizations/#{id}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityOrganization, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type get_partner_status_200__resp :: %{
          _links: Mollie.OrganizationsAPI.get_partner_status_200__resp_links() | nil,
          isCommissionPartner: boolean | nil,
          partnerContractExpiresAt: String.t() | nil,
          partnerContractSignedAt: String.t() | nil,
          partnerContractUpdateAvailable: boolean | nil,
          partnerType: String.t(),
          resource: String.t(),
          userAgentTokens:
            [Mollie.OrganizationsAPI.get_partner_status_200__resp_user_agent_tokens()] | nil
        }

  @type get_partner_status_200__resp_links :: %{
          documentation: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil,
          signuplink: Mollie.Url.t() | nil
        }

  @type get_partner_status_200__resp_user_agent_tokens :: %{
          endsAt: String.t() | nil,
          startsAt: String.t() | nil,
          token: String.t() | nil
        }

  @doc """
  Get partner status

  Retrieve partnership details about the currently authenticated organization. Only relevant for so-called *partner
  accounts*.
  """
  @spec get_partner_status(opts :: keyword) ::
          {:ok, Mollie.OrganizationsAPI.get_partner_status_200__resp()} | :error
  def get_partner_status(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.OrganizationsAPI, :get_partner_status},
      url: "/organizations/me/partner",
      method: :get,
      response: [{200, {Mollie.OrganizationsAPI, :get_partner_status_200__resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_partner_status_200__resp) do
    [
      _links: {Mollie.OrganizationsAPI, :get_partner_status_200__resp_links},
      isCommissionPartner: :boolean,
      partnerContractExpiresAt: :string,
      partnerContractSignedAt: {:union, [:string, :null]},
      partnerContractUpdateAvailable: :boolean,
      partnerType: {:enum, ["oauth", "signuplink", "useragent"]},
      resource: :string,
      userAgentTokens: [
        {Mollie.OrganizationsAPI, :get_partner_status_200__resp_user_agent_tokens}
      ]
    ]
  end

  def __fields__(:get_partner_status_200__resp_links) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}, signuplink: {Mollie.Url, :t}]
  end

  def __fields__(:get_partner_status_200__resp_user_agent_tokens) do
    [endsAt: {:union, [:string, :null]}, startsAt: :string, token: :string]
  end
end
