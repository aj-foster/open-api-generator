defmodule Search do
  @moduledoc """
  Provides API endpoint related to search
  """

  @default_client Client

  @doc """
  post `/crm/v3/objects/companies/search`
  """
  @spec search_do_search(PublicObjectSearchRequest.t(), keyword) ::
          {:ok, CollectionResponseWithTotalSimplePublicObjectForwardPaging.t()}
          | {:error, Error.t()}
  def search_do_search(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Search, :search_do_search},
      url: "/crm/v3/objects/companies/search",
      body: body,
      method: :post,
      request: [{"application/json", {PublicObjectSearchRequest, :t}}],
      response: [
        {200, {CollectionResponseWithTotalSimplePublicObjectForwardPaging, :t}},
        default: {Error, :t}
      ],
      opts: opts
    })
  end
end
