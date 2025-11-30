defmodule Affinda.OrganizationAPIOrganization do
  @moduledoc """
  Provides API endpoints related to organization api organization
  """

  @default_client Affinda.Client

  @doc """
  Create a new organization

  Create a new organization.

  ## Request Body

  **Content Types**: `multipart/form-data`

  Organization to create.
  """
  @spec create_organization(body :: Affinda.OrganizationCreate.t(), opts :: keyword) ::
          {:ok, Affinda.Organization.t()} | {:error, Affinda.RequestError.t()}
  def create_organization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Affinda.OrganizationAPIOrganization, :create_organization},
      url: "/v3/organizations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {Affinda.OrganizationCreate, :t}}],
      response: [
        {201, {Affinda.Organization, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an organization

  Delete the specified organization from the database.
  """
  @spec delete_organization(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_organization(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.OrganizationAPIOrganization, :delete_organization},
      url: "/v3/organizations/#{identifier}",
      method: :delete,
      response: [
        {204, :null},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get list of all organizations

  Returns all the organizations
  """
  @spec get_all_organizations(opts :: keyword) ::
          {:ok, [Affinda.Organization.t()]} | {:error, Affinda.RequestError.t()}
  def get_all_organizations(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Affinda.OrganizationAPIOrganization, :get_all_organizations},
      url: "/v3/organizations",
      method: :get,
      response: [
        {200, [{Affinda.Organization, :t}]},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an organization

  Get detail of an organization.
  """
  @spec get_organization(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.Organization.t()} | {:error, Affinda.RequestError.t()}
  def get_organization(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.OrganizationAPIOrganization, :get_organization},
      url: "/v3/organizations/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.Organization, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization

  Update the detail of an organization.

  ## Request Body

  **Content Types**: `multipart/form-data`
  """
  @spec update_organization(
          identifier :: String.t(),
          body :: Affinda.OrganizationUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.Organization.t()} | {:error, Affinda.RequestError.t()}
  def update_organization(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.OrganizationAPIOrganization, :update_organization},
      url: "/v3/organizations/#{identifier}",
      body: body,
      method: :patch,
      request: [{"multipart/form-data", {Affinda.OrganizationUpdate, :t}}],
      response: [
        {200, {Affinda.Organization, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end
end
