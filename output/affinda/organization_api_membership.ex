defmodule OrganizationAPIMembership do
  @moduledoc """
  Provides API endpoints related to organization api membership
  """

  @default_client Client

  @doc """
  Delete an organization membership

  The admin users can use this endpoint to remove member from their organization. Other users can also use this to leave their organization.
  """
  @spec delete_organization_membership(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_organization_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIMembership, :delete_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
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

  @type get_all_organization_memberships_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [OrganizationMembership.t()]
        }

  @doc """
  Get list of all organization memberships

  Returns all the organization memberships

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `organization`: Filter by organization.
    * `role`: Filter by role.

  """
  @spec get_all_organization_memberships(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_all_organization_memberships(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :organization, :role])

    client.request(%{
      args: [],
      call: {OrganizationAPIMembership, :get_all_organization_memberships},
      url: "/v3/organization_memberships",
      method: :get,
      query: query,
      response: [
        {200, {OrganizationAPIMembership, :get_all_organization_memberships_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an organization membership

  Get detail of an organization membership.
  """
  @spec get_organization_membership(String.t(), keyword) ::
          {:ok, OrganizationMembership.t()} | {:error, RequestError.t()}
  def get_organization_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIMembership, :get_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
      method: :get,
      response: [
        {200, {OrganizationMembership, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization membership

  The admin users can use this endpoint to update the role of the members within their organization.
  """
  @spec update_organization_membership(String.t(), OrganizationMembershipUpdate.t(), keyword) ::
          {:ok, OrganizationMembership.t()} | {:error, RequestError.t()}
  def update_organization_membership(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {OrganizationAPIMembership, :update_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {OrganizationMembershipUpdate, :t}}],
      response: [
        {200, {OrganizationMembership, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_organization_memberships_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{OrganizationMembership, :t}]
    ]
  end
end
