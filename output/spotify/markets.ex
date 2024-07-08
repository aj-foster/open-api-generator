defmodule Markets do
  @moduledoc """
  Provides API endpoint related to markets
  """

  @default_client Client

  @type get_available_markets_200_json_resp :: %{markets: [String.t()] | nil}

  @doc """
  Get Available Markets


  Get the list of markets where Spotify is available.

  """
  @spec get_available_markets(keyword) ::
          {:ok, map}
          | {:error,
             Forbidden.json_resp() | TooManyRequests.json_resp() | Unauthorized.json_resp()}
  def get_available_markets(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Markets, :get_available_markets},
      url: "/markets",
      method: :get,
      response: [
        {200, {Markets, :get_available_markets_200_json_resp}},
        {401, {Unauthorized, :json_resp}},
        {403, {Forbidden, :json_resp}},
        {429, {TooManyRequests, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_available_markets_200_json_resp) do
    [markets: [string: :generic]]
  end
end
