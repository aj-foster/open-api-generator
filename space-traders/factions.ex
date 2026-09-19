defmodule SpaceTraders.Factions do
  @moduledoc """
  Provides API endpoints related to factions
  """

  @default_client SpaceTraders.Client

  @type get_faction_200_json_resp :: %{data: SpaceTraders.Faction.t()}

  @doc """
  Get Faction

  View the details of a faction.
  """
  @spec get_faction(factionSymbol :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Factions.get_faction_200_json_resp()} | :error
  def get_faction(factionSymbol, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [factionSymbol: factionSymbol],
      call: {SpaceTraders.Factions, :get_faction},
      url: "/factions/#{factionSymbol}",
      method: :get,
      response: [{200, {SpaceTraders.Factions, :get_faction_200_json_resp}}],
      opts: opts
    })
  end

  @type get_factions_200_json_resp :: %{
          data: [SpaceTraders.Faction.t()],
          meta: SpaceTraders.Meta.t()
        }

  @doc """
  List Factions

  Return a paginated list of all the factions in the game.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page

  """
  @spec get_factions(opts :: keyword) ::
          {:ok, SpaceTraders.Factions.get_factions_200_json_resp()} | :error
  def get_factions(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {SpaceTraders.Factions, :get_factions},
      url: "/factions",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Factions, :get_factions_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_faction_200_json_resp) do
    [data: {SpaceTraders.Faction, :t}]
  end

  def __fields__(:get_factions_200_json_resp) do
    [data: [{SpaceTraders.Faction, :t}], meta: {SpaceTraders.Meta, :t}]
  end
end
