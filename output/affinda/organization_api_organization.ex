defmodule OrganizationAPIOrganization do
  @moduledoc """
  Provides API endpoints related to organization api organization
  """

  @default_client Client

  @doc """
  Create a new organization

  Create a new organization.
  """
  @spec create_organization(OrganizationCreate.t(), keyword) ::
          {:ok, Organization.t()} | {:error, RequestError.t()}
  def create_organization(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OrganizationAPIOrganization, :create_organization},
      url: "/v3/organizations",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {OrganizationCreate, :t}}],
      response: [
        {201, {Organization, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an organization

  Delete the specified organization from the database.
  """
  @spec delete_organization(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_organization(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIOrganization, :delete_organization},
      url: "/v3/organizations/#{identifier}",
      method: :delete,
      response: [
        {204, :null},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get list of all organizations

  Returns all the organizations
  """
  @spec get_all_organizations(keyword) :: {:ok, [Organization.t()]} | {:error, RequestError.t()}
  def get_all_organizations(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {OrganizationAPIOrganization, :get_all_organizations},
      url: "/v3/organizations",
      method: :get,
      response: [
        {200, [{Organization, :t}]},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an organization

  Get detail of an organization.
  """
  @spec get_organization(String.t(), keyword) ::
          {:ok, Organization.t()} | {:error, RequestError.t()}
  def get_organization(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIOrganization, :get_organization},
      url: "/v3/organizations/#{identifier}",
      method: :get,
      response: [
        {200, {Organization, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization

  Update the detail of an organization.
  """
  @spec update_organization(String.t(), OrganizationUpdate.t(), keyword) ::
          {:ok, Organization.t()} | {:error, RequestError.t()}
  def update_organization(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {OrganizationAPIOrganization, :update_organization},
      url: "/v3/organizations/#{identifier}",
      body: body,
      method: :patch,
      request: [{"multipart/form-data", {OrganizationUpdate, :t}}],
      response: [
        {200, {Organization, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end
end
