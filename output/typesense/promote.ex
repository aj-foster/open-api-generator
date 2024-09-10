defmodule Promote do
  @moduledoc """
  Provides API endpoints related to promote
  """

  @default_client Client

  @doc """
  Delete an override associated with a collection
  """
  @spec delete_search_override(String.t(), String.t(), keyword) ::
          {:ok, SearchOverride.t()} | {:error, ApiResponse.t()}
  def delete_search_override(collectionName, overrideId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId],
      call: {Promote, :delete_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      method: :delete,
      response: [{200, {SearchOverride, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  List all collection overrides
  """
  @spec get_search_overrides(String.t(), keyword) :: {:ok, SearchOverridesResponse.t()} | :error
  def get_search_overrides(collectionName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName],
      call: {Promote, :get_search_overrides},
      url: "/collections/#{collectionName}/overrides",
      method: :get,
      response: [{200, {SearchOverridesResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create or update an override to promote certain documents over others

  Create or update an override to promote certain documents over others. Using overrides, you can include or exclude specific documents for a given query.
  """
  @spec upsert_search_override(String.t(), String.t(), SearchOverrideSchema.t(), keyword) ::
          {:ok, SearchOverride.t()} | {:error, ApiResponse.t()}
  def upsert_search_override(collectionName, overrideId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [collectionName: collectionName, overrideId: overrideId, body: body],
      call: {Promote, :upsert_search_override},
      url: "/collections/#{collectionName}/overrides/#{overrideId}",
      body: body,
      method: :put,
      request: [{"application/json", {SearchOverrideSchema, :t}}],
      response: [{200, {SearchOverride, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end
end
