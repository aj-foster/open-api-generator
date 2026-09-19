defmodule HubSpot.Companies.Search do
  @moduledoc """
  Provides API endpoint related to search
  """

  @default_client HubSpot.Companies.Client

  @doc """
  post `/crm/v3/objects/companies/search`

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec search_do_search(body :: HubSpot.Companies.PublicObjectSearchRequest.t(), opts :: keyword) ::
          {:ok, HubSpot.Companies.CollectionResponseWithTotalSimplePublicObjectForwardPaging.t()}
          | {:error, HubSpot.Companies.Error.t()}
  def search_do_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Search, :search_do_search},
      url: "/crm/v3/objects/companies/search",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicObjectSearchRequest, :t}}],
      response: [
        {200, {HubSpot.Companies.CollectionResponseWithTotalSimplePublicObjectForwardPaging, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end
end
