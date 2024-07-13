defmodule Health do
  @moduledoc """
  Provides API endpoint related to health
  """

  @default_client Client

  @doc """
  Checks if Typesense server is ready to accept requests.

  Checks if Typesense server is ready to accept requests.
  """
  @spec health(keyword) :: {:ok, HealthStatus.t()} | :error
  def health(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Health, :health},
      url: "/health",
      method: :get,
      response: [{200, {HealthStatus, :t}}],
      opts: opts
    })
  end
end
