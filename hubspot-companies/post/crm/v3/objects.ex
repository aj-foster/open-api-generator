defmodule HubSpot.Companies.Post.Crm.V3.Objects do
  @moduledoc """
  Provides API endpoint related to post/crm/v3/objects
  """

  @default_client HubSpot.Companies.Client

  @doc """
  Create

  Create a company with the given properties and return a copy of the object, including the ID. Documentation and examples for creating standard companies is provided.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec companies_create(
          body :: HubSpot.Companies.SimplePublicObjectInputForCreate.t(),
          opts :: keyword
        ) ::
          {:ok, HubSpot.Companies.SimplePublicObject.t()} | {:error, HubSpot.Companies.Error.t()}
  def companies_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {HubSpot.Companies.Post.Crm.V3.Objects, :companies_create},
      url: "/crm/v3/objects/companies",
      body: body,
      method: :post,
      request: [{"application/json", {HubSpot.Companies.SimplePublicObjectInputForCreate, :t}}],
      response: [
        {201, {HubSpot.Companies.SimplePublicObject, :t}},
        default: {HubSpot.Companies.Error, :t}
      ],
      opts: opts
    })
  end
end
