defmodule SpaceTraders.Contracts do
  @moduledoc """
  Provides API endpoints related to contracts
  """

  @default_client SpaceTraders.Client

  @type accept_contract_200_json_resp :: %{
          data: SpaceTraders.Contracts.accept_contract_200_json_resp_data()
        }

  @type accept_contract_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          contract: SpaceTraders.Contract.t()
        }

  @doc """
  Accept Contract

  Accept a contract by ID. 

  You can only accept contracts that were offered to you, were not accepted yet, and whose deadlines has not passed yet.
  """
  @spec accept_contract(contractId :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Contracts.accept_contract_200_json_resp()} | :error
  def accept_contract(contractId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [contractId: contractId],
      call: {SpaceTraders.Contracts, :accept_contract},
      url: "/my/contracts/#{contractId}/accept",
      method: :post,
      response: [{200, {SpaceTraders.Contracts, :accept_contract_200_json_resp}}],
      opts: opts
    })
  end

  @type deliver_contract_200_json_resp :: %{
          data: SpaceTraders.Contracts.deliver_contract_200_json_resp_data()
        }

  @type deliver_contract_200_json_resp_data :: %{
          cargo: SpaceTraders.ShipCargo.t(),
          contract: SpaceTraders.Contract.t()
        }

  @doc """
  Deliver Cargo to Contract

  Deliver cargo to a contract.

  In order to use this API, a ship must be at the delivery location (denoted in the delivery terms as `destinationSymbol` of a contract) and must have a number of units of a good required by this contract in its cargo.

  Cargo that was delivered will be removed from the ship's cargo.

  ## Request Body

  **Content Types**: `application/json`

  """
  @spec deliver_contract(contractId :: String.t(), body :: map, opts :: keyword) ::
          {:ok, SpaceTraders.Contracts.deliver_contract_200_json_resp()} | :error
  def deliver_contract(contractId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [contractId: contractId, body: body],
      call: {SpaceTraders.Contracts, :deliver_contract},
      url: "/my/contracts/#{contractId}/deliver",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [{200, {SpaceTraders.Contracts, :deliver_contract_200_json_resp}}],
      opts: opts
    })
  end

  @type fulfill_contract_200_json_resp :: %{
          data: SpaceTraders.Contracts.fulfill_contract_200_json_resp_data()
        }

  @type fulfill_contract_200_json_resp_data :: %{
          agent: SpaceTraders.Agent.t(),
          contract: SpaceTraders.Contract.t()
        }

  @doc """
  Fulfill Contract

  Fulfill a contract. Can only be used on contracts that have all of their delivery terms fulfilled.
  """
  @spec fulfill_contract(contractId :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Contracts.fulfill_contract_200_json_resp()} | :error
  def fulfill_contract(contractId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [contractId: contractId],
      call: {SpaceTraders.Contracts, :fulfill_contract},
      url: "/my/contracts/#{contractId}/fulfill",
      method: :post,
      response: [{200, {SpaceTraders.Contracts, :fulfill_contract_200_json_resp}}],
      opts: opts
    })
  end

  @type get_contract_200_json_resp :: %{data: SpaceTraders.Contract.t()}

  @doc """
  Get Contract

  Get the details of a contract by ID.
  """
  @spec get_contract(contractId :: String.t(), opts :: keyword) ::
          {:ok, SpaceTraders.Contracts.get_contract_200_json_resp()} | :error
  def get_contract(contractId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [contractId: contractId],
      call: {SpaceTraders.Contracts, :get_contract},
      url: "/my/contracts/#{contractId}",
      method: :get,
      response: [{200, {SpaceTraders.Contracts, :get_contract_200_json_resp}}],
      opts: opts
    })
  end

  @type get_contracts_200_json_resp :: %{
          data: [SpaceTraders.Contract.t()],
          meta: SpaceTraders.Meta.t()
        }

  @doc """
  List Contracts

  Return a paginated list of all your contracts.

  ## Options

    * `page`: What entry offset to request
    * `limit`: How many entries to return per page

  """
  @spec get_contracts(opts :: keyword) ::
          {:ok, SpaceTraders.Contracts.get_contracts_200_json_resp()} | :error
  def get_contracts(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:limit, :page])

    client.request(%{
      args: [],
      call: {SpaceTraders.Contracts, :get_contracts},
      url: "/my/contracts",
      method: :get,
      query: query,
      response: [{200, {SpaceTraders.Contracts, :get_contracts_200_json_resp}}],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:accept_contract_200_json_resp) do
    [data: {SpaceTraders.Contracts, :accept_contract_200_json_resp_data}]
  end

  def __fields__(:accept_contract_200_json_resp_data) do
    [agent: {SpaceTraders.Agent, :t}, contract: {SpaceTraders.Contract, :t}]
  end

  def __fields__(:deliver_contract_200_json_resp) do
    [data: {SpaceTraders.Contracts, :deliver_contract_200_json_resp_data}]
  end

  def __fields__(:deliver_contract_200_json_resp_data) do
    [cargo: {SpaceTraders.ShipCargo, :t}, contract: {SpaceTraders.Contract, :t}]
  end

  def __fields__(:fulfill_contract_200_json_resp) do
    [data: {SpaceTraders.Contracts, :fulfill_contract_200_json_resp_data}]
  end

  def __fields__(:fulfill_contract_200_json_resp_data) do
    [agent: {SpaceTraders.Agent, :t}, contract: {SpaceTraders.Contract, :t}]
  end

  def __fields__(:get_contract_200_json_resp) do
    [data: {SpaceTraders.Contract, :t}]
  end

  def __fields__(:get_contracts_200_json_resp) do
    [data: [{SpaceTraders.Contract, :t}], meta: {SpaceTraders.Meta, :t}]
  end
end
