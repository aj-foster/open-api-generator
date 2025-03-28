defmodule Invites do
  @moduledoc """
  Provides API endpoints related to invites
  """

  @default_client Client

  @doc """
  Delete an invite. If the invite has already been accepted, it cannot be deleted.
  """
  @spec delete_invite(invite_id :: String.t(), opts :: keyword) ::
          {:ok, InviteDeleteResponse.t()} | :error
  def delete_invite(invite_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [invite_id: invite_id],
      call: {Invites, :delete_invite},
      url: "/organization/invites/#{invite_id}",
      method: :delete,
      response: [{200, {InviteDeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create an invite for a user to the organization. The invite must be accepted by the user before they have access to the organization.
  """
  @spec invite_user(body :: InviteRequest.t(), opts :: keyword) :: {:ok, Invite.t()} | :error
  def invite_user(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Invites, :invite_user},
      url: "/organization/invites",
      body: body,
      method: :post,
      request: [{"application/json", {InviteRequest, :t}}],
      response: [{200, {Invite, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns a list of invites in the organization.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      

  """
  @spec list_invites(opts :: keyword) :: {:ok, InviteListResponse.t()} | :error
  def list_invites(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :limit])

    client.request(%{
      args: [],
      call: {Invites, :list_invites},
      url: "/organization/invites",
      method: :get,
      query: query,
      response: [{200, {InviteListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves an invite.
  """
  @spec retrieve_invite(invite_id :: String.t(), opts :: keyword) :: {:ok, Invite.t()} | :error
  def retrieve_invite(invite_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [invite_id: invite_id],
      call: {Invites, :retrieve_invite},
      url: "/organization/invites/#{invite_id}",
      method: :get,
      response: [{200, {Invite, :t}}],
      opts: opts
    })
  end
end
