defmodule Spotify.Genres do
  @moduledoc """
  Provides API endpoint related to genres
  """

  @default_client Spotify.Client

  @doc """
  Get Available Genre Seeds

  Retrieve a list of available genres seed parameter values for [recommendations](/documentation/web-api/reference/get-recommendations).

  """
  @callback get_recommendation_genres(opts :: keyword) ::
              {:ok, Spotify.ManyGenres.json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_recommendation_genres(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Spotify.Genres, :get_recommendation_genres},
      url: "/recommendations/available-genre-seeds",
      method: :get,
      response: [
        {200, {Spotify.ManyGenres, :json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end
end
