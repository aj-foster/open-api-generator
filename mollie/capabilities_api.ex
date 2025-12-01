defmodule Mollie.CapabilitiesAPI do
  @moduledoc """
  Provides API endpoint related to capabilities api
  """

  @default_client Mollie.Client

  @type list_capabilities_200__resp :: %{
          _embedded: Mollie.CapabilitiesAPI.list_capabilities_200__resp_embedded(),
          _links: Mollie.CapabilitiesAPI.list_capabilities_200__resp_links(),
          count: integer
        }

  @type list_capabilities_200__resp_embedded :: %{capabilities: [Mollie.EntityCapability.t()]}

  @type list_capabilities_200__resp_links :: %{documentation: Mollie.Url.t() | nil}

  @doc """
  List capabilities

  > 🚧 Beta feature
  >
  > This feature is currently in beta testing, and the final specification may still change.

  Retrieve a list of capabilities for an organization.

  This API provides detailed insights into the specific requirements and status of each client's onboarding journey.

  Capabilities are at the organization level, indicating if the organization can perform a given capability.

  For payments, regardless them being at the profile level, the capability is listed at the organization level.
  This means that if at least one of the clients's profiles can receive payments,
  the payments capability is enabled, communicating that the organization can indeed receive payments.
  """
  @spec list_capabilities(opts :: keyword) ::
          {:ok, Mollie.CapabilitiesAPI.list_capabilities_200__resp()} | :error
  def list_capabilities(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.CapabilitiesAPI, :list_capabilities},
      url: "/capabilities",
      method: :get,
      response: [{200, {Mollie.CapabilitiesAPI, :list_capabilities_200__resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_capabilities_200__resp) do
    [
      _embedded: {Mollie.CapabilitiesAPI, :list_capabilities_200__resp_embedded},
      _links: {Mollie.CapabilitiesAPI, :list_capabilities_200__resp_links},
      count: :integer
    ]
  end

  def __fields__(:list_capabilities_200__resp_embedded) do
    [capabilities: [{Mollie.EntityCapability, :t}]]
  end

  def __fields__(:list_capabilities_200__resp_links) do
    [documentation: {Mollie.Url, :t}]
  end
end
