defmodule Typesense.Health do
  @moduledoc """
  Provides API endpoint related to health
  """

  @default_client Typesense.Client

  @doc """
  Checks if Typesense server is ready to accept requests.

  Checks if Typesense server is ready to accept requests.
  """
  @spec health(opts :: keyword) :: {:ok, Typesense.HealthStatus.t()} | :error
  def health(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Typesense.Health, :health},
      url: "/health",
      method: :get,
      response: [{200, {Typesense.HealthStatus, :t}}],
      opts: opts
    })
  end
end
