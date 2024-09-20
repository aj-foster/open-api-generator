defmodule Debug do
  @moduledoc """
  Provides API endpoint related to debug
  """

  @default_client Client

  @type debug_200_json_resp :: %{version: String.t() | nil}

  @doc """
  Print debugging information

  Print debugging information
  """
  @spec debug(keyword) :: {:ok, map} | :error
  def debug(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Debug, :debug},
      url: "/debug",
      method: :get,
      response: [{200, {Debug, :debug_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:debug_200_json_resp) do
    [version: {:string, :generic}]
  end
end
