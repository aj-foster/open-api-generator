defmodule StabilityAI.Engines do
  @moduledoc """
  Provides API endpoint related to engines
  """

  @default_client StabilityAI.Client

  @doc """
  List engines

  List all engines available to your organization/user
  """
  @spec list_engines(opts :: keyword) ::
          {:ok, [StabilityAI.Engine.t()]} | {:error, StabilityAI.Error.t()}
  def list_engines(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {StabilityAI.Engines, :list_engines},
      url: "/v1/engines/list",
      method: :get,
      response: [
        {200, [{StabilityAI.Engine, :t}]},
        {401, {StabilityAI.Error, :t}},
        {500, {StabilityAI.Error, :t}}
      ],
      opts: opts
    })
  end
end
