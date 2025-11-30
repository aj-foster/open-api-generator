defmodule Typesense.Debug do
  @moduledoc """
  Provides API endpoint related to debug
  """

  @default_client Typesense.Client

  @type debug_200_json_resp :: %{version: String.t() | nil}

  @doc """
  Print debugging information

  Print debugging information
  """
  @spec debug(opts :: keyword) :: {:ok, Typesense.Debug.debug_200_json_resp()} | :error
  def debug(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Debug, :debug},
      url: "/debug",
      method: :get,
      response: [{200, {Typesense.Debug, :debug_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:debug_200_json_resp) do
    [version: :string]
  end
end
