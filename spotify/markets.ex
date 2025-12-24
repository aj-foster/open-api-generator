defmodule Spotify.Markets do
  @moduledoc """
  Provides API endpoint related to markets
  """

  @default_client Spotify.Client

  @type get_available_markets_200_json_resp :: %{markets: [String.t()] | nil}

  @doc """
  Get Available Markets

  Get the list of markets where Spotify is available.

  """
  @callback get_available_markets(opts :: keyword) ::
              {:ok, Spotify.Markets.get_available_markets_200_json_resp()}
              | {:error,
                 Spotify.Forbidden.json_resp()
                 | Spotify.TooManyRequests.json_resp()
                 | Spotify.Unauthorized.json_resp()}
  def get_available_markets(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Spotify.Markets, :get_available_markets},
      url: "/markets",
      method: :get,
      response: [
        {200, {Spotify.Markets, :get_available_markets_200_json_resp}},
        {401, {Spotify.Unauthorized, :json_resp}},
        {403, {Spotify.Forbidden, :json_resp}},
        {429, {Spotify.TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_available_markets_200_json_resp) do
    [markets: [:string]]
  end
end
