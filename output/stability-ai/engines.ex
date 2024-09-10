defmodule Engines do
  @moduledoc """
  Provides API endpoint related to engines
  """

  @default_client Client

  @doc """
  List engines

  List all engines available to your organization/user
  """
  @spec list_engines(keyword) :: {:ok, [Engine.t()]} | {:error, Error.t()}
  def list_engines(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Engines, :list_engines},
      url: "/v1/engines/list",
      method: :get,
      response: [{200, [{Engine, :t}]}, {401, {Error, :t}}, {500, {Error, :t}}],
      opts: opts
    })
  end
end
