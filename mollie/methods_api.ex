defmodule Mollie.MethodsAPI do
  @moduledoc """
  Provides API endpoints related to methods api
  """

  @default_client Mollie.Client

  @doc """
  Disable payment method

  Disable a payment method on a specific profile.

  When using a profile-specific API credential, the alias `me` can be used
  instead of the profile ID to refer to the current profile.
  """
  @spec disable_method(profileId :: String.t(), id :: String.t(), opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def disable_method(profileId, id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [profileId: profileId, id: id],
      call: {Mollie.MethodsAPI, :disable_method},
      url: "/profiles/#{profileId}/methods/#{id}",
      method: :delete,
      response: [{204, :null}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Disable payment method issuer

  Disable an issuer for a payment method on a specific profile.

  Currently only the payment methods `voucher` and `giftcard` are supported.

  When using a profile-specific API credential, the alias `me` can be used instead of the profile ID to refer to the
  current profile.
  """
  @spec disable_method_issuer(
          profileId :: String.t(),
          methodId :: String.t(),
          id :: String.t(),
          opts :: keyword
        ) :: :ok | {:error, Mollie.ErrorResponse.t()}
  def disable_method_issuer(profileId, methodId, id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [profileId: profileId, methodId: methodId, id: id],
      call: {Mollie.MethodsAPI, :disable_method_issuer},
      url: "/profiles/#{profileId}/methods/#{methodId}/issuers/#{id}",
      method: :delete,
      response: [{204, :null}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Enable payment method

  Enable a payment method on a specific profile.

  When using a profile-specific API credential, the alias `me` can be used
  instead of the profile ID to refer to the current profile.

  Some payment methods require extra steps in order to be activated. In cases
  where a step at the payment method provider needs to be completed first, the status will be set to
  `pending-external` and the response will contain a link to complete the activation at the provider.

  To enable voucher or gift card issuers, refer to the [Enable payment method issuer](enable-method-issuer) endpoint.
  """
  @spec enable_method(profileId :: String.t(), id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityMethod.t()} | {:error, Mollie.ErrorResponse.t()}
  def enable_method(profileId, id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [profileId: profileId, id: id],
      call: {Mollie.MethodsAPI, :enable_method},
      url: "/profiles/#{profileId}/methods/#{id}",
      method: :post,
      response: [{200, {Mollie.EntityMethod, :t}}, {404, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Enable payment method issuer

  Enable an issuer for a payment method on a specific profile.

  Currently only the payment methods `voucher` and `giftcard` are supported.

  When using a profile-specific API credential, the alias `me` can be used instead of the profile ID to refer to the
  current profile.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec enable_method_issuer(
          profileId :: String.t(),
          methodId :: String.t(),
          id :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Mollie.Giftcard.t() | Mollie.Voucher.t()} | {:error, Mollie.ErrorResponse.t()}
  def enable_method_issuer(profileId, methodId, id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [profileId: profileId, methodId: methodId, id: id, body: body],
      call: {Mollie.MethodsAPI, :enable_method_issuer},
      url: "/profiles/#{profileId}/methods/#{methodId}/issuers/#{id}",
      body: body,
      method: :post,
      request: [{"application/json", :map}],
      response: [
        {200, {:union, [{Mollie.Giftcard, :t}, {Mollie.Voucher, :t}]}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get payment method

  Retrieve a single payment method by its ID.

  If a method is not available on this profile, a `404 Not Found` response is
  returned. If the method is available but not enabled yet, a status `403 Forbidden` is returned. You can enable
  payments methods via the [Enable payment method endpoint](enable-method) of the Profiles API, or via
  the Mollie Dashboard.

  If you do not know the method's ID, you can use the [methods list
  endpoint](list-methods) to retrieve all payment methods that are available.

  Additionally, it is possible to check if wallet methods such as Apple Pay
  are enabled by passing the wallet ID (`applepay`) as the method ID.

  ## Options

    * `locale`: Response language
    * `currency`: If provided, the `minimumAmount` and `maximumAmount` will be converted
      to the given currency. An error is returned if the currency is not supported by the payment method.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve the resources for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` can be omitted. For
      organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.
    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.
    * `sequenceType`: Set this parameter to `first` to only return the methods that
      can be used for the first payment of a recurring sequence.
      
      Set it to `recurring` to only return methods that can be used for recurring payments or subscriptions.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_method(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.EntityMethod.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_method(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [:currency, :include, :locale, :profileId, :sequenceType, :testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.MethodsAPI, :get_method},
      url: "/methods/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.EntityMethod, :t}},
        {400, {Mollie.ErrorResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_all_methods_200__resp :: %{
          _embedded: Mollie.MethodsAPI.list_all_methods_200__resp_embedded(),
          _links: Mollie.MethodsAPI.list_all_methods_200__resp_links(),
          count: integer
        }

  @type list_all_methods_200__resp_embedded :: %{methods: [Mollie.EntityMethodAll.t()]}

  @type list_all_methods_200__resp_links :: %{documentation: Mollie.Url.t(), self: Mollie.Url.t()}

  @doc """
  List all payment methods

  Retrieve all payment methods that Mollie offers, regardless of the eligibility of the organization for the specific
  method. The results of this endpoint are **not** paginated — unlike most other list endpoints in our API.

  The list can optionally be filtered using a number of parameters described below.

  ## Options

    * `locale`: Response language
    * `amount`: If supplied, only payment methods that support the amount and currency
      are returned.
      
      Example: `/v2/methods/all?amount[value]=100.00&amount[currency]=USD`
    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.
    * `sequenceType`: Set this parameter to `first` to only return the methods that
      can be used for the first payment of a recurring sequence.
      
      Set it to `recurring` to only return methods that can be used for recurring payments or subscriptions.
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve the resources for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` can be omitted. For
      organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_all_methods(opts :: keyword) ::
          {:ok, Mollie.MethodsAPI.list_all_methods_200__resp()}
          | {:error, Mollie.ErrorResponse.t()}
  def list_all_methods(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:amount, :include, :locale, :profileId, :sequenceType, :testmode])

    client.request(%{
      args: [],
      call: {Mollie.MethodsAPI, :list_all_methods},
      url: "/methods/all",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.MethodsAPI, :list_all_methods_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_methods_200__resp :: %{
          _embedded: Mollie.MethodsAPI.list_methods_200__resp_embedded(),
          _links: Mollie.MethodsAPI.list_methods_200__resp_links(),
          count: integer
        }

  @type list_methods_200__resp_embedded :: %{methods: [Mollie.EntityMethod.t()]}

  @type list_methods_200__resp_links :: %{documentation: Mollie.Url.t(), self: Mollie.Url.t()}

  @doc """
  List payment methods

  Retrieve all enabled payment methods. The results of this endpoint are
  **not** paginated — unlike most other list endpoints in our API.

  For test mode, all pending and enabled payment methods are returned. If no
  payment methods are requested yet, the most popular payment methods are returned in the test mode. For live
  mode, only fully enabled payment methods are returned.

  Payment methods can be requested and enabled via the Mollie Dashboard, or
  via the [Enable payment method endpoint](enable-method) of the Profiles API.

  The list can optionally be filtered using a number of parameters described
  below.

  By default, only payment methods for the Euro currency are returned. If you
  wish to retrieve payment methods which exclusively support other currencies (e.g. Twint), you need to use the
  `amount` parameters.

  ## Options

    * `sequenceType`: Set this parameter to `first` to only return the enabled methods that
      can be used for the first payment of a recurring sequence.
      
      Set it to `recurring` to only return enabled methods that can be used for recurring payments or subscriptions.
    * `locale`: Response language
    * `amount`: If supplied, only payment methods that support the amount and currency
      are returned.
      
      Example: `/v2/methods?amount[value]=100.00&amount[currency]=USD`
    * `resource`: **⚠️ We no longer recommend using the Orders API. Please refer to the [Payments API](payments-api) instead.**
      
      Indicate if you will use the result for the [Create order](create-order)
      or the [Create payment](create-payment) endpoint.
      
      When passing the value `orders`, the result will include payment methods
      that are only available for payments created via the Orders API.
    * `billingCountry`: The country taken from your customer's billing address in ISO 3166-1 alpha-2 format. This parameter can be used
      to check whether your customer is eligible for certain payment methods, for example for Klarna.
      
      Example: `/v2/methods?resource=orders&billingCountry=DE`
    * `includeWallets`: A comma-separated list of the wallets you support in your checkout. Wallets often require wallet specific code
      to check if they are available on the shoppers device, hence the need to indicate your support.
    * `orderLineCategories`: A comma-separated list of the line categories you support in your checkout.
      
      Example: `/v2/methods?orderLineCategories=eco,meal`
    * `profileId`: The identifier referring to the [profile](get-profile) you wish to
      retrieve the resources for.
      
      Most API credentials are linked to a single profile. In these cases the `profileId` can be omitted. For
      organization-level credentials such as OAuth access tokens however, the `profileId` parameter is required.
    * `include`: This endpoint allows you to include additional information via the `include` query string parameter.
    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec list_methods(opts :: keyword) ::
          {:ok, Mollie.MethodsAPI.list_methods_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_methods(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :amount,
        :billingCountry,
        :include,
        :includeWallets,
        :locale,
        :orderLineCategories,
        :profileId,
        :resource,
        :sequenceType,
        :testmode
      ])

    client.request(%{
      args: [],
      call: {Mollie.MethodsAPI, :list_methods},
      url: "/methods",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.MethodsAPI, :list_methods_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_all_methods_200__resp) do
    [
      _embedded: {Mollie.MethodsAPI, :list_all_methods_200__resp_embedded},
      _links: {Mollie.MethodsAPI, :list_all_methods_200__resp_links},
      count: :integer
    ]
  end

  def __fields__(:list_all_methods_200__resp_embedded) do
    [methods: [{Mollie.EntityMethodAll, :t}]]
  end

  def __fields__(:list_all_methods_200__resp_links) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end

  def __fields__(:list_methods_200__resp) do
    [
      _embedded: {Mollie.MethodsAPI, :list_methods_200__resp_embedded},
      _links: {Mollie.MethodsAPI, :list_methods_200__resp_links},
      count: :integer
    ]
  end

  def __fields__(:list_methods_200__resp_embedded) do
    [methods: [{Mollie.EntityMethod, :t}]]
  end

  def __fields__(:list_methods_200__resp_links) do
    [documentation: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
