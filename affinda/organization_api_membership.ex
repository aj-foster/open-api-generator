defmodule Affinda.OrganizationAPIMembership do
  @moduledoc """
  Provides API endpoints related to organization api membership
  """

  @default_client Affinda.Client

  @doc """
  Delete an organization membership

  The admin users can use this endpoint to remove member from their organization. Other users can also use this to leave their organization.
  """
  @spec delete_organization_membership(identifier :: String.t(), opts :: keyword) ::
          :ok | {:error, Affinda.RequestError.t()}
  def delete_organization_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.OrganizationAPIMembership, :delete_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
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

  @type get_all_organization_memberships_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.OrganizationMembership.t()]
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
  @spec get_all_organization_memberships(opts :: keyword) ::
          {:ok,
           Affinda.OrganizationAPIMembership.get_all_organization_memberships_200_json_resp()}
          | {:error, Affinda.RequestError.t()}
  def get_all_organization_memberships(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :organization, :role])

    client.request(%{
      args: [],
      call: {Affinda.OrganizationAPIMembership, :get_all_organization_memberships},
      url: "/v3/organization_memberships",
      method: :get,
      query: query,
      response: [
        {200,
         {Affinda.OrganizationAPIMembership, :get_all_organization_memberships_200_json_resp}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an organization membership

  Get detail of an organization membership.
  """
  @spec get_organization_membership(identifier :: String.t(), opts :: keyword) ::
          {:ok, Affinda.OrganizationMembership.t()} | {:error, Affinda.RequestError.t()}
  def get_organization_membership(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {Affinda.OrganizationAPIMembership, :get_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
      method: :get,
      response: [
        {200, {Affinda.OrganizationMembership, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an organization membership

  The admin users can use this endpoint to update the role of the members within their organization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_organization_membership(
          identifier :: String.t(),
          body :: Affinda.OrganizationMembershipUpdate.t(),
          opts :: keyword
        ) :: {:ok, Affinda.OrganizationMembership.t()} | {:error, Affinda.RequestError.t()}
  def update_organization_membership(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {Affinda.OrganizationAPIMembership, :update_organization_membership},
      url: "/v3/organization_memberships/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {Affinda.OrganizationMembershipUpdate, :t}}],
      response: [
        {200, {Affinda.OrganizationMembership, :t}},
        {400, {Affinda.RequestError, :t}},
        {401, {Affinda.RequestError, :t}},
        default: {Affinda.RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_organization_memberships_200_json_resp) do
    [
      count: :integer,
      next: :string,
      previous: :string,
      results: [{Affinda.OrganizationMembership, :t}]
    ]
  end
end
