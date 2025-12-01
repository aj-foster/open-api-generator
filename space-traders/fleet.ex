defmodule SpaceTraders.Fleet do
  @moduledoc """
  Provides API endpoints related to fleet
  """

  @default_client SpaceTraders.Client

  @type create_chart_201_json_resp :: %{
          data: SpaceTraders.Fleet.create_chart_201_json_resp_data()
        }

  @type create_chart_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          chart: SpaceTraders.Chart.t(),
          waypoint: SpaceTraders.Waypoint.t()
        }

  @doc """
  Create Chart

  Command a ship to chart the waypoint at its current location.

  Most waypoints in the universe are uncharted by default. These waypoints have their traits hidden until they have been charted by a ship.

  Charting a waypoint will record your agent as the one who created the chart, and all other agents would also be able to see the waypoint's traits. Charting a waypoint gives you a one time reward of credits based on the rarity of the waypoint's traits.
  """
  @spec create_chart(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.create_chart_201_json_resp()} | :error
  def create_chart(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :create_chart},
      url: "/my/ships/#{shipSymbol}/chart",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :create_chart_201_json_resp}}],
      opts: opts
    })
  end

  @type create_ship_ship_scan_201_json_resp :: %{
          data: SpaceTraders.Fleet.create_ship_ship_scan_201_json_resp_data()
        }

  @type create_ship_ship_scan_201_json_resp_data :: %{
          cooldown: SpaceTraders.Cooldown.t(),
          ships: [SpaceTraders.ScannedShip.t()]
        }

  @doc """
  Scan Ships

  Scan for nearby ships, retrieving information for all ships in range.

  Requires a ship to have the `Sensor Array` mount installed to use.

  The ship will enter a cooldown after using this function, during which it cannot execute certain actions.
  """
  @spec create_ship_ship_scan(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.create_ship_ship_scan_201_json_resp()} | :error
  def create_ship_ship_scan(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :create_ship_ship_scan},
      url: "/my/ships/#{shipSymbol}/scan/ships",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :create_ship_ship_scan_201_json_resp}}],
      opts: opts
    })
  end

  @type create_ship_system_scan_201_json_resp :: %{
          data: SpaceTraders.Fleet.create_ship_system_scan_201_json_resp_data()
        }

  @type create_ship_system_scan_201_json_resp_data :: %{
          cooldown: SpaceTraders.Cooldown.t(),
          systems: [SpaceTraders.ScannedSystem.t()]
        }

  @doc """
  Scan Systems

  Scan for nearby systems, retrieving information on the systems' distance from the ship and their waypoints. Requires a ship to have the `Sensor Array` mount installed to use.

  The ship will enter a cooldown after using this function, during which it cannot execute certain actions.
  """
  @spec create_ship_system_scan(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.create_ship_system_scan_201_json_resp()} | :error
  def create_ship_system_scan(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :create_ship_system_scan},
      url: "/my/ships/#{shipSymbol}/scan/systems",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :create_ship_system_scan_201_json_resp}}],
      opts: opts
    })
  end

  @type create_ship_waypoint_scan_201_json_resp :: %{
          data: SpaceTraders.Fleet.create_ship_waypoint_scan_201_json_resp_data()
        }

  @type create_ship_waypoint_scan_201_json_resp_data :: %{
          cooldown: SpaceTraders.Cooldown.t(),
          waypoints: [SpaceTraders.ScannedWaypoint.t()]
        }

  @doc """
  Scan Waypoints

  Scan for nearby waypoints, retrieving detailed information on each waypoint in range. Scanning uncharted waypoints will allow you to ignore their uncharted state and will list the waypoints' traits.

  Requires a ship to have the `Sensor Array` mount installed to use.

  The ship will enter a cooldown after using this function, during which it cannot execute certain actions.
  """
  @spec create_ship_waypoint_scan(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.create_ship_waypoint_scan_201_json_resp()} | :error
  def create_ship_waypoint_scan(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :create_ship_waypoint_scan},
      url: "/my/ships/#{shipSymbol}/scan/waypoints",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :create_ship_waypoint_scan_201_json_resp}}],
      opts: opts
    })
  end

  @type create_survey_201_json_resp :: %{
          data: SpaceTraders.Fleet.create_survey_201_json_resp_data()
        }

  @type create_survey_201_json_resp_data :: %{
          cooldown: SpaceTraders.Cooldown.t(),
          surveys: [SpaceTraders.Survey.t()]
        }

  @doc """
  Create Survey

  Create surveys on a waypoint that can be extracted such as asteroid fields. A survey focuses on specific types of deposits from the extracted location. When ships extract using this survey, they are guaranteed to procure a high amount of one of the goods in the survey.

  In order to use a survey, send the entire survey details in the body of the extract request.

  Each survey may have multiple deposits, and if a symbol shows up more than once, that indicates a higher chance of extracting that resource.

  Your ship will enter a cooldown after surveying in which it is unable to perform certain actions. Surveys will eventually expire after a period of time or will be exhausted after being extracted several times based on the survey's size. Multiple ships can use the same survey for extraction.

  A ship must have the `Surveyor` mount installed in order to use this function.
  """
  @spec create_survey(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.create_survey_201_json_resp()} | :error
  def create_survey(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :create_survey},
      url: "/my/ships/#{shipSymbol}/survey",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :create_survey_201_json_resp}}],
      opts: opts
    })
  end

  @type dock_ship_200_json_resp :: %{data: SpaceTraders.Fleet.dock_ship_200_json_resp_data()}

  @type dock_ship_200_json_resp_data :: %{nav: SpaceTraders.ShipNav.t()}

  @doc """
  Dock Ship

  Attempt to dock your ship at its current location. Docking will only succeed if your ship is capable of docking at the time of the request.

  Docked ships can access elements in their current location, such as the market or a shipyard, but cannot do actions that require the ship to be above surface such as navigating or extracting.

  The endpoint is idempotent - successive calls will succeed even if the ship is already docked.
  """
  @spec dock_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.dock_ship_200_json_resp()} | :error
  def dock_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :dock_ship},
      url: "/my/ships/#{shipSymbol}/dock",
      method: :post,
      response: [{200, {SpaceTraders.Fleet, :dock_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type extract_resources_201_json_resp :: %{
          data: SpaceTraders.Fleet.extract_resources_201_json_resp_data()
        }

  @type extract_resources_201_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          cooldown: SpaceTraders.Cooldown.t(),
          events: [SpaceTraders.ShipConditionEvent.t()],
          extraction: SpaceTraders.Extraction.t(),
          modifiers: [SpaceTraders.WaypointModifier.t()] | nil
        }

  @doc """
  Extract Resources

  Extract resources from a waypoint that can be extracted, such as asteroid fields, into your ship. Send an optional survey as the payload to target specific yields.

  The ship must be in orbit to be able to extract and must have mining equipments installed that can extract goods, such as the `Gas Siphon` mount for gas-based goods or `Mining Laser` mount for ore-based goods.

  The survey property is now deprecated. See the `extract/survey` endpoint for more details.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec extract_resources(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.extract_resources_201_json_resp()} | :error
  def extract_resources(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :extract_resources},
      url: "/my/ships/#{shipSymbol}/extract",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :extract_resources_201_json_resp}}],
      opts: opts
    })
  end

  @type extract_resources_with_survey_201_json_resp :: %{
          data: SpaceTraders.Fleet.extract_resources_with_survey_201_json_resp_data()
        }

  @type extract_resources_with_survey_201_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          cooldown: SpaceTraders.Cooldown.t(),
          events: [SpaceTraders.ShipConditionEvent.t()],
          extraction: SpaceTraders.Extraction.t()
        }

  @doc """
  Extract Resources with Survey

  Use a survey when extracting resources from a waypoint. This endpoint requires a survey as the payload, which allows your ship to extract specific yields.

  Send the full survey object as the payload which will be validated according to the signature. If the signature is invalid, or any properties of the survey are changed, the request will fail.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec extract_resources_with_survey(
          shipSymbol :: String.t(),
          body :: SpaceTraders.Survey.t(),
          opts :: keyword
        ) :: {:ok, SpaceTraders.Fleet.extract_resources_with_survey_201_json_resp()} | :error
  def extract_resources_with_survey(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :extract_resources_with_survey},
      url: "/my/ships/#{shipSymbol}/extract/survey",
      body: body,
      method: :post,
      request: [{"application/json", {SpaceTraders.Survey, :t}}],
      response: [{201, {SpaceTraders.Fleet, :extract_resources_with_survey_201_json_resp}}],
      opts: opts
    })
  end

  @type get_mounts_200_json_resp :: %{data: [SpaceTraders.ShipMount.t()]}

  @doc """
  Get Mounts

  Get the mounts installed on a ship.
  """
  @spec get_mounts(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_mounts_200_json_resp()} | :error
  def get_mounts(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_mounts},
      url: "/my/ships/#{shipSymbol}/mounts",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_mounts_200_json_resp}}],
      opts: opts
    })
  end

  @type get_my_ship_200_json_resp :: %{data: SpaceTraders.Ship.t()}

  @doc """
  Get Ship

  Retrieve the details of a ship under your agent's ownership.
  """
  @spec get_my_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_my_ship_200_json_resp()} | :error
  def get_my_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_my_ship},
      url: "/my/ships/#{shipSymbol}",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_my_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type get_my_ship_cargo_200_json_resp :: %{data: SpaceTraders.ShipCargo.t()}

  @doc """
  Get Ship Cargo

  Retrieve the cargo of a ship under your agent's ownership.
  """
  @spec get_my_ship_cargo(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_my_ship_cargo_200_json_resp()} | :error
  def get_my_ship_cargo(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_my_ship_cargo},
      url: "/my/ships/#{shipSymbol}/cargo",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_my_ship_cargo_200_json_resp}}],
      opts: opts
    })
  end

  @type get_my_ships_200_json_resp :: %{
          data: [SpaceTraders.Ship.t()],
          meta: SpaceTraders.Meta.t()
        }

  @doc """
  List Ships

  Return a paginated list of all of ships under your agent's ownership.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page

  """
  @spec get_my_ships(opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_my_ships_200_json_resp()} | :error
  def get_my_ships(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {SpaceTraders.Fleet, :get_my_ships},
      url: "/my/ships",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Fleet, :get_my_ships_200_json_resp}}],
      opts: opts
    })
  end

  @type get_repair_ship_200_json_resp :: %{
          data: SpaceTraders.Fleet.get_repair_ship_200_json_resp_data()
        }

  @type get_repair_ship_200_json_resp_data :: %{transaction: SpaceTraders.RepairTransaction.t()}

  @doc """
  Get Repair Ship

  Get the cost of repairing a ship.
  """
  @spec get_repair_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_repair_ship_200_json_resp()} | :error
  def get_repair_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_repair_ship},
      url: "/my/ships/#{shipSymbol}/repair",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_repair_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type get_scrap_ship_200_json_resp :: %{
          data: SpaceTraders.Fleet.get_scrap_ship_200_json_resp_data()
        }

  @type get_scrap_ship_200_json_resp_data :: %{transaction: SpaceTraders.ScrapTransaction.t()}

  @doc """
  Get Scrap Ship

  Get the amount of value that will be returned when scrapping a ship.
  """
  @spec get_scrap_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_scrap_ship_200_json_resp()} | :error
  def get_scrap_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_scrap_ship},
      url: "/my/ships/#{shipSymbol}/scrap",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_scrap_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type get_ship_cooldown_200_json_resp :: %{data: SpaceTraders.Cooldown.t()}

  @doc """
  Get Ship Cooldown

  Retrieve the details of your ship's reactor cooldown. Some actions such as activating your jump drive, scanning, or extracting resources taxes your reactor and results in a cooldown.

  Your ship cannot perform additional actions until your cooldown has expired. The duration of your cooldown is relative to the power consumption of the related modules or mounts for the action taken.

  Response returns a 204 status code (no-content) when the ship has no cooldown.
  """
  @spec get_ship_cooldown(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_ship_cooldown_200_json_resp()} | :error
  def get_ship_cooldown(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_ship_cooldown},
      url: "/my/ships/#{shipSymbol}/cooldown",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_ship_cooldown_200_json_resp}}, {204, :null}],
      opts: opts
    })
  end

  @type get_ship_modules_200_json_resp :: %{data: [SpaceTraders.ShipModule.t()]}

  @doc """
  Get Ship Modules

  Get the modules installed on a ship.
  """
  @spec get_ship_modules(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_ship_modules_200_json_resp()} | :error
  def get_ship_modules(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_ship_modules},
      url: "/my/ships/#{shipSymbol}/modules",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_ship_modules_200_json_resp}}],
      opts: opts
    })
  end

  @type get_ship_nav_200_json_resp :: %{data: SpaceTraders.ShipNav.t()}

  @doc """
  Get Ship Nav

  Get the current nav status of a ship.
  """
  @spec get_ship_nav(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.get_ship_nav_200_json_resp()} | :error
  def get_ship_nav(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :get_ship_nav},
      url: "/my/ships/#{shipSymbol}/nav",
      method: :get,
      response: [{200, {SpaceTraders.Fleet, :get_ship_nav_200_json_resp}}],
      opts: opts
    })
  end

  @type install_mount_201_json_resp :: %{
          data: SpaceTraders.Fleet.install_mount_201_json_resp_data()
        }

  @type install_mount_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          mounts: [SpaceTraders.ShipMount.t()],
          transaction: SpaceTraders.ShipModificationTransaction.t()
        }

  @doc """
  Install Mount

  Install a mount on a ship.

  In order to install a mount, the ship must be docked and located in a waypoint that has a `Shipyard` trait. The ship also must have the mount to install in its cargo hold.

  An installation fee will be deduced by the Shipyard for installing the mount on the ship. 

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec install_mount(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.install_mount_201_json_resp()} | :error
  def install_mount(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :install_mount},
      url: "/my/ships/#{shipSymbol}/mounts/install",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :install_mount_201_json_resp}}],
      opts: opts
    })
  end

  @type install_ship_module_201_json_resp :: %{
          data: SpaceTraders.Fleet.install_ship_module_201_json_resp_data()
        }

  @type install_ship_module_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          modules: [SpaceTraders.ShipModule.t()],
          transaction: SpaceTraders.Fleet.install_ship_module_201_json_resp_data_transaction()
        }

  @type install_ship_module_201_json_resp_data_transaction :: %{
          shipSymbol: String.t(),
          timestamp: String.t(),
          totalPrice: integer,
          tradeSymbol: String.t(),
          waypointSymbol: String.t()
        }

  @doc """
  Install Ship Module

  Install a module on a ship. The module must be in your cargo.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec install_ship_module(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.install_ship_module_201_json_resp()} | :error
  def install_ship_module(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :install_ship_module},
      url: "/my/ships/#{shipSymbol}/modules/install",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :install_ship_module_201_json_resp}}],
      opts: opts
    })
  end

  @type jettison_200_json_resp :: %{data: SpaceTraders.Fleet.jettison_200_json_resp_data()}

  @type jettison_200_json_resp_data :: %{cargo: SpaceTraders.ShipCargo.t()}

  @doc """
  Jettison Cargo

  Jettison cargo from your ship's cargo hold.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec jettison(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.jettison_200_json_resp()} | :error
  def jettison(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :jettison},
      url: "/my/ships/#{shipSymbol}/jettison",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :jettison_200_json_resp}}],
      opts: opts
    })
  end

  @type jump_ship_200_json_resp :: %{data: SpaceTraders.Fleet.jump_ship_200_json_resp_data()}

  @type jump_ship_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cooldown: SpaceTraders.Cooldown.t(),
          nav: SpaceTraders.ShipNav.t(),
          transaction: SpaceTraders.MarketTransaction.t()
        }

  @doc """
  Jump Ship

  Jump your ship instantly to a target connected waypoint. The ship must be in orbit to execute a jump.

  A unit of antimatter is purchased and consumed from the market when jumping. The price of antimatter is determined by the market and is subject to change. A ship can only jump to connected waypoints

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec jump_ship(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.jump_ship_200_json_resp()} | :error
  def jump_ship(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :jump_ship},
      url: "/my/ships/#{shipSymbol}/jump",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :jump_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type navigate_ship_200_json_resp :: %{
          data: SpaceTraders.Fleet.navigate_ship_200_json_resp_data()
        }

  @type navigate_ship_200_json_resp_data :: %{
          events: [SpaceTraders.ShipConditionEvent.t()],
          fuel: SpaceTraders.ShipFuel.t(),
          nav: SpaceTraders.ShipNav.t()
        }

  @doc """
  Navigate Ship

  Navigate to a target destination. The ship must be in orbit to use this function. The destination waypoint must be within the same system as the ship's current location. Navigating will consume the necessary fuel from the ship's manifest based on the distance to the target waypoint.

  The returned response will detail the route information including the expected time of arrival. Most ship actions are unavailable until the ship has arrived at it's destination.

  To travel between systems, see the ship's Warp or Jump actions.

  ## Request Body

  **Content Types**: `application/json`

  """
  @spec navigate_ship(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.navigate_ship_200_json_resp()} | :error
  def navigate_ship(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :navigate_ship},
      url: "/my/ships/#{shipSymbol}/navigate",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :navigate_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type negotiate_contract_201_json_resp :: %{
          data: SpaceTraders.Fleet.negotiate_contract_201_json_resp_data()
        }

  @type negotiate_contract_201_json_resp_data :: %{contract: SpaceTraders.Contract.t()}

  @doc """
  Negotiate Contract

  Negotiate a new contract with the HQ.

  In order to negotiate a new contract, an agent must not have ongoing or offered contracts over the allowed maximum amount. Currently the maximum contracts an agent can have at a time is 1.

  Once a contract is negotiated, it is added to the list of contracts offered to the agent, which the agent can then accept. 

  The ship must be present at any waypoint with a faction present to negotiate a contract with that faction.
  """
  @spec negotiate_contract(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.negotiate_contract_201_json_resp()} | :error
  def negotiate_contract(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :negotiate_contract},
      url: "/my/ships/#{shipSymbol}/negotiate/contract",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :negotiate_contract_201_json_resp}}],
      opts: opts
    })
  end

  @type orbit_ship_200_json_resp :: %{data: SpaceTraders.Fleet.orbit_ship_200_json_resp_data()}

  @type orbit_ship_200_json_resp_data :: %{nav: SpaceTraders.ShipNav.t()}

  @doc """
  Orbit Ship

  Attempt to move your ship into orbit at its current location. The request will only succeed if your ship is capable of moving into orbit at the time of the request.

  Orbiting ships are able to do actions that require the ship to be above surface such as navigating or extracting, but cannot access elements in their current waypoint, such as the market or a shipyard.

  The endpoint is idempotent - successive calls will succeed even if the ship is already in orbit.
  """
  @spec orbit_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.orbit_ship_200_json_resp()} | :error
  def orbit_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :orbit_ship},
      url: "/my/ships/#{shipSymbol}/orbit",
      method: :post,
      response: [{200, {SpaceTraders.Fleet, :orbit_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type patch_ship_nav_200_json_resp :: %{
          data: SpaceTraders.Fleet.patch_ship_nav_200_json_resp_data()
        }

  @type patch_ship_nav_200_json_resp_data :: %{
          events: [SpaceTraders.ShipConditionEvent.t()],
          fuel: SpaceTraders.ShipFuel.t(),
          nav: SpaceTraders.ShipNav.t()
        }

  @doc """
  Patch Ship Nav

  Update the nav configuration of a ship.

  Currently only supports configuring the Flight Mode of the ship, which affects its speed and fuel consumption.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec patch_ship_nav(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.patch_ship_nav_200_json_resp()} | :error
  def patch_ship_nav(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :patch_ship_nav},
      url: "/my/ships/#{shipSymbol}/nav",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :patch_ship_nav_200_json_resp}}],
      opts: opts
    })
  end

  @type purchase_cargo_201_json_resp :: %{
          data: SpaceTraders.Fleet.purchase_cargo_201_json_resp_data()
        }

  @type purchase_cargo_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          transaction: SpaceTraders.MarketTransaction.t()
        }

  @doc """
  Purchase Cargo

  Purchase cargo from a market.

  The ship must be docked in a waypoint that has `Marketplace` trait, and the market must be selling a good to be able to purchase it.

  The maximum amount of units of a good that can be purchased in each transaction are denoted by the `tradeVolume` value of the good, which can be viewed by using the Get Market action.

  Purchased goods are added to the ship's cargo hold.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec purchase_cargo(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.purchase_cargo_201_json_resp()} | :error
  def purchase_cargo(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :purchase_cargo},
      url: "/my/ships/#{shipSymbol}/purchase",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :purchase_cargo_201_json_resp}}],
      opts: opts
    })
  end

  @type purchase_ship_201_json_resp :: %{
          data: SpaceTraders.Fleet.purchase_ship_201_json_resp_data()
        }

  @type purchase_ship_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          ship: SpaceTraders.Ship.t(),
          transaction: SpaceTraders.ShipyardTransaction.t()
        }

  @doc """
  Purchase Ship

  Purchase a ship from a Shipyard. In order to use this function, a ship under your agent's ownership must be in a waypoint that has the `Shipyard` trait, and the Shipyard must sell the type of the desired ship.

  Shipyards typically offer ship types, which are predefined templates of ships that have dedicated roles. A template comes with a preset of an engine, a reactor, and a frame. It may also include a few modules and mounts.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec purchase_ship(body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.purchase_ship_201_json_resp()} | :error
  def purchase_ship(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {SpaceTraders.Fleet, :purchase_ship},
      url: "/my/ships",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :purchase_ship_201_json_resp}}],
      opts: opts
    })
  end

  @type refuel_ship_200_json_resp :: %{data: SpaceTraders.Fleet.refuel_ship_200_json_resp_data()}

  @type refuel_ship_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t() | nil,
          fuel: SpaceTraders.ShipFuel.t(),
          transaction: SpaceTraders.MarketTransaction.t()
        }

  @doc """
  Refuel Ship

  Refuel your ship by buying fuel from the local market.

  Requires the ship to be docked in a waypoint that has the `Marketplace` trait, and the market must be selling fuel in order to refuel.

  Each fuel bought from the market replenishes 100 units in your ship's fuel.

  Ships will always be refuel to their frame's maximum fuel capacity when using this action.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec refuel_ship(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.refuel_ship_200_json_resp()} | :error
  def refuel_ship(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :refuel_ship},
      url: "/my/ships/#{shipSymbol}/refuel",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :refuel_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type remove_mount_201_json_resp :: %{
          data: SpaceTraders.Fleet.remove_mount_201_json_resp_data()
        }

  @type remove_mount_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          mounts: [SpaceTraders.ShipMount.t()],
          transaction: SpaceTraders.ShipModificationTransaction.t()
        }

  @doc """
  Remove Mount

  Remove a mount from a ship.

  The ship must be docked in a waypoint that has the `Shipyard` trait, and must have the desired mount that it wish to remove installed.

  A removal fee will be deduced from the agent by the Shipyard.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec remove_mount(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.remove_mount_201_json_resp()} | :error
  def remove_mount(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :remove_mount},
      url: "/my/ships/#{shipSymbol}/mounts/remove",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :remove_mount_201_json_resp}}],
      opts: opts
    })
  end

  @type remove_ship_module_201_json_resp :: %{
          data: SpaceTraders.Fleet.remove_ship_module_201_json_resp_data()
        }

  @type remove_ship_module_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          modules: [SpaceTraders.ShipModule.t()],
          transaction: SpaceTraders.Fleet.remove_ship_module_201_json_resp_data_transaction()
        }

  @type remove_ship_module_201_json_resp_data_transaction :: %{
          shipSymbol: String.t(),
          timestamp: String.t(),
          totalPrice: integer,
          tradeSymbol: String.t(),
          waypointSymbol: String.t()
        }

  @doc """
  Remove Ship Module

  Remove a module from a ship. The module will be placed in cargo.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec remove_ship_module(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.remove_ship_module_201_json_resp()} | :error
  def remove_ship_module(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :remove_ship_module},
      url: "/my/ships/#{shipSymbol}/modules/remove",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :remove_ship_module_201_json_resp}}],
      opts: opts
    })
  end

  @type repair_ship_200_json_resp :: %{data: SpaceTraders.Fleet.repair_ship_200_json_resp_data()}

  @type repair_ship_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          ship: SpaceTraders.Ship.t(),
          transaction: SpaceTraders.RepairTransaction.t()
        }

  @doc """
  Repair Ship

  Repair a ship, restoring the ship to maximum condition. The ship must be docked at a waypoint that has the `Shipyard` trait in order to use this function. To preview the cost of repairing the ship, use the Get action.
  """
  @spec repair_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.repair_ship_200_json_resp()} | :error
  def repair_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :repair_ship},
      url: "/my/ships/#{shipSymbol}/repair",
      method: :post,
      response: [{200, {SpaceTraders.Fleet, :repair_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type scrap_ship_200_json_resp :: %{data: SpaceTraders.Fleet.scrap_ship_200_json_resp_data()}

  @type scrap_ship_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          transaction: SpaceTraders.ScrapTransaction.t()
        }

  @doc """
  Scrap Ship

  Scrap a ship, removing it from the game and returning a portion of the ship's value to the agent. The ship must be docked in a waypoint that has the `Shipyard` trait in order to use this function. To preview the amount of value that will be returned, use the Get Ship action.
  """
  @spec scrap_ship(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.scrap_ship_200_json_resp()} | :error
  def scrap_ship(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :scrap_ship},
      url: "/my/ships/#{shipSymbol}/scrap",
      method: :post,
      response: [{200, {SpaceTraders.Fleet, :scrap_ship_200_json_resp}}],
      opts: opts
    })
  end

  @type sell_cargo_201_json_resp :: %{data: SpaceTraders.Fleet.sell_cargo_201_json_resp_data()}

  @type sell_cargo_201_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          cargo: SpaceTraders.ShipCargo.t(),
          transaction: SpaceTraders.MarketTransaction.t()
        }

  @doc """
  Sell Cargo

  Sell cargo in your ship to a market that trades this cargo. The ship must be docked in a waypoint that has the `Marketplace` trait in order to use this function.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec sell_cargo(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.sell_cargo_201_json_resp()} | :error
  def sell_cargo(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :sell_cargo},
      url: "/my/ships/#{shipSymbol}/sell",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :sell_cargo_201_json_resp}}],
      opts: opts
    })
  end

  @type ship_refine_201_json_resp :: %{data: SpaceTraders.Fleet.ship_refine_201_json_resp_data()}

  @type ship_refine_201_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          consumed: [SpaceTraders.Fleet.ship_refine_201_json_resp_data_consumed()],
          cooldown: SpaceTraders.Cooldown.t(),
          produced: [SpaceTraders.Fleet.ship_refine_201_json_resp_data_produced()]
        }

  @type ship_refine_201_json_resp_data_consumed :: %{tradeSymbol: String.t(), units: integer}

  @type ship_refine_201_json_resp_data_produced :: %{tradeSymbol: String.t(), units: integer}

  @doc """
  Ship Refine

  Attempt to refine the raw materials on your ship. The request will only succeed if your ship is capable of refining at the time of the request. In order to be able to refine, a ship must have goods that can be refined and have installed a `Refinery` module that can refine it.

  When refining, 100 basic goods will be converted into 10 processed goods.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec ship_refine(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.ship_refine_201_json_resp()} | :error
  def ship_refine(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :ship_refine},
      url: "/my/ships/#{shipSymbol}/refine",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{201, {SpaceTraders.Fleet, :ship_refine_201_json_resp}}],
      opts: opts
    })
  end

  @type siphon_resources_201_json_resp :: %{
          data: SpaceTraders.Fleet.siphon_resources_201_json_resp_data()
        }

  @type siphon_resources_201_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          cooldown: SpaceTraders.Cooldown.t(),
          events: [SpaceTraders.ShipConditionEvent.t()],
          siphon: SpaceTraders.Siphon.t()
        }

  @doc """
  Siphon Resources

  Siphon gases or other resources from gas giants.

  The ship must be in orbit to be able to siphon and must have siphon mounts and a gas processor installed.
  """
  @spec siphon_resources(shipSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.siphon_resources_201_json_resp()} | :error
  def siphon_resources(shipSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol],
      call: {SpaceTraders.Fleet, :siphon_resources},
      url: "/my/ships/#{shipSymbol}/siphon",
      method: :post,
      response: [{201, {SpaceTraders.Fleet, :siphon_resources_201_json_resp}}],
      opts: opts
    })
  end

  @type transfer_cargo_200_json_resp :: %{
          data: SpaceTraders.Fleet.transfer_cargo_200_json_resp_data()
        }

  @type transfer_cargo_200_json_resp_data :: %{cargo: SpaceTraders.ShipCargo.t()}

  @doc """
  Transfer Cargo

  Transfer cargo between ships.

  The receiving ship must be in the same waypoint as the transferring ship, and it must able to hold the additional cargo after the transfer is complete. Both ships also must be in the same state, either both are docked or both are orbiting.

  The response body's cargo shows the cargo of the transferring ship after the transfer is complete.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec transfer_cargo(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.transfer_cargo_200_json_resp()} | :error
  def transfer_cargo(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :transfer_cargo},
      url: "/my/ships/#{shipSymbol}/transfer",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :transfer_cargo_200_json_resp}}],
      opts: opts
    })
  end

  @type warp_ship_200_json_resp :: %{data: SpaceTraders.Fleet.warp_ship_200_json_resp_data()}

  @type warp_ship_200_json_resp_data :: %{
          fuel: SpaceTraders.ShipFuel.t(),
          nav: SpaceTraders.ShipNav.t()
        }

  @doc """
  Warp Ship

  Warp your ship to a target destination in another system. The ship must be in orbit to use this function and must have the `Warp Drive` module installed. Warping will consume the necessary fuel from the ship's manifest.

  The returned response will detail the route information including the expected time of arrival. Most ship actions are unavailable until the ship has arrived at its destination.

  ## Request Body

  **Content Types**: `application/json`

  """
  @spec warp_ship(shipSymbol :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Fleet.warp_ship_200_json_resp()} | :error
  def warp_ship(shipSymbol, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [shipSymbol: shipSymbol, body: body],
      call: {SpaceTraders.Fleet, :warp_ship},
      url: "/my/ships/#{shipSymbol}/warp",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Fleet, :warp_ship_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:create_chart_201_json_resp) do
    [data: {SpaceTraders.Fleet, :create_chart_201_json_resp_data}]
  end

  def __fields__(:create_chart_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      chart: {SpaceTraders.Chart, :t},
      waypoint: {SpaceTraders.Waypoint, :t}
    ]
  end

  def __fields__(:create_ship_ship_scan_201_json_resp) do
    [data: {SpaceTraders.Fleet, :create_ship_ship_scan_201_json_resp_data}]
  end

  def __fields__(:create_ship_ship_scan_201_json_resp_data) do
    [cooldown: {SpaceTraders.Cooldown, :t}, ships: [{SpaceTraders.ScannedShip, :t}]]
  end

  def __fields__(:create_ship_system_scan_201_json_resp) do
    [data: {SpaceTraders.Fleet, :create_ship_system_scan_201_json_resp_data}]
  end

  def __fields__(:create_ship_system_scan_201_json_resp_data) do
    [cooldown: {SpaceTraders.Cooldown, :t}, systems: [{SpaceTraders.ScannedSystem, :t}]]
  end

  def __fields__(:create_ship_waypoint_scan_201_json_resp) do
    [data: {SpaceTraders.Fleet, :create_ship_waypoint_scan_201_json_resp_data}]
  end

  def __fields__(:create_ship_waypoint_scan_201_json_resp_data) do
    [cooldown: {SpaceTraders.Cooldown, :t}, waypoints: [{SpaceTraders.ScannedWaypoint, :t}]]
  end

  def __fields__(:create_survey_201_json_resp) do
    [data: {SpaceTraders.Fleet, :create_survey_201_json_resp_data}]
  end

  def __fields__(:create_survey_201_json_resp_data) do
    [cooldown: {SpaceTraders.Cooldown, :t}, surveys: [{SpaceTraders.Survey, :t}]]
  end

  def __fields__(:dock_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :dock_ship_200_json_resp_data}]
  end

  def __fields__(:dock_ship_200_json_resp_data) do
    [nav: {SpaceTraders.ShipNav, :t}]
  end

  def __fields__(:extract_resources_201_json_resp) do
    [data: {SpaceTraders.Fleet, :extract_resources_201_json_resp_data}]
  end

  def __fields__(:extract_resources_201_json_resp_data) do
    [
      cargo: {SpaceTraders.ShipCargo, :t},
      cooldown: {SpaceTraders.Cooldown, :t},
      events: [{SpaceTraders.ShipConditionEvent, :t}],
      extraction: {SpaceTraders.Extraction, :t},
      modifiers: [{SpaceTraders.WaypointModifier, :t}]
    ]
  end

  def __fields__(:extract_resources_with_survey_201_json_resp) do
    [data: {SpaceTraders.Fleet, :extract_resources_with_survey_201_json_resp_data}]
  end

  def __fields__(:extract_resources_with_survey_201_json_resp_data) do
    [
      cargo: {SpaceTraders.ShipCargo, :t},
      cooldown: {SpaceTraders.Cooldown, :t},
      events: [{SpaceTraders.ShipConditionEvent, :t}],
      extraction: {SpaceTraders.Extraction, :t}
    ]
  end

  def __fields__(:get_mounts_200_json_resp) do
    [data: [{SpaceTraders.ShipMount, :t}]]
  end

  def __fields__(:get_my_ship_200_json_resp) do
    [data: {SpaceTraders.Ship, :t}]
  end

  def __fields__(:get_my_ship_cargo_200_json_resp) do
    [data: {SpaceTraders.ShipCargo, :t}]
  end

  def __fields__(:get_my_ships_200_json_resp) do
    [data: [{SpaceTraders.Ship, :t}], meta: {SpaceTraders.Meta, :t}]
  end

  def __fields__(:get_repair_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :get_repair_ship_200_json_resp_data}]
  end

  def __fields__(:get_repair_ship_200_json_resp_data) do
    [transaction: {SpaceTraders.RepairTransaction, :t}]
  end

  def __fields__(:get_scrap_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :get_scrap_ship_200_json_resp_data}]
  end

  def __fields__(:get_scrap_ship_200_json_resp_data) do
    [transaction: {SpaceTraders.ScrapTransaction, :t}]
  end

  def __fields__(:get_ship_cooldown_200_json_resp) do
    [data: {SpaceTraders.Cooldown, :t}]
  end

  def __fields__(:get_ship_modules_200_json_resp) do
    [data: [{SpaceTraders.ShipModule, :t}]]
  end

  def __fields__(:get_ship_nav_200_json_resp) do
    [data: {SpaceTraders.ShipNav, :t}]
  end

  def __fields__(:install_mount_201_json_resp) do
    [data: {SpaceTraders.Fleet, :install_mount_201_json_resp_data}]
  end

  def __fields__(:install_mount_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      mounts: [{SpaceTraders.ShipMount, :t}],
      transaction: {SpaceTraders.ShipModificationTransaction, :t}
    ]
  end

  def __fields__(:install_ship_module_201_json_resp) do
    [data: {SpaceTraders.Fleet, :install_ship_module_201_json_resp_data}]
  end

  def __fields__(:install_ship_module_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      modules: [{SpaceTraders.ShipModule, :t}],
      transaction: {SpaceTraders.Fleet, :install_ship_module_201_json_resp_data_transaction}
    ]
  end

  def __fields__(:install_ship_module_201_json_resp_data_transaction) do
    [
      shipSymbol: :string,
      timestamp: :string,
      totalPrice: :integer,
      tradeSymbol: :string,
      waypointSymbol: :string
    ]
  end

  def __fields__(:jettison_200_json_resp) do
    [data: {SpaceTraders.Fleet, :jettison_200_json_resp_data}]
  end

  def __fields__(:jettison_200_json_resp_data) do
    [cargo: {SpaceTraders.ShipCargo, :t}]
  end

  def __fields__(:jump_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :jump_ship_200_json_resp_data}]
  end

  def __fields__(:jump_ship_200_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cooldown: {SpaceTraders.Cooldown, :t},
      nav: {SpaceTraders.ShipNav, :t},
      transaction: {SpaceTraders.MarketTransaction, :t}
    ]
  end

  def __fields__(:navigate_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :navigate_ship_200_json_resp_data}]
  end

  def __fields__(:navigate_ship_200_json_resp_data) do
    [
      events: [{SpaceTraders.ShipConditionEvent, :t}],
      fuel: {SpaceTraders.ShipFuel, :t},
      nav: {SpaceTraders.ShipNav, :t}
    ]
  end

  def __fields__(:negotiate_contract_201_json_resp) do
    [data: {SpaceTraders.Fleet, :negotiate_contract_201_json_resp_data}]
  end

  def __fields__(:negotiate_contract_201_json_resp_data) do
    [contract: {SpaceTraders.Contract, :t}]
  end

  def __fields__(:orbit_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :orbit_ship_200_json_resp_data}]
  end

  def __fields__(:orbit_ship_200_json_resp_data) do
    [nav: {SpaceTraders.ShipNav, :t}]
  end

  def __fields__(:patch_ship_nav_200_json_resp) do
    [data: {SpaceTraders.Fleet, :patch_ship_nav_200_json_resp_data}]
  end

  def __fields__(:patch_ship_nav_200_json_resp_data) do
    [
      events: [{SpaceTraders.ShipConditionEvent, :t}],
      fuel: {SpaceTraders.ShipFuel, :t},
      nav: {SpaceTraders.ShipNav, :t}
    ]
  end

  def __fields__(:purchase_cargo_201_json_resp) do
    [data: {SpaceTraders.Fleet, :purchase_cargo_201_json_resp_data}]
  end

  def __fields__(:purchase_cargo_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      transaction: {SpaceTraders.MarketTransaction, :t}
    ]
  end

  def __fields__(:purchase_ship_201_json_resp) do
    [data: {SpaceTraders.Fleet, :purchase_ship_201_json_resp_data}]
  end

  def __fields__(:purchase_ship_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      ship: {SpaceTraders.Ship, :t},
      transaction: {SpaceTraders.ShipyardTransaction, :t}
    ]
  end

  def __fields__(:refuel_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :refuel_ship_200_json_resp_data}]
  end

  def __fields__(:refuel_ship_200_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      fuel: {SpaceTraders.ShipFuel, :t},
      transaction: {SpaceTraders.MarketTransaction, :t}
    ]
  end

  def __fields__(:remove_mount_201_json_resp) do
    [data: {SpaceTraders.Fleet, :remove_mount_201_json_resp_data}]
  end

  def __fields__(:remove_mount_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      mounts: [{SpaceTraders.ShipMount, :t}],
      transaction: {SpaceTraders.ShipModificationTransaction, :t}
    ]
  end

  def __fields__(:remove_ship_module_201_json_resp) do
    [data: {SpaceTraders.Fleet, :remove_ship_module_201_json_resp_data}]
  end

  def __fields__(:remove_ship_module_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      modules: [{SpaceTraders.ShipModule, :t}],
      transaction: {SpaceTraders.Fleet, :remove_ship_module_201_json_resp_data_transaction}
    ]
  end

  def __fields__(:remove_ship_module_201_json_resp_data_transaction) do
    [
      shipSymbol: :string,
      timestamp: :string,
      totalPrice: :integer,
      tradeSymbol: :string,
      waypointSymbol: :string
    ]
  end

  def __fields__(:repair_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :repair_ship_200_json_resp_data}]
  end

  def __fields__(:repair_ship_200_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      ship: {SpaceTraders.Ship, :t},
      transaction: {SpaceTraders.RepairTransaction, :t}
    ]
  end

  def __fields__(:scrap_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :scrap_ship_200_json_resp_data}]
  end

  def __fields__(:scrap_ship_200_json_resp_data) do
    [agent: {SpaceTraders.Agent, :t}, transaction: {SpaceTraders.ScrapTransaction, :t}]
  end

  def __fields__(:sell_cargo_201_json_resp) do
    [data: {SpaceTraders.Fleet, :sell_cargo_201_json_resp_data}]
  end

  def __fields__(:sell_cargo_201_json_resp_data) do
    [
      agent: {SpaceTraders.Agent, :t},
      cargo: {SpaceTraders.ShipCargo, :t},
      transaction: {SpaceTraders.MarketTransaction, :t}
    ]
  end

  def __fields__(:ship_refine_201_json_resp) do
    [data: {SpaceTraders.Fleet, :ship_refine_201_json_resp_data}]
  end

  def __fields__(:ship_refine_201_json_resp_data) do
    [
      cargo: {SpaceTraders.ShipCargo, :t},
      consumed: [{SpaceTraders.Fleet, :ship_refine_201_json_resp_data_consumed}],
      cooldown: {SpaceTraders.Cooldown, :t},
      produced: [{SpaceTraders.Fleet, :ship_refine_201_json_resp_data_produced}]
    ]
  end

  def __fields__(:ship_refine_201_json_resp_data_consumed) do
    [tradeSymbol: :string, units: :integer]
  end

  def __fields__(:ship_refine_201_json_resp_data_produced) do
    [tradeSymbol: :string, units: :integer]
  end

  def __fields__(:siphon_resources_201_json_resp) do
    [data: {SpaceTraders.Fleet, :siphon_resources_201_json_resp_data}]
  end

  def __fields__(:siphon_resources_201_json_resp_data) do
    [
      cargo: {SpaceTraders.ShipCargo, :t},
      cooldown: {SpaceTraders.Cooldown, :t},
      events: [{SpaceTraders.ShipConditionEvent, :t}],
      siphon: {SpaceTraders.Siphon, :t}
    ]
  end

  def __fields__(:transfer_cargo_200_json_resp) do
    [data: {SpaceTraders.Fleet, :transfer_cargo_200_json_resp_data}]
  end

  def __fields__(:transfer_cargo_200_json_resp_data) do
    [cargo: {SpaceTraders.ShipCargo, :t}]
  end

  def __fields__(:warp_ship_200_json_resp) do
    [data: {SpaceTraders.Fleet, :warp_ship_200_json_resp_data}]
  end

  def __fields__(:warp_ship_200_json_resp_data) do
    [fuel: {SpaceTraders.ShipFuel, :t}, nav: {SpaceTraders.ShipNav, :t}]
  end
end
