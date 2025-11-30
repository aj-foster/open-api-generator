defmodule Mollie.CapturesAPI do
  @moduledoc """
  Provides API endpoints related to captures api
  """

  @default_client Mollie.Client

  @doc """
  Create capture

  Capture an *authorized* payment.

  Some payment methods allow you to first collect a customer's authorization,
  and capture the amount at a later point.

  By default, Mollie captures payments automatically. If however you
  configured your payment with `captureMode: manual`, you can capture the payment using this endpoint after
  having collected the customer's authorization.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_capture(paymentId :: String.t(), body :: Mollie.EntityCapture.t(), opts :: keyword) ::
          {:ok, Mollie.CaptureResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_capture(paymentId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [paymentId: paymentId, body: body],
      call: {Mollie.CapturesAPI, :create_capture},
      url: "/payments/#{paymentId}/captures",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.EntityCapture, :t}}],
      response: [
        {201, {Mollie.CaptureResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get capture

  Retrieve a single payment capture by its ID and the ID of its parent
  payment.

  ## Options

    * `embed`: This endpoint allows embedding related API items by appending the following values via the `embed` query string
      parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_capture(paymentId :: String.t(), captureId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.CaptureResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_capture(paymentId, captureId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :testmode])

    client.request(%{
      args: [paymentId: paymentId, captureId: captureId],
      call: {Mollie.CapturesAPI, :get_capture},
      url: "/payments/#{paymentId}/captures/#{captureId}",
      method: :get,
      query: query,
      response: [{200, {Mollie.CaptureResponse, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @type list_captures_200__resp :: %{
          _embedded: Mollie.CapturesAPI.list_captures_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_captures_200__resp_embedded :: %{captures: [Mollie.CaptureResponse.t()]}

  @doc """
  List captures

  Retrieve a list of all captures created for a specific payment.

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
  @spec list_captures(paymentId :: String.t(), opts :: keyword) ::
          {:ok, Mollie.CapturesAPI.list_captures_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_captures(paymentId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:embed, :from, :limit, :testmode])

    client.request(%{
      args: [paymentId: paymentId],
      call: {Mollie.CapturesAPI, :list_captures},
      url: "/payments/#{paymentId}/captures",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.CapturesAPI, :list_captures_200__resp}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_captures_200__resp) do
    [
      _embedded: {Mollie.CapturesAPI, :list_captures_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_captures_200__resp_embedded) do
    [captures: [{Mollie.CaptureResponse, :t}]]
  end
end
