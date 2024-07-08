defmodule PublicObject do
  @moduledoc """
  Provides API endpoint related to public object
  """

  @default_client Client

  @doc """
  Merge two companies with same type
  """
  @spec merge_merge(PublicMergeInput.t(), keyword) ::
          {:ok, SimplePublicObject.t()} | {:error, Error.t()}
  def merge_merge(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {PublicObject, :merge_merge},
      url: "/crm/v3/objects/companies/merge",
      body: body,
      method: :post,
      request: [{"application/json", {PublicMergeInput, :t}}],
      response: [{200, {SimplePublicObject, :t}}, default: {Error, :t}],
      opts: opts
    })
  end
end
