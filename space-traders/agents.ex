defmodule SpaceTraders.Agents do
  @moduledoc """
  Provides API endpoints related to agents
  """

  @default_client SpaceTraders.Client

  @type get_agent_200_json_resp :: %{data: SpaceTraders.Agent.t()}

  @doc """
  Get Public Agent

  Fetch agent details.
  """
  @spec get_agent(agentSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Agents.get_agent_200_json_resp()} | :error
  def get_agent(agentSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [agentSymbol: agentSymbol],
      call: {SpaceTraders.Agents, :get_agent},
      url: "/agents/#{agentSymbol}",
      method: :get,
      response: [{200, {SpaceTraders.Agents, :get_agent_200_json_resp}}],
      opts: opts
    })
  end

  @type get_agents_200_json_resp :: %{data: [SpaceTraders.Agent.t()], meta: SpaceTraders.Meta.t()}

  @doc """
  List Agents

  Fetch agents details.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page

  """
  @spec get_agents(opts :: keyword) ::
          {:ok, SpaceTraders.Agents.get_agents_200_json_resp()} | :error
  def get_agents(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {SpaceTraders.Agents, :get_agents},
      url: "/agents",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Agents, :get_agents_200_json_resp}}],
      opts: opts
    })
  end

  @type get_my_agent_200_json_resp :: %{data: SpaceTraders.Agent.t()}

  @doc """
  Get Agent

  Fetch your agent's details.
  """
  @spec get_my_agent(opts :: keyword) ::
          {:ok, SpaceTraders.Agents.get_my_agent_200_json_resp()} | :error
  def get_my_agent(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SpaceTraders.Agents, :get_my_agent},
      url: "/my/agent",
      method: :get,
      response: [{200, {SpaceTraders.Agents, :get_my_agent_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_agent_200_json_resp) do
    [data: {SpaceTraders.Agent, :t}]
  end

  def __fields__(:get_agents_200_json_resp) do
    [data: [{SpaceTraders.Agent, :t}], meta: {SpaceTraders.Meta, :t}]
  end

  def __fields__(:get_my_agent_200_json_resp) do
    [data: {SpaceTraders.Agent, :t}]
  end
end
