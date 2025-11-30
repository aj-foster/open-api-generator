defmodule GitHub.Emojis do
  @moduledoc """
  Provides API endpoint related to emojis
  """

  @default_client GitHub.Client

  @doc """
  Get emojis

  Lists all the emojis available to use on GitHub.

  ## Resources

    * [API method documentation](https://docs.github.com/rest/emojis/emojis#get-emojis)

  """
  @spec get(opts :: keyword) :: {:ok, map} | {:error, GitHub.Error.t()}
  def get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {GitHub.Emojis, :get},
      url: "/emojis",
      method: :get,
      response: [{200, :map}, {304, :null}],
      opts: opts
    })
  end
end
