defmodule OrganizationAPIInvitation do
  @moduledoc """
  Provides API endpoints related to organization api invitation
  """

  @default_client Client

  @doc """
  Create a new invitation

  Create a new invitation.
  """
  @spec create_invitation(InvitationCreate.t(), keyword) ::
          {:ok, Invitation.t()} | {:error, RequestError.t()}
  def create_invitation(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {OrganizationAPIInvitation, :create_invitation},
      url: "/v3/invitations",
      body: body,
      method: :post,
      request: [{"application/json", {InvitationCreate, :t}}],
      response: [
        {201, {Invitation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Delete an invitation

  Delete the specified invitation from the database.
  """
  @spec delete_invitation(String.t(), keyword) :: :ok | {:error, RequestError.t()}
  def delete_invitation(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIInvitation, :delete_invitation},
      url: "/v3/invitations/#{identifier}",
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

  @type get_all_invitations_200_json_resp :: %{
          count: integer,
          next: String.t() | nil,
          previous: String.t() | nil,
          results: [Invitation.t()]
        }

  @doc """
  Get list of all invitations

  Get list of all invitations you created or sent to you.

  ## Options

    * `offset`: The number of documents to skip before starting to collect the result set.
    * `limit`: The numbers of results to return.
    * `organization`: Filter by organization.
    * `status`: Filter by status.
    * `role`: Filter by role.

  """
  @spec get_all_invitations(keyword) :: {:ok, map} | {:error, RequestError.t()}
  def get_all_invitations(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :offset, :organization, :role, :status])

    client.request(%{
      args: [],
      call: {OrganizationAPIInvitation, :get_all_invitations},
      url: "/v3/invitations",
      method: :get,
      query: query,
      response: [
        {200, {OrganizationAPIInvitation, :get_all_invitations_200_json_resp}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an invitation

  Get detail of an invitation.
  """
  @spec get_invitation(String.t(), keyword) :: {:ok, Invitation.t()} | {:error, RequestError.t()}
  def get_invitation(identifier, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier],
      call: {OrganizationAPIInvitation, :get_invitation},
      url: "/v3/invitations/#{identifier}",
      method: :get,
      response: [
        {200, {Invitation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Get detail of an invitation by token

  Get detail of an invitation using a secret token. This allows users who have not registered/logged in to view the invitation.
  """
  @spec get_invitation_by_token(String.t(), keyword) ::
          {:ok, Invitation.t()} | {:error, RequestError.t()}
  def get_invitation_by_token(token, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [token: token],
      call: {OrganizationAPIInvitation, :get_invitation_by_token},
      url: "/v3/invitations/token/#{token}",
      method: :get,
      response: [{200, {Invitation, :t}}, {400, {RequestError, :t}}, default: {RequestError, :t}],
      opts: opts
    })
  end

  @doc """
  Respond to an invitation

  Choose to accept or decline an invitation.
  """
  @spec respond_to_invitation(String.t(), InvitationResponse.t(), keyword) ::
          {:ok, Invitation.t()} | {:error, RequestError.t()}
  def respond_to_invitation(token, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [token: token, body: body],
      call: {OrganizationAPIInvitation, :respond_to_invitation},
      url: "/v3/invitations/token/#{token}",
      body: body,
      method: :patch,
      request: [{"application/json", {InvitationResponse, :t}}],
      response: [
        {200, {Invitation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc """
  Update an invitation

  Update the detail of an invitation.
  """
  @spec update_invitation(String.t(), InvitationUpdate.t(), keyword) ::
          {:ok, Invitation.t()} | {:error, RequestError.t()}
  def update_invitation(identifier, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [identifier: identifier, body: body],
      call: {OrganizationAPIInvitation, :update_invitation},
      url: "/v3/invitations/#{identifier}",
      body: body,
      method: :patch,
      request: [{"application/json", {InvitationUpdate, :t}}],
      response: [
        {200, {Invitation, :t}},
        {400, {RequestError, :t}},
        {401, {RequestError, :t}},
        default: {RequestError, :t}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_all_invitations_200_json_resp) do
    [
      count: :integer,
      next: {:string, :generic},
      previous: {:string, :generic},
      results: [{Invitation, :t}]
    ]
  end
end
