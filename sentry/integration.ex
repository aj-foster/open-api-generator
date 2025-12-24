defmodule Sentry.Integration do
  @moduledoc """
  Provides API endpoints related to integration
  """

  @default_client Sentry.Client

  @type create_an_external_issue_200_json_resp :: %{
          displayName: String.t(),
          id: String.t(),
          issueId: String.t(),
          serviceType: String.t(),
          webUrl: String.t()
        }

  @doc """
  post `/api/0/sentry-app-installations/{uuid}/external-issues/`

  Create an external issue from an integration platform integration.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_an_external_issue(uuid :: String.t(), body :: map) ::
          {:ok, Sentry.Integration.create_an_external_issue_200_json_resp()} | :error
  @spec create_an_external_issue(uuid :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Sentry.Integration.create_an_external_issue_200_json_resp()} | :error
  def create_an_external_issue(uuid, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [uuid: uuid, body: body],
      call: {Sentry.Integration, :create_an_external_issue},
      url: "/api/0/sentry-app-installations/#{uuid}/external-issues/",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {Sentry.Integration, :create_an_external_issue_200_json_resp}},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  delete `/api/0/sentry-app-installations/{uuid}/external-issues/{external_issue_id}/`

  Delete an external issue.
  """
  @spec delete_an_external_issue(uuid :: String.t(), external_issue_id :: String.t()) ::
          :ok | :error
  @spec delete_an_external_issue(
          uuid :: String.t(),
          external_issue_id :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def delete_an_external_issue(uuid, external_issue_id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [uuid: uuid, external_issue_id: external_issue_id],
      call: {Sentry.Integration, :delete_an_external_issue},
      url: "/api/0/sentry-app-installations/#{uuid}/external-issues/#{external_issue_id}/",
      method: :delete,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @type list_an_organization_s_integration_platform_installations_200_json_resp :: %{
          app:
            Sentry.Integration.list_an_organization_s_integration_platform_installations_200_json_resp_app(),
          organization:
            Sentry.Integration.list_an_organization_s_integration_platform_installations_200_json_resp_organization(),
          status: String.t(),
          uuid: String.t()
        }

  @type list_an_organization_s_integration_platform_installations_200_json_resp_app :: %{
          slug: String.t(),
          uuid: String.t()
        }

  @type list_an_organization_s_integration_platform_installations_200_json_resp_organization :: %{
          slug: String.t()
        }

  @doc """
  get `/api/0/organizations/{organization_id_or_slug}/sentry-app-installations/`

  Return a list of integration platform installations for a given organization.
  """
  @spec list_an_organization_s_integration_platform_installations(
          organization_id_or_slug :: String.t()
        ) ::
          {:ok,
           [
             Sentry.Integration.list_an_organization_s_integration_platform_installations_200_json_resp()
           ]}
          | :error
  @spec list_an_organization_s_integration_platform_installations(
          organization_id_or_slug :: String.t(),
          opts :: keyword
        ) ::
          {:ok,
           [
             Sentry.Integration.list_an_organization_s_integration_platform_installations_200_json_resp()
           ]}
          | :error
  def list_an_organization_s_integration_platform_installations(
        organization_id_or_slug,
        opts \\ []
      ) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug],
      call: {Sentry.Integration, :list_an_organization_s_integration_platform_installations},
      url: "/api/0/organizations/#{organization_id_or_slug}/sentry-app-installations/",
      method: :get,
      response: [
        {200,
         [
           {Sentry.Integration,
            :list_an_organization_s_integration_platform_installations_200_json_resp}
         ]},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_an_external_issue_200_json_resp) do
    [displayName: :string, id: :string, issueId: :string, serviceType: :string, webUrl: :string]
  end

  def __fields__(:list_an_organization_s_integration_platform_installations_200_json_resp) do
    [
      app:
        {Sentry.Integration,
         :list_an_organization_s_integration_platform_installations_200_json_resp_app},
      organization:
        {Sentry.Integration,
         :list_an_organization_s_integration_platform_installations_200_json_resp_organization},
      status: :string,
      uuid: :string
    ]
  end

  def __fields__(:list_an_organization_s_integration_platform_installations_200_json_resp_app) do
    [slug: :string, uuid: :string]
  end

  def __fields__(
        :list_an_organization_s_integration_platform_installations_200_json_resp_organization
      ) do
    [slug: :string]
  end
end
