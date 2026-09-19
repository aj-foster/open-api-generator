defmodule Mollie.TerminalsAPI do
  @moduledoc """
  Provides API endpoints related to terminals api
  """

  @default_client Mollie.Client

  @doc """
  Get terminal

  Retrieve a single terminal by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_terminal(terminalId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityTerminal.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_terminal(terminalId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [terminalId: terminalId],
      call: {Mollie.TerminalsAPI, :get_terminal},
      url: "/terminals/#{terminalId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityTerminal, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_terminals_200__resp :: %{
          _embedded: Mollie.TerminalsAPI.list_terminals_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_terminals_200__resp_embedded :: %{terminals: [Mollie.EntityTerminal.t()] | nil}

  @doc """
  List terminals

  Retrieve a list of all physical point-of-sale devices.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_terminals(opts :: keyword) ::
          {:ok, Mollie.TerminalsAPI.list_terminals_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_terminals(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.TerminalsAPI, :list_terminals},
      url: "/terminals",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.TerminalsAPI, :list_terminals_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_terminals_200__resp) do
    [
      _embedded: {Mollie.TerminalsAPI, :list_terminals_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_terminals_200__resp_embedded) do
    [terminals: [{Mollie.EntityTerminal, :t}]]
  end
end
