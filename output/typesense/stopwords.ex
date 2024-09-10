defmodule Stopwords do
  @moduledoc """
  Provides API endpoints related to stopwords
  """

  @default_client Client

  @type delete_stopwords_set_200_json_resp :: %{id: String.t()}

  @doc """
  Delete a stopwords set.

  Permanently deletes a stopwords set, given it's name.
  """
  @spec delete_stopwords_set(String.t(), keyword) :: {:ok, map} | {:error, ApiResponse.t()}
  def delete_stopwords_set(setId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [setId: setId],
      call: {Stopwords, :delete_stopwords_set},
      url: "/stopwords/#{setId}",
      method: :delete,
      response: [
        {200, {Stopwords, :delete_stopwords_set_200_json_resp}},
        {404, {ApiResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Retrieves a stopwords set.

  Retrieve the details of a stopwords set, given it's name.
  """
  @spec retrieve_stopwords_set(String.t(), keyword) ::
          {:ok, StopwordsSetRetrieveSchema.t()} | {:error, ApiResponse.t()}
  def retrieve_stopwords_set(setId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [setId: setId],
      call: {Stopwords, :retrieve_stopwords_set},
      url: "/stopwords/#{setId}",
      method: :get,
      response: [{200, {StopwordsSetRetrieveSchema, :t}}, {404, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Retrieves all stopwords sets.

  Retrieve the details of all stopwords sets
  """
  @spec retrieve_stopwords_sets(keyword) :: {:ok, StopwordsSetRetrieveSchema.t()} | :error
  def retrieve_stopwords_sets(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Stopwords, :retrieve_stopwords_sets},
      url: "/stopwords",
      method: :get,
      response: [{200, {StopwordsSetRetrieveSchema, :t}}],
      opts: opts
    })
  end

  @doc """
  Upserts a stopwords set.

  When an analytics rule is created, we give it a name and describe the type, the source collections and the destination collection.
  """
  @spec upsert_stopwords_set(String.t(), StopwordsSetUpsertSchema.t(), keyword) ::
          {:ok, StopwordsSetSchema.t()} | {:error, ApiResponse.t()}
  def upsert_stopwords_set(setId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [setId: setId, body: body],
      call: {Stopwords, :upsert_stopwords_set},
      url: "/stopwords/#{setId}",
      body: body,
      method: :put,
      request: [{"application/json", {StopwordsSetUpsertSchema, :t}}],
      response: [{200, {StopwordsSetSchema, :t}}, {400, {ApiResponse, :t}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:delete_stopwords_set_200_json_resp) do
    [id: {:string, :generic}]
  end
end
