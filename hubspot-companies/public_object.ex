defmodule HubSpot.Companies.PublicObject do
  @moduledoc """
  Provides API endpoint related to public object
  """

  @default_client HubSpot.Companies.Client

  @doc """
  Merge two companies with same type

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec merge_merge(body :: HubSpot.Companies.PublicMergeInput.t(), opts :: keyword) ::
          {:ok, HubSpot.Companies.SimplePublicObject.t()} | {:error, HubSpot.Companies.Error.t()}
  def merge_merge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.PublicObject, :merge_merge},
      url: "/crm/v3/objects/companies/merge",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.PublicMergeInput, :t}}],
      response: [
        {200, {HubSpot.Companies.SimplePublicObject, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end
end
