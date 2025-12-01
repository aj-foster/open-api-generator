defmodule SpaceTraders.Data do
  @moduledoc """
  Provides API endpoint related to data
  """

  @default_client SpaceTraders.Client

  @type get_supply_chain_200_json_resp :: %{
          data: SpaceTraders.Data.get_supply_chain_200_json_resp_data()
        }

  @type get_supply_chain_200_json_resp_data :: %{exportToImportMap: map}

  @doc """
  Get Supply Chain

  Describes which import and exports map to each other.
  """
  @spec get_supply_chain(opts :: keyword) ::
          {:ok, SpaceTraders.Data.get_supply_chain_200_json_resp()} | :error
  def get_supply_chain(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {SpaceTraders.Data, :get_supply_chain},
      url: "/market/supply-chain",
      method: :get,
      response: [{200, {SpaceTraders.Data, :get_supply_chain_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:get_supply_chain_200_json_resp) do
    [data: {SpaceTraders.Data, :get_supply_chain_200_json_resp_data}]
  end

  def __fields__(:get_supply_chain_200_json_resp_data) do
    [exportToImportMap: :map]
  end
end
