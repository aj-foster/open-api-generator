defmodule Mollie.ClientsAPI do
  @moduledoc """
  Provides API endpoints related to clients api
  """

  @default_client Mollie.Client

  @type get_client_200__resp :: %{
          _embedded: Mollie.ClientsAPI.get_client_200__resp_embedded() | nil,
          _links: map | nil,
          commission: map | nil,
          id: map | nil,
          organizationCreatedAt: String.t() | nil,
          resource: String.t() | nil
        }

  @type get_client_200__resp_embedded :: %{
          capabilities: Mollie.EntityCapability.t() | nil,
          onboarding: Mollie.EntityOnboardingStatus.t() | nil,
          organization: Mollie.EntityOrganization.t() | nil
        }

  @doc """
  Get client

  Retrieve a single client by its ID.

  ## Options

    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.

  """
  @spec get_client(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.ClientsAPI.get_client_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def get_client(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed])

    client.request(%{
      args: [id: id],
      call: {Mollie.ClientsAPI, :get_client},
      url: "/clients/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ClientsAPI, :get_client_200__resp}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_clients_200__resp :: %{
          _embedded: Mollie.ClientsAPI.list_clients_200__resp_embedded() | nil,
          _links: Mollie.ListLinks.t() | nil,
          count: integer | nil
        }

  @type list_clients_200__resp_embedded :: %{
          clients: [Mollie.ClientsAPI.list_clients_200__resp_embedded_clients()] | nil
        }

  @type list_clients_200__resp_embedded_clients :: %{
          _embedded: Mollie.ClientsAPI.list_clients_200__resp_embedded_clients_embedded() | nil,
          _links: map | nil,
          commission: map | nil,
          id: map | nil,
          organizationCreatedAt: String.t() | nil,
          resource: String.t() | nil
        }

  @type list_clients_200__resp_embedded_clients_embedded :: %{
          capabilities: Mollie.EntityCapability.t() | nil,
          onboarding: Mollie.EntityOnboardingStatus.t() | nil,
          organization: Mollie.EntityOrganization.t() | nil
        }

  @doc """
  List clients

  Retrieve a list of all clients linked to your account.

  The results are paginated.

  ## Options

    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.

  """
  @spec list_clients(opts :: keyword) ::
          {:ok, Mollie.ClientsAPI.list_clients_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_clients(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit])

    client.request(%{
      args: [],
      call: {Mollie.ClientsAPI, :list_clients},
      url: "/clients",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ClientsAPI, :list_clients_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_client_200__resp) do
    [
      _embedded: {Mollie.ClientsAPI, :get_client_200__resp_embedded},
      _links: :map,
      commission: {:union, [:map, :null]},
      id: :map,
      organizationCreatedAt: :string,
      resource: :string
    ]
  end

  def __fields__(:get_client_200__resp_embedded) do
    [
      capabilities: {Mollie.EntityCapability, :t},
      onboarding: {Mollie.EntityOnboardingStatus, :t},
      organization: {Mollie.EntityOrganization, :t}
    ]
  end

  def __fields__(:list_clients_200__resp) do
    [
      _embedded: {Mollie.ClientsAPI, :list_clients_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_clients_200__resp_embedded) do
    [clients: [{Mollie.ClientsAPI, :list_clients_200__resp_embedded_clients}]]
  end

  def __fields__(:list_clients_200__resp_embedded_clients) do
    [
      _embedded: {Mollie.ClientsAPI, :list_clients_200__resp_embedded_clients_embedded},
      _links: :map,
      commission: {:union, [:map, :null]},
      id: :map,
      organizationCreatedAt: :string,
      resource: :string
    ]
  end

  def __fields__(:list_clients_200__resp_embedded_clients_embedded) do
    [
      capabilities: {Mollie.EntityCapability, :t},
      onboarding: {Mollie.EntityOnboardingStatus, :t},
      organization: {Mollie.EntityOrganization, :t}
    ]
  end
end
