defmodule SpaceTraders.Systems do
  @moduledoc """
  Provides API endpoints related to systems
  """

  @default_client SpaceTraders.Client

  @type get_construction_200_json_resp :: %{data: SpaceTraders.Construction.t()}

  @doc """
  Get Construction Site

  Get construction details for a waypoint. Requires a waypoint with a property of `isUnderConstruction` to be true.
  """
  @spec get_construction(
          systemSymbol :: String.t(),
          waypointSymbol :: String.t(),
          opts :: keyword
        ) :: {:ok, SpaceTraders.Systems.get_construction_200_json_resp()} | :error
  def get_construction(systemSymbol, waypointSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol],
      call: {SpaceTraders.Systems, :get_construction},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}/construction",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_construction_200_json_resp}}],
      opts: opts
    })
  end

  @type get_jump_gate_200_json_resp :: %{data: SpaceTraders.JumpGate.t()}

  @doc """
  Get Jump Gate

  Get jump gate details for a waypoint. Requires a waypoint of type `JUMP_GATE` to use.

  Waypoints connected to this jump gate can be 
  """
  @spec get_jump_gate(systemSymbol :: String.t(), waypointSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_jump_gate_200_json_resp()} | :error
  def get_jump_gate(systemSymbol, waypointSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol],
      call: {SpaceTraders.Systems, :get_jump_gate},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}/jump-gate",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_jump_gate_200_json_resp}}],
      opts: opts
    })
  end

  @type get_market_200_json_resp :: %{data: SpaceTraders.Market.t()}

  @doc """
  Get Market

  Retrieve imports, exports and exchange data from a marketplace. Requires a waypoint that has the `Marketplace` trait to use.

  Send a ship to the waypoint to access trade good prices and recent transactions. Refer to the [Market Overview page](https://docs.spacetraders.io/game-concepts/markets) to gain better a understanding of the market in the game.
  """
  @spec get_market(systemSymbol :: String.t(), waypointSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_market_200_json_resp()} | :error
  def get_market(systemSymbol, waypointSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol],
      call: {SpaceTraders.Systems, :get_market},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}/market",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_market_200_json_resp}}],
      opts: opts
    })
  end

  @type get_shipyard_200_json_resp :: %{data: SpaceTraders.Shipyard.t()}

  @doc """
  Get Shipyard

  Get the shipyard for a waypoint. Requires a waypoint that has the `Shipyard` trait to use. Send a ship to the waypoint to access data on ships that are currently available for purchase and recent transactions.
  """
  @spec get_shipyard(systemSymbol :: String.t(), waypointSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_shipyard_200_json_resp()} | :error
  def get_shipyard(systemSymbol, waypointSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol],
      call: {SpaceTraders.Systems, :get_shipyard},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}/shipyard",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_shipyard_200_json_resp}}],
      opts: opts
    })
  end

  @type get_system_200_json_resp :: %{data: SpaceTraders.System.t()}

  @doc """
  Get System

  Get the details of a system.
  """
  @spec get_system(systemSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_system_200_json_resp()} | :error
  def get_system(systemSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol],
      call: {SpaceTraders.Systems, :get_system},
      url: "/systems/#{systemSymbol}",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_system_200_json_resp}}],
      opts: opts
    })
  end

  @type get_system_waypoints_200_json_resp :: %{
          data: [SpaceTraders.Waypoint.t()],
          meta: SpaceTraders.Meta.t()
        }

  @doc """
  List Waypoints in System

  Return a paginated list of all of the waypoints for a given system.

  If a waypoint is uncharted, it will return the `Uncharted` trait instead of its actual traits.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page
    * `type`: Filter waypoints by type.
    * `traits`: Filter waypoints by one or more traits.

  """
  @spec get_system_waypoints(systemSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_system_waypoints_200_json_resp()} | :error
  def get_system_waypoints(systemSymbol, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page, :traits, :type])

    client.request(%{
      args: [systemSymbol: systemSymbol],
      call: {SpaceTraders.Systems, :get_system_waypoints},
      url: "/systems/#{systemSymbol}/waypoints",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Systems, :get_system_waypoints_200_json_resp}}],
      opts: opts
    })
  end

  @type get_systems_200_json_resp :: %{
          data: [SpaceTraders.System.t()],
          meta: SpaceTraders.Meta.t()
        }

  @doc """
  List Systems

  Return a paginated list of all systems.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page

  """
  @spec get_systems(opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_systems_200_json_resp()} | :error
  def get_systems(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {SpaceTraders.Systems, :get_systems},
      url: "/systems",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Systems, :get_systems_200_json_resp}}],
      opts: opts
    })
  end

  @type get_waypoint_200_json_resp :: %{data: SpaceTraders.Waypoint.t()}

  @doc """
  Get Waypoint

  View the details of a waypoint.

  If the waypoint is uncharted, it will return the 'Uncharted' trait instead of its actual traits.
  """
  @spec get_waypoint(systemSymbol :: String.t(), waypointSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Systems.get_waypoint_200_json_resp()} | :error
  def get_waypoint(systemSymbol, waypointSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol],
      call: {SpaceTraders.Systems, :get_waypoint},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}",
      method: :get,
      response: [{200, {SpaceTraders.Systems, :get_waypoint_200_json_resp}}],
      opts: opts
    })
  end

  @type supply_construction_201_json_resp :: %{
          data: SpaceTraders.Systems.supply_construction_201_json_resp_data()
        }

  @type supply_construction_201_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          construction: SpaceTraders.Construction.t()
        }

  @doc """
  Supply Construction Site

  Supply a construction site with the specified good. Requires a waypoint with a property of `isUnderConstruction` to be true.

  The good must be in your ship's cargo. The good will be removed from your ship's cargo and added to the construction site's materials.

  ## Request Body

  **Content Types**: `application/json`

  """
  @spec supply_construction(
          systemSymbol :: String.t(),
          waypointSymbol :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, SpaceTraders.Systems.supply_construction_201_json_resp()} | :error
  def supply_construction(systemSymbol, waypointSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [systemSymbol: systemSymbol, waypointSymbol: waypointSymbol, body: body],
      call: {SpaceTraders.Systems, :supply_construction},
      url: "/systems/#{systemSymbol}/waypoints/#{waypointSymbol}/construction/supply",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Systems, :supply_construction_201_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_construction_200_json_resp) do
    [data: {SpaceTraders.Construction, :t}]
  end

  def __fields__(:get_jump_gate_200_json_resp) do
    [data: {SpaceTraders.JumpGate, :t}]
  end

  def __fields__(:get_market_200_json_resp) do
    [data: {SpaceTraders.Market, :t}]
  end

  def __fields__(:get_shipyard_200_json_resp) do
    [data: {SpaceTraders.Shipyard, :t}]
  end

  def __fields__(:get_system_200_json_resp) do
    [data: {SpaceTraders.System, :t}]
  end

  def __fields__(:get_system_waypoints_200_json_resp) do
    [data: [{SpaceTraders.Waypoint, :t}], meta: {SpaceTraders.Meta, :t}]
  end

  def __fields__(:get_systems_200_json_resp) do
    [data: [{SpaceTraders.System, :t}], meta: {SpaceTraders.Meta, :t}]
  end

  def __fields__(:get_waypoint_200_json_resp) do
    [data: {SpaceTraders.Waypoint, :t}]
  end

  def __fields__(:supply_construction_201_json_resp) do
    [data: {SpaceTraders.Systems, :supply_construction_201_json_resp_data}]
  end

  def __fields__(:supply_construction_201_json_resp_data) do
    [cargo: {SpaceTraders.ShipCargo, :t}, construction: {SpaceTraders.Construction, :t}]
  end
end
