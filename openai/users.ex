defmodule Users do
  @moduledoc """
  Provides API endpoints related to users
  """

  @default_client Client

  @doc """
  Deletes a user from the organization.
  """
  @spec delete_user(user_id :: String.t(), opts :: keyword) ::
          {:ok, UserDeleteResponse.t()} | :error
  def delete_user(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Users, :delete_user},
      url: "/organization/users/#{user_id}",
      method: :delete,
      response: [{200, {UserDeleteResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Lists all of the users in the organization.

  ## Options

    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `emails`: Filter by the email address of users.

  """
  @spec list_users(opts :: keyword) :: {:ok, UserListResponse.t()} | :error
  def list_users(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:after, :emails, :limit])

    client.request(%{
      args: [],
      call: {Users, :list_users},
      url: "/organization/users",
      method: :get,
      query: query,
      response: [{200, {UserListResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Modifies a user's role in the organization.
  """
  @spec modify_user(user_id :: String.t(), body :: UserRoleUpdateRequest.t(), opts :: keyword) ::
          {:ok, User.t()} | :error
  def modify_user(user_id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id, body: body],
      call: {Users, :modify_user},
      url: "/organization/users/#{user_id}",
      body: body,
      method: :post,
      request: [{"application/json", {UserRoleUpdateRequest, :t}}],
      response: [{200, {User, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves a user by their identifier.
  """
  @spec retrieve_user(user_id :: String.t(), opts :: keyword) :: {:ok, User.t()} | :error
  def retrieve_user(user_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [user_id: user_id],
      call: {Users, :retrieve_user},
      url: "/organization/users/#{user_id}",
      method: :get,
      response: [{200, {User, :t}}],
      opts: opts
    })
  end
end
