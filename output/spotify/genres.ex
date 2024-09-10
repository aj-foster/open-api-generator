defmodule Genres do
  @moduledoc """
  Provides API endpoint related to genres
  """

  @default_client Client

  @doc """
  Get Available Genre Seeds


  Retrieve a list of available genres seed parameter values for [recommendations](/documentation/web-api/reference/get-recommendations).

  """
  @spec get_recommendation_genres(keyword) ::
          {:ok, ManyGenres.json_resp()}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_recommendation_genres(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Genres, :get_recommendation_genres},
      url: "/recommendations/available-genre-seeds",
      method: :get,
      response: [
        {200, {ManyGenres, :json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
