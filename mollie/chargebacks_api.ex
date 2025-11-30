defmodule Mollie.ChargebacksAPI do
  @moduledoc """
  Provides API endpoints related to chargebacks api
  """

  @default_client Mollie.Client

  @doc """
  Get payment chargeback

  Retrieve a single payment chargeback by its ID and the ID of its parent payment.

  ## Options

    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_chargeback(paymentId :: String.t(), chargebackId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityChargeback.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_chargeback(paymentId, chargebackId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :testmode])

    client.request(%{
      args: [paymentId: paymentId, chargebackId: chargebackId],
      call: {Mollie.ChargebacksAPI, :get_chargeback},
      url: "/payments/#{paymentId}/chargebacks/#{chargebackId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityChargeback, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_all_chargebacks_200__resp :: %{
          _embedded: Mollie.ChargebacksAPI.list_all_chargebacks_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_all_chargebacks_200__resp_embedded :: %{chargebacks: [Mollie.EntityChargeback.t()]}

  @doc """
  List all chargebacks

  Retrieve all chargebacks initiated for all your payments.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve chargebacks for.
      
      Most API credentials are linked to a single profile. In these cases the
      `profileId` is already implied.
      
      To retrieve all chargebacks across the organization, use an
      organization-level API credential and omit the `profileId` parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_all_chargebacks(opts :: keyword) ::
          {:ok, Mollie.ChargebacksAPI.list_all_chargebacks_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_all_chargebacks(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.ChargebacksAPI, :list_all_chargebacks},
      url: "/chargebacks",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ChargebacksAPI, :list_all_chargebacks_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_chargebacks_200__resp :: %{
          _embedded: Mollie.ChargebacksAPI.list_chargebacks_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_chargebacks_200__resp_embedded :: %{chargebacks: [Mollie.EntityChargeback.t()]}

  @doc """
  List payment chargebacks

  Retrieve the chargebacks initiated for a specific payment.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_chargebacks(paymentId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.ChargebacksAPI.list_chargebacks_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_chargebacks(paymentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [paymentId: paymentId],
      call: {Mollie.ChargebacksAPI, :list_chargebacks},
      url: "/payments/#{paymentId}/chargebacks",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ChargebacksAPI, :list_chargebacks_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_all_chargebacks_200__resp) do
    [
      _embedded: {Mollie.ChargebacksAPI, :list_all_chargebacks_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_all_chargebacks_200__resp_embedded) do
    [chargebacks: [{Mollie.EntityChargeback, :t}]]
  end

  def __fields__(:list_chargebacks_200__resp) do
    [
      _embedded: {Mollie.ChargebacksAPI, :list_chargebacks_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_chargebacks_200__resp_embedded) do
    [chargebacks: [{Mollie.EntityChargeback, :t}]]
  end
end
