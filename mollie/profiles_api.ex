defmodule Mollie.ProfilesAPI do
  @moduledoc """
  Provides API endpoints related to profiles api
  """

  @default_client Mollie.Client

  @doc """
  Create profile

  Create a profile to process payments on.

  Profiles are required for payment processing. Normally they are created via the Mollie dashboard. Alternatively, you
  can use this endpoint to automate profile creation.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec create_profile(body :: Mollie.ProfileRequest.t(), opts :: keyword) ::
          {:ok, Mollie.ProfileResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def create_profile(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Mollie.ProfilesAPI, :create_profile},
      url: "/profiles",
      body: body,
      method: :post,
      request: [{"application/json", {Mollie.ProfileRequest, :t}}],
      response: [{201, {Mollie.ProfileResponse, :t}}, {422, {Mollie.ErrorResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Delete profile

  Delete a profile. A deleted profile and its related credentials can no longer be used for accepting payments.
  """
  @spec delete_profile(id :: String.t(), opts :: keyword) ::
          :ok | {:error, Mollie.ErrorResponse.t()}
  def delete_profile(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Mollie.ProfilesAPI, :delete_profile},
      url: "/profiles/#{id}",
      method: :delete,
      response: [
        {204, :null},
        {404, {Mollie.ErrorResponse, :t}},
        {410, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get current profile

  Retrieve the currently authenticated profile. A convenient alias of the [Get profile](get-profile)
  endpoint.

  For a complete reference of the profile object, refer to the [Get profile](get-profile) endpoint
  documentation.
  """
  @spec get_current_profile(opts :: keyword) :: {:ok, Mollie.ProfileResponse.t()} | :error
  def get_current_profile(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Mollie.ProfilesAPI, :get_current_profile},
      url: "/profiles/me",
      method: :get,
      response: [{200, {Mollie.ProfileResponse, :t}}],
      opts: opts
    })
  end

  @doc """
  Get profile

  Retrieve a single profile by its ID.

  ## Options

    * `testmode`: Most API credentials are specifically created for either live mode or test mode. In those cases the `testmode` query
      parameter can be omitted. For organization-level credentials such as OAuth access tokens, you can enable test mode by
      setting the `testmode` query parameter to `true`.
      
      Test entities cannot be retrieved when the endpoint is set to live mode, and vice versa.

  """
  @spec get_profile(id :: String.t(), opts :: keyword) ::
          {:ok, Mollie.ProfileResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def get_profile(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:testmode])

    client.request(%{
      args: [id: id],
      call: {Mollie.ProfilesAPI, :get_profile},
      url: "/profiles/#{id}",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ProfileResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {410, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @type list_profiles_200__resp :: %{
          _embedded: Mollie.ProfilesAPI.list_profiles_200__resp_embedded(),
          _links: Mollie.ListLinks.t(),
          count: integer
        }

  @type list_profiles_200__resp_embedded :: %{profiles: [Mollie.ProfileResponse.t()]}

  @doc """
  List profiles

  Retrieve a list of all of your profiles.

  The results are paginated.

  ## Options

    * `from`: Provide an ID to start the result set from the item with the given ID and onwards. This allows you to paginate the
      result set.
    * `limit`: The maximum number of items to return. Defaults to 50 items.

  """
  @spec list_profiles(opts :: keyword) ::
          {:ok, Mollie.ProfilesAPI.list_profiles_200__resp()} | {:error, Mollie.ErrorResponse.t()}
  def list_profiles(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:from, :limit])

    client.request(%{
      args: [],
      call: {Mollie.ProfilesAPI, :list_profiles},
      url: "/profiles",
      method: :get,
      query: query,
      response: [
        {200, {Mollie.ProfilesAPI, :list_profiles_200__resp}},
        {400, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Update profile

  Update an existing profile.

  Profiles are required for payment processing. Normally they are created and updated via the Mollie dashboard.
  Alternatively, you can use this endpoint to automate profile management.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_profile(id :: String.t(), body :: map, opts :: keyword) ::
          {:ok, Mollie.ProfileResponse.t()} | {:error, Mollie.ErrorResponse.t()}
  def update_profile(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Mollie.ProfilesAPI, :update_profile},
      url: "/profiles/#{id}",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [
        {200, {Mollie.ProfileResponse, :t}},
        {404, {Mollie.ErrorResponse, :t}},
        {410, {Mollie.ErrorResponse, :t}},
        {422, {Mollie.ErrorResponse, :t}}
      ],
      opts: opts
    })
  end

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:list_profiles_200__resp) do
    [
      _embedded: {Mollie.ProfilesAPI, :list_profiles_200__resp_embedded},
      _links: {Mollie.ListLinks, :t},
      count: :integer
    ]
  end

  def __fields__(:list_profiles_200__resp_embedded) do
    [profiles: [{Mollie.ProfileResponse, :t}]]
  end
end
