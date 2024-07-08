defmodule Post.Crm.V3.Objects do
  @moduledoc """
  Provides API endpoint related to post/crm/v3/objects
  """

  @default_client Client

  @doc """
  Create

  Create a company with the given properties and return a copy of the object, including the ID. Documentation and examples for creating standard companies is provided.
  """
  @spec companies_create(SimplePublicObjectInputForCreate.t(), keyword) ::
          {:ok, SimplePublicObject.t()} | {:error, Error.t()}
  def companies_create(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Post.Crm.V3.Objects, :companies_create},
      url: "/crm/v3/objects/companies",
      body: body,
      method: :post,
      request: [{"application/json", {SimplePublicObjectInputForCreate, :t}}],
      response: [{201, {SimplePublicObject, :t}}, default: {Error, :t}],
      opts: opts
    })
  end
end
