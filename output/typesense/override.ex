defmodule Override do
  @moduledoc """
  Provides API endpoint related to override
  """

  @default_client Client

  @doc """
  Retrieve a single search override

  Retrieve the details of a search override, given its id.
  """
  @spec get_search_override(String.t(), String.t(), keyword) :: {:ok, SearchOverride.t()} | :error
  def get_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Override, :get_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :get,
      response: [{200, {SearchOverride, :t}}],
      opts: opts
    })
  end
end
