defmodule SpaceTraders.Global do
  @moduledoc """
  Provides API endpoints related to global
  """

  @default_client SpaceTraders.Client

  @type get_status_200_json_resp :: %{
          announcements: [SpaceTraders.Global.get_status_200_json_resp_announcements()],
          description: String.t(),
          leaderboards: SpaceTraders.Global.get_status_200_json_resp_leaderboards(),
          links: [SpaceTraders.Global.get_status_200_json_resp_links()],
          resetDate: String.t(),
          serverResets: SpaceTraders.Global.get_status_200_json_resp_server_resets(),
          stats: SpaceTraders.Global.get_status_200_json_resp_stats(),
          status: String.t(),
          version: String.t()
        }

  @type get_status_200_json_resp_announcements :: %{body: String.t(), title: String.t()}

  @type get_status_200_json_resp_leaderboards :: %{
          mostCredits: [SpaceTraders.Global.get_status_200_json_resp_leaderboards_most_credits()],
          mostSubmittedCharts: [
            SpaceTraders.Global.get_status_200_json_resp_leaderboards_most_submitted_charts()
          ]
        }

  @type get_status_200_json_resp_leaderboards_most_credits :: %{
          agentSymbol: String.t(),
          credits: integer
        }

  @type get_status_200_json_resp_leaderboards_most_submitted_charts :: %{
          agentSymbol: String.t(),
          chartCount: integer
        }

  @type get_status_200_json_resp_links :: %{name: String.t(), url: String.t()}

  @type get_status_200_json_resp_server_resets :: %{frequency: String.t(), next: String.t()}

  @type get_status_200_json_resp_stats :: %{
          accounts: integer | nil,
          agents: integer,
          ships: integer,
          systems: integer,
          waypoints: integer
        }

  @doc """
  Get Status

  Return the status of the game server.
  This also includes a few global elements, such as announcements, server reset dates and leaderboards.
  """
  @spec get_status(opts :: keyword) ::
          {:ok, SpaceTraders.Global.get_status_200_json_resp()} | :error
  def get_status(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SpaceTraders.Global, :get_status},
      url: "/",
      method: :get,
      response: [{200, {SpaceTraders.Global, :get_status_200_json_resp}}],
      opts: opts
    })
  end

  @type register_201_json_resp :: %{data: SpaceTraders.Global.register_201_json_resp_data()}

  @type register_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          contract: SpaceTraders.Contract.t(),
          faction: SpaceTraders.Faction.t(),
          ships: [SpaceTraders.Ship.t()] | nil,
          token: String.t()
        }

  @doc """
  Register New Agent

  Creates a new agent and ties it to an account. 
  The agent symbol must consist of a 3-14 character string, and will be used to represent your agent. This symbol will prefix the symbol of every ship you own. Agent symbols will be cast to all uppercase characters.

  This new agent will be tied to a starting faction of your choice, which determines your starting location, and will be granted an authorization token, a contract with their starting faction, a command ship that can fly across space with advanced capabilities, a small probe ship that can be used for reconnaissance, and 175,000 credits.

  > #### Keep your token safe and secure
  >
  > Keep careful track of where you store your token. You can generate a new token from our account dashboard, but if someone else gains access to your token they will be able to use it to make API requests on your behalf until the end of the reset.

  If you are new to SpaceTraders, It is recommended to register with the COSMIC faction, a faction that is well connected to the rest of the universe. After registering, you should try our interactive [quickstart guide](https://docs.spacetraders.io/quickstart/new-game) which will walk you through a few basic API requests in just a few minutes.

  ## Request Body

  **Content Types**: `application/json`

  """
  @spec register(body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Global.register_201_json_resp()} | :error
  def register(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SpaceTraders.Global, :register},
      url: "/register",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Global, :register_201_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_status_200_json_resp) do
    [
      announcements: [{SpaceTraders.Global, :get_status_200_json_resp_announcements}],
      description: :string,
      leaderboards: {SpaceTraders.Global, :get_status_200_json_resp_leaderboards},
      links: [{SpaceTraders.Global, :get_status_200_json_resp_links}],
      resetDate: :string,
      serverResets: {SpaceTraders.Global, :get_status_200_json_resp_server_resets},
      stats: {SpaceTraders.Global, :get_status_200_json_resp_stats},
      status: :string,
      version: :string
    ]
  end

  def __fields__(:get_status_200_json_resp_announcements) do
    [body: :string, title: :string]
  end

  def __fields__(:get_status_200_json_resp_leaderboards) do
    [
      mostCredits: [{SpaceTraders.Global, :get_status_200_json_resp_leaderboards_most_credits}],
      mostSubmittedCharts: [
        {SpaceTraders.Global, :get_status_200_json_resp_leaderboards_most_submitted_charts}
      ]
    ]
  end

  def __fields__(:get_status_200_json_resp_leaderboards_most_credits) do
    [agentSymbol: :string, credits: {:integer, "int64"}]
  end

  def __fields__(:get_status_200_json_resp_leaderboards_most_submitted_charts) do
    [agentSymbol: :string, chartCount: :integer]
  end

  def __fields__(:get_status_200_json_resp_links) do
    [name: :string, url: :string]
  end

  def __fields__(:get_status_200_json_resp_server_resets) do
    [frequency: :string, next: :string]
  end

  def __fields__(:get_status_200_json_resp_stats) do
    [
      accounts: :integer,
      agents: :integer,
      ships: :integer,
      systems: :integer,
      waypoints: :integer
    ]
  end

  def __fields__(:register_201_json_resp) do
    [data: {SpaceTraders.Global, :register_201_json_resp_data}]
  end

  def __fields__(:register_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      contract: {SpaceTraders.Contract, :t},
      faction: {SpaceTraders.Faction, :t},
      ships: [{SpaceTraders.Ship, :t}],
      token: :string
    ]
  end
end
