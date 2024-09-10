defmodule Coupons do
  @moduledoc """
  Provides API endpoints related to coupons
  """

  @default_client Client

  @doc """
  Create Coupon

  Creates a new coupon.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `coupons:write`
  """
  @spec create_coupon(CouponCreateQuery.t(), keyword) ::
          {:ok, PostCouponResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_coupon(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Coupons, :create_coupon},
      url: "/api/coupons/",
      body: body,
      method: :post,
      request: [{"application/json", {CouponCreateQuery, :t}}],
      response: [
        {201, {PostCouponResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Coupon Code

  Synchronously creates a coupon code for the given coupon.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `coupon-codes:write`
  """
  @spec create_coupon_code(CouponCodeCreateQuery.t(), keyword) ::
          {:ok, PostCouponCodeResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_coupon_code(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Coupons, :create_coupon_code},
      url: "/api/coupon-codes/",
      body: body,
      method: :post,
      request: [{"application/json", {CouponCodeCreateQuery, :t}}],
      response: [
        {201, {PostCouponCodeResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Coupon

  Delete the coupon with the given coupon ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `coupons:write`
  """
  @spec delete_coupon(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_coupon(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Coupons, :delete_coupon},
      url: "/api/coupons/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Delete Coupon Code

  Deletes a coupon code specified by the given identifier synchronously. If a profile has been assigned to the
  coupon code, an exception will be raised<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `coupon-codes:write`
  """
  @spec delete_coupon_code(String.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def delete_coupon_code(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Coupons, :delete_coupon_code},
      url: "/api/coupon-codes/#{id}/",
      method: :delete,
      response: [
        {204, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon

  Get a specific coupon with the given coupon ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupons:read`

  ## Options

    * `fields[coupon]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_coupon(String.t(), keyword) ::
          {:ok, GetCouponResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon]"])

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon},
      url: "/api/coupons/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Code

  Returns a Coupon Code specified by the given identifier.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `fields[coupon-code]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[coupon]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_coupon_code(String.t(), keyword) ::
          {:ok, GetCouponCodeResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_code(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon-code]", :"fields[coupon]", :include])

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon_code},
      url: "/api/coupon-codes/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponCodeResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Code Bulk Create Job

  Get a coupon code bulk create job with the given job ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `fields[coupon-code-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[coupon-code]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_coupon_code_bulk_create_job(String.t(), keyword) ::
          {:ok, GetCouponCodeCreateJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_code_bulk_create_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[coupon-code-bulk-create-job]",
        :"fields[coupon-code]",
        :include
      ])

    client.request(%{
      args: [job_id: job_id],
      call: {Coupons, :get_coupon_code_bulk_create_job},
      url: "/api/coupon-code-bulk-create-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponCodeCreateJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Code Bulk Create Jobs

  Get all coupon code bulk create jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `fields[coupon-code-bulk-create-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_coupon_code_bulk_create_jobs(keyword) ::
          {:ok, GetCouponCodeCreateJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_code_bulk_create_jobs(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon-code-bulk-create-job]", :filter, :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Coupons, :get_coupon_code_bulk_create_jobs},
      url: "/api/coupon-code-bulk-create-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponCodeCreateJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Code Relationships Coupon

  Gets a list of coupon code relationships associated with the given coupon id<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_coupon_code_relationships_coupon(String.t(), keyword) ::
          {:ok, GetCouponRelationshipCouponCodesListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_code_relationships_coupon(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon_code_relationships_coupon},
      url: "/api/coupons/#{id}/relationships/coupon-codes/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponRelationshipCouponCodesListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Codes

  Gets a list of coupon codes associated with a coupon/coupons or a profile/profiles.

  A coupon/coupons or a profile/profiles must be provided as required filter params.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `fields[coupon-code]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[coupon]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`expires_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`status`: `equals`<br>`coupon.id`: `any`, `equals`<br>`profile.id`: `any`, `equals`
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_coupon_codes(keyword) ::
          {:ok, GetCouponCodeResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_codes(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[coupon-code]",
        :"fields[coupon]",
        :filter,
        :include,
        :"page[cursor]"
      ])

    client.request(%{
      args: [],
      call: {Coupons, :get_coupon_codes},
      url: "/api/coupon-codes/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponCodeResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Codes For Coupon

  Gets a list of coupon codes associated with the given coupon id<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupon-codes:read`

  ## Options

    * `fields[coupon-code]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`expires_at`: `greater-or-equal`, `greater-than`, `less-or-equal`, `less-than`<br>`status`: `equals`<br>`coupon.id`: `any`, `equals`<br>`profile.id`: `any`, `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_coupon_codes_for_coupon(String.t(), keyword) ::
          {:ok, GetCouponCodeResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_codes_for_coupon(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon-code]", :filter, :"page[cursor]"])

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon_codes_for_coupon},
      url: "/api/coupons/#{id}/coupon-codes/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponCodeResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon For Coupon Code

  Gets a list of coupon codes associated with the given coupon id<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupons:read`

  ## Options

    * `fields[coupon]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_coupon_for_coupon_code(String.t(), keyword) ::
          {:ok, GetCouponResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_for_coupon_code(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon]"])

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon_for_coupon_code},
      url: "/api/coupon-codes/#{id}/coupon/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupon Relationships Coupon Codes

  Gets the coupon relationship associated with the given coupon code id<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupons:read`
  """
  @spec get_coupon_relationships_coupon_codes(String.t(), keyword) ::
          {:ok, GetCouponCodeRelationshipCouponResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupon_relationships_coupon_codes(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Coupons, :get_coupon_relationships_coupon_codes},
      url: "/api/coupon-codes/#{id}/relationships/coupon/",
      method: :get,
      response: [
        {200, {GetCouponCodeRelationshipCouponResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Coupons

  Get all coupons in an account.

  To learn more, see our [Coupons API guide](https://developers.klaviyo.com/en/docs/use_klaviyos_coupons_api).<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupons:read`

  ## Options

    * `fields[coupon]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination

  """
  @spec get_coupons(keyword) ::
          {:ok, GetCouponResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_coupons(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[coupon]", :"page[cursor]"])

    client.request(%{
      args: [],
      call: {Coupons, :get_coupons},
      url: "/api/coupons/",
      method: :get,
      query: query,
      response: [
        {200, {GetCouponResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Coupon Code Bulk Create Job

  Create a coupon-code-bulk-create-job to bulk create a list of coupon codes.

  Max number of jobs queued at once we allow for is 100.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `coupon-codes:write`
  """
  @spec spawn_coupon_code_bulk_create_job(CouponCodeCreateJobCreateQuery.t(), keyword) ::
          {:ok, PostCouponCodeCreateJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_coupon_code_bulk_create_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Coupons, :spawn_coupon_code_bulk_create_job},
      url: "/api/coupon-code-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {CouponCodeCreateJobCreateQuery, :t}}],
      response: [
        {202, {PostCouponCodeCreateJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Coupon

  *Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `coupons:write`
  """
  @spec update_coupon(String.t(), CouponUpdateQuery.t(), keyword) ::
          {:ok, PatchCouponResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_coupon(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Coupons, :update_coupon},
      url: "/api/coupons/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CouponUpdateQuery, :t}}],
      response: [
        {200, {PatchCouponResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Coupon Code

  Updates a coupon code specified by the given identifier synchronously. We allow updating the 'status' and
  'expires_at' of coupon codes.<br><br>*Rate limits*:<br>Burst: `350/s`<br>Steady: `3500/m`

  **Scopes:**
  `coupon-codes:write`
  """
  @spec update_coupon_code(String.t(), CouponCodeUpdateQuery.t(), keyword) ::
          {:ok, PatchCouponCodeResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_coupon_code(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Coupons, :update_coupon_code},
      url: "/api/coupon-codes/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {CouponCodeUpdateQuery, :t}}],
      response: [
        {200, {PatchCouponCodeResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
