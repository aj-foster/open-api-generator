defmodule Typesense.Override do
  @moduledoc """
  Provides API endpoint related to override
  """

  @default_client Typesense.Client

  @doc """
  Retrieve a single search override

  Retrieve the details of a search override, given its id.
  """
  @spec get_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | :error
  def get_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Typesense.Override, :get_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :get,
      response: [{200, {Typesense.SearchOverride, :t}}],
      opts: opts
    })
  end
end
