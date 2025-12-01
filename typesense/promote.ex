defmodule Typesense.Promote do
  @moduledoc """
  Provides API endpoints related to promote
  """

  @default_client Typesense.Client

  @doc """
  Delete an override associated with a collection
  """
  @spec delete_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | {:error, Typesense.ApiResponse.t()}
  def delete_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Typesense.Promote, :delete_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :delete,
      response: [{200, {Typesense.SearchOverride, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collection overrides
  """
  @spec get_search_overrides(collectionName :: String.t(), opts :: keyword) ::
          {:ok, Typesense.SearchOverridesResponse.t()} | :error
  def get_search_overrides(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Typesense.Promote, :get_search_overrides},
      url: "/collections/#{collectionName}/overrides",
      method: :get,
      response: [{200, {Typesense.SearchOverridesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create or update an override to promote certain documents over others

  Create or update an override to promote certain documents over others. Using overrides, you can include or exclude specific documents for a given query.

  ## Request Body

  **Content Types**: `application/json`

  The search override object to be created/updated
  """
  @spec upsert_search_override(
          collectionName :: String.t(),
          overrideId :: String.t(),
          body :: Typesense.SearchOverrideSchema.t(),
          opts :: keyword
        ) :: {:ok, Typesense.SearchOverride.t()} | {:error, Typesense.ApiResponse.t()}
  def upsert_search_override(collectionName, overrideId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId, body: body],
      call: {Typesense.Promote, :upsert_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      body: body,
      method: :put,
      request: [{"application/json", {Typesense.SearchOverrideSchema, :t}}],
      response: [{200, {Typesense.SearchOverride, :t}}, {404, {Typesense.ApiResponse, :t}}],
      opts: opts
    })
  end
end
