defmodule Mollie.PermissionsAPI do
  @moduledoc """
  Provides API endpoints related to permissions api
  """

  @default_client Mollie.Client

  @doc """
  Get permission

  Retrieve a single permission by its ID, and see if the permission is granted to the current access token.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_permission(permissionId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityPermission.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_permission(permissionId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [permissionId: permissionId],
      call: {Mollie.PermissionsAPI, :get_permission},
      url: "/permissions/#{permissionId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityPermission, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_permissions_200__resp :: %{
          _embedded: Mollie.PermissionsAPI.list_permissions_200__resp_embedded(),
          _links: Mollie.PermissionsAPI.list_permissions_200__resp_links(),
          count: integer
        }

  @type list_permissions_200__resp_embedded :: %{permissions: [Mollie.EntityPermission.t()]}

  @type list_permissions_200__resp_links :: %{
          documentation: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  @doc """
  List permissions

  Retrieve a list of all permissions available to the current access token.

  The results are **not** paginated.
  """
  @spec list_permissions(opts :: keyword) ::
          {:ok, Mollie.PermissionsAPI.list_permissions_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_permissions(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.PermissionsAPI, :list_permissions},
      url: "/permissions",
      method: :get,
      response: [
        {200, {Mollie.PermissionsAPI, :list_permissions_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_permissions_200__resp) do
    [
      _embedded: {Mollie.PermissionsAPI, :list_permissions_200__resp_embedded},
      _links: {Mollie.PermissionsAPI, :list_permissions_200__resp_links},
      count: :integer
    ]
  end

  def __fields__(:list_permissions_200__resp_embedded) do
    [permissions: [{Mollie.EntityPermission, :t}]]
  end

  def __fields__(:list_permissions_200__resp_links) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
