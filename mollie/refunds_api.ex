defmodule Mollie.RefundsAPI do
  @moduledoc """
  Provides API endpoints related to refunds api
  """

  @default_client Mollie.Client

  @doc """
  Cancel payment refund

  Refunds will be executed with a delay of two hours. Until that time, refunds may be canceled manually via the
  Mollie Dashboard, or by using this endpoint.

  A refund can only be canceled while its `status` field is either `queued` or `pending`. See the
  [Get refund endpoint](get-refund) for more information.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec cancel_refund(paymentId :: String.t(), refundId :: String.t(), opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def cancel_refund(paymentId, refundId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [paymentId: paymentId, refundId: refundId],
      call: {Mollie.RefundsAPI, :cancel_refund},
      url: "/payments/#{paymentId}/refunds/#{refundId}",
      method: :delete,
      query: query,
      response: [{204, :null}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Create payment refund

  Creates a refund for a specific payment. The refunded amount is credited to your customer usually either via a bank
  transfer or by refunding the amount to your customer's credit card.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_refund(paymentId :: String.t(), body :: Mollie.RefundRequest.t(), opts :: keyword) ::
          {:ok, Mollie.EntityRefundResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_refund(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.RefundsAPI, :create_refund},
      url: "/payments/#{paymentId}/refunds",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.RefundRequest, :t}}],
      response: [
        {201, {Mollie.EntityRefundResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {409, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get payment refund

  Retrieve a single payment refund by its ID and the ID of its parent payment.

  ## Options

    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_refund(paymentId :: String.t(), refundId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityRefundResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_refund(paymentId, refundId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :testmode])

    client.request(%{
      args: [paymentId: paymentId, refundId: refundId],
      call: {Mollie.RefundsAPI, :get_refund},
      url: "/payments/#{paymentId}/refunds/#{refundId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.EntityRefundResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_all_refunds_200__resp :: %{
          _embedded: Mollie.RefundsAPI.list_all_refunds_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_all_refunds_200__resp_embedded :: %{refunds: [Mollie.EntityRefundResponse.t()]}

  @doc """
  List all refunds

  Retrieve a list of all of your refunds.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.
    * `sort`: Used for setting the direction of the result set. Defaults to descending order, meaning the results are ordered from
      newest to oldest.
    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve the resources for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` can be omitted. For
      organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_all_refunds(opts :: keyword) ::
          {:ok, Mollie.RefundsAPI.list_all_refunds_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_all_refunds(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :profileId, :sort, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.RefundsAPI, :list_all_refunds},
      url: "/refunds",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.RefundsAPI, :list_all_refunds_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_refunds_200__resp :: %{
          _embedded: Mollie.RefundsAPI.list_refunds_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_refunds_200__resp_embedded :: %{refunds: [Mollie.EntityRefundResponse.t()]}

  @doc """
  List payment refunds

  Retrieve a list of all refunds created for a specific payment.

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
  @spec list_refunds(paymentId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.RefundsAPI.list_refunds_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_refunds(paymentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [paymentId: paymentId],
      call: {Mollie.RefundsAPI, :list_refunds},
      url: "/payments/#{paymentId}/refunds",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.RefundsAPI, :list_refunds_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_all_refunds_200__resp) do
    [
      _embedded: {Mollie.RefundsAPI, :list_all_refunds_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_all_refunds_200__resp_embedded) do
    [refunds: [{Mollie.EntityRefundResponse, :t}]]
  end

  def __fields__(:list_refunds_200__resp) do
    [
      _embedded: {Mollie.RefundsAPI, :list_refunds_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_refunds_200__resp_embedded) do
    [refunds: [{Mollie.EntityRefundResponse, :t}]]
  end
end
