defmodule Profiles do
  @moduledoc """
  Provides API endpoints related to profiles
  """

  @default_client Client

  @doc """
  Create or Update Profile

  Given a set of profile attributes and optionally an ID, create or update a profile.

  Returns 201 if a new profile was created, 200 if an existing profile was updated.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:write`
  """
  @spec create_or_update_profile(ProfileUpsertQuery.t(), keyword) ::
          {:ok, PostProfileResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_or_update_profile(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :create_or_update_profile},
      url: "/api/profile-import/",
      body: body,
      method: :post,
      request: [{"application/json", {ProfileUpsertQuery, :t}}],
      response: [
        {200, {PostProfileResponse, :t}},
        {201, {PostProfileResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create Profile

  Create a new profile.

  If you use a phone number as the profile identifier and SMS is not set up in the Klaviyo account,
  you'll need to include at least one other identifier attribute (`email` or `external_id`)
  in addition to the `phone_number` attribute for the API call to work.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:write`
  """
  @spec create_profile(ProfileCreateQuery.t(), keyword) ::
          {:ok, PostProfileResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_profile(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :create_profile},
      url: "/api/profiles/",
      body: body,
      method: :post,
      request: [{"application/json", {ProfileCreateQuery, :t}}],
      response: [
        {201, {PostProfileResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Create or Update Push Token

  Create or update a push token.

  This endpoint can be used to migrate push tokens from another platform to Klaviyo. Please use our mobile SDKs ([iOS](https://github.com/klaviyo/klaviyo-swift-sdk) and [Android](https://github.com/klaviyo/klaviyo-android-sdk)) to create push tokens from users' devices.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:write`
  `push-tokens:write`
  """
  @spec create_push_token(PushTokenCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def create_push_token(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :create_push_token},
      url: "/api/push-tokens/",
      body: body,
      method: :post,
      request: [{"application/json", {PushTokenCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job

  Get a bulk profile import job with the given job ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:read`
  `profiles:read`

  ## Options

    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[profile-bulk-import-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_bulk_profile_import_job(String.t(), keyword) ::
          {:ok, GetProfileImportJobResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job(job_id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[list]", :"fields[profile-bulk-import-job]", :include])

    client.request(%{
      args: [job_id: job_id],
      call: {Profiles, :get_bulk_profile_import_job},
      url: "/api/profile-bulk-import-jobs/#{job_id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileImportJobResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job Errors

  Get import errors for the bulk profile import job with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `profiles:read`

  ## Options

    * `fields[import-error]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.

  """
  @spec get_bulk_profile_import_job_import_errors(String.t(), keyword) ::
          {:ok, GetImportErrorResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job_import_errors(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[import-error]", :"page[cursor]", :"page[size]"])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_bulk_profile_import_job_import_errors},
      url: "/api/profile-bulk-import-jobs/#{id}/import-errors/",
      method: :get,
      query: query,
      response: [
        {200, {GetImportErrorResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job Lists

  Get list for the bulk profile import job with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:read`

  ## Options

    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_bulk_profile_import_job_lists(String.t(), keyword) ::
          {:ok, GetListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job_lists(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[list]"])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_bulk_profile_import_job_lists},
      url: "/api/profile-bulk-import-jobs/#{id}/lists/",
      method: :get,
      query: query,
      response: [
        {200, {GetListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job Profiles

  Get profiles for the bulk profile import job with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `profiles:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.

  """
  @spec get_bulk_profile_import_job_profiles(String.t(), keyword) ::
          {:ok, GetProfileResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job_profiles(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"additional-fields[profile]",
        :"fields[profile]",
        :"page[cursor]",
        :"page[size]"
      ])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_bulk_profile_import_job_profiles},
      url: "/api/profile-bulk-import-jobs/#{id}/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job Relationships Lists

  Get list relationship for the bulk profile import job with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:read`
  """
  @spec get_bulk_profile_import_job_relationships_lists(String.t(), keyword) ::
          {:ok, GetProfileImportJobListRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job_relationships_lists(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_bulk_profile_import_job_relationships_lists},
      url: "/api/profile-bulk-import-jobs/#{id}/relationships/lists/",
      method: :get,
      response: [
        {200, {GetProfileImportJobListRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Job Relationships Profiles

  Get profile relationships for the bulk profile import job with the given ID.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `profiles:read`

  ## Options

    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.

  """
  @spec get_bulk_profile_import_job_relationships_profiles(String.t(), keyword) ::
          {:ok, GetProfileImportJobProfileRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_job_relationships_profiles(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"page[cursor]", :"page[size]"])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_bulk_profile_import_job_relationships_profiles},
      url: "/api/profile-bulk-import-jobs/#{id}/relationships/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileImportJobProfileRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Bulk Profile Import Jobs

  Get all bulk profile import jobs.

  Returns a maximum of 100 jobs per request.<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:read`
  `profiles:read`

  ## Options

    * `fields[profile-bulk-import-job]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`status`: `any`, `equals`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_bulk_profile_import_jobs(keyword) ::
          {:ok, GetProfileImportJobResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_bulk_profile_import_jobs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"fields[profile-bulk-import-job]",
        :filter,
        :"page[cursor]",
        :"page[size]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Profiles, :get_bulk_profile_import_jobs},
      url: "/api/profile-bulk-import-jobs/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileImportJobResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profile

  Get the profile with the given profile ID.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `fields[segment]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `include`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#relationships

  """
  @spec get_profile(String.t(), keyword) ::
          {:ok, GetProfileResponseCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profile(id, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"additional-fields[profile]",
        :"fields[list]",
        :"fields[profile]",
        :"fields[segment]",
        :include
      ])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_profile},
      url: "/api/profiles/#{id}/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileResponseCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profile Lists

  Get list memberships for a profile with the given profile ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:read`
  `profiles:read`

  ## Options

    * `fields[list]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_profile_lists(String.t(), keyword) ::
          {:ok, GetListResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profile_lists(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[list]"])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_profile_lists},
      url: "/api/profiles/#{id}/lists/",
      method: :get,
      query: query,
      response: [
        {200, {GetListResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profile Relationships Lists

  Get list memberships for a profile with the given profile ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `lists:read`
  `profiles:read`
  """
  @spec get_profile_relationships_lists(String.t(), keyword) ::
          {:ok, GetProfileListRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profile_relationships_lists(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_profile_relationships_lists},
      url: "/api/profiles/#{id}/relationships/lists/",
      method: :get,
      response: [
        {200, {GetProfileListRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profile Relationships Segments

  Get segment membership relationships for a profile with the given profile ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `profiles:read`
  `segments:read`
  """
  @spec get_profile_relationships_segments(String.t(), keyword) ::
          {:ok, GetProfileSegmentRelationshipsResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profile_relationships_segments(id, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_profile_relationships_segments},
      url: "/api/profiles/#{id}/relationships/segments/",
      method: :get,
      response: [
        {200, {GetProfileSegmentRelationshipsResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profile Segments

  Get segment memberships for a profile with the given profile ID.<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `profiles:read`
  `segments:read`

  ## Options

    * `fields[segment]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets

  """
  @spec get_profile_segments(String.t(), keyword) ::
          {:ok, GetSegmentResponseCollection.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profile_segments(id, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:"fields[segment]"])

    client.request(%{
      args: [id: id],
      call: {Profiles, :get_profile_segments},
      url: "/api/profiles/#{id}/segments/",
      method: :get,
      query: query,
      response: [
        {200, {GetSegmentResponseCollection, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Get Profiles

  Get all profiles in an account.

  Profiles can be sorted by the following fields in ascending and descending order: `id`, `created`, `updated`, `email`, `subscriptions.email.marketing.suppression.timestamp`, `subscriptions.email.marketing.list_suppressions.timestamp`<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`<br><br>Rate limits when using the `additional-fields[profile]=predictive_analytics` parameter in your API request:<br>Burst: `10/s`<br>Steady: `150/m`<br><br>To learn more about how the `additional-fields` parameter impacts rate limits, check out our [Rate limits, status codes, and errors](https://developers.klaviyo.com/en/v2024-02-15/docs/rate_limits_and_error_handling) guide.

  **Scopes:**
  `profiles:read`

  ## Options

    * `additional-fields[profile]`: Request additional fields not included by default in the response. Supported values: 'subscriptions', 'predictive_analytics'
    * `fields[profile]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sparse-fieldsets
    * `filter`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#filtering<br>Allowed field(s)/operator(s):<br>`id`: `any`, `equals`<br>`email`: `any`, `equals`<br>`phone_number`: `any`, `equals`<br>`external_id`: `any`, `equals`<br>`_kx`: `equals`<br>`created`: `greater-than`, `less-than`<br>`updated`: `greater-than`, `less-than`<br>`subscriptions.email.marketing.suppression.timestamp` : `greater-than`, `greater-or-equal`, `less-than`, `less-or-equal`<br>`subscriptions.email.marketing.suppression.reason` : `equals`<br>`subscriptions.email.marketing.list_suppressions.list_id` : `equals`<br>`subscriptions.email.marketing.list_suppressions.reason` : `equals`<br>`subscriptions.email.marketing.list_suppressions.timestamp` : `greater-than`, `greater-or-equal`, `less-than`, `less-or-equal`
    * `page[cursor]`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#pagination
    * `page[size]`: Default: 20. Min: 1. Max: 100.
    * `sort`: For more information please visit https://developers.klaviyo.com/en/v2024-02-15/reference/api-overview#sorting

  """
  @spec get_profiles(keyword) ::
          {:ok, GetProfileResponseCollectionCompoundDocument.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def get_profiles(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"additional-fields[profile]",
        :"fields[profile]",
        :filter,
        :"page[cursor]",
        :"page[size]",
        :sort
      ])

    client.request(%{
      args: [],
      call: {Profiles, :get_profiles},
      url: "/api/profiles/",
      method: :get,
      query: query,
      response: [
        {200, {GetProfileResponseCollectionCompoundDocument, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Merge Profiles

  Merge a given related profile into a profile with the given profile ID.

  The profile provided under `relationships` (the "source" profile) will be merged into the profile provided by the ID in the base data object (the "destination" profile).
  This endpoint queues an asynchronous task which will merge data from the source profile into the destination profile, deleting the source profile in the process. This endpoint accepts only one source profile.

  To learn more about how profile data is preserved or overwritten during a merge, please [visit our Help Center](https://help.klaviyo.com/hc/en-us/articles/115005073847#merge-2-profiles3).<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `profiles:write`
  """
  @spec merge_profiles(ProfileMergeQuery.t(), keyword) ::
          {:ok, PostProfileMergeResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def merge_profiles(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :merge_profiles},
      url: "/api/profile-merge/",
      body: body,
      method: :post,
      request: [{"application/json", {ProfileMergeQuery, :t}}],
      response: [
        {201, {PostProfileMergeResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Spawn Bulk Profile Import Job

  Create a bulk profile import job to create or update a batch of profiles.

  Accepts up to 10,000 profiles per request. The maximum allowed payload size is 5MB.

  To learn more, see our [Bulk Profile Import API guide](https://developers.klaviyo.com/en/docs/use_klaviyos_bulk_profile_import_api).<br><br>*Rate limits*:<br>Burst: `10/s`<br>Steady: `150/m`

  **Scopes:**
  `lists:write`
  `profiles:write`
  """
  @spec spawn_bulk_profile_import_job(ProfileImportJobCreateQuery.t(), keyword) ::
          {:ok, PostProfileImportJobResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def spawn_bulk_profile_import_job(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :spawn_bulk_profile_import_job},
      url: "/api/profile-bulk-import-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {ProfileImportJobCreateQuery, :t}}],
      response: [
        {202, {PostProfileImportJobResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Subscribe Profiles

  Subscribe one or more profiles to email marketing, SMS marketing, or both. If the provided list has double opt-in enabled, profiles will receive a message requiring their confirmation before subscribing. Otherwise, profiles will be immediately subscribed without receiving a confirmation message.
  Learn more about [consent in this guide](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api).

  If a list is not provided, the opt-in process used will be determined by the [account-level default opt-in setting](https://www.klaviyo.com/settings/account/api-keys).

  To add someone to a list without changing their subscription status, use [Add Profile to List](https://developers.klaviyo.com/en/reference/create_list_relationships).

  This API will remove any `UNSUBSCRIBE`, `SPAM_REPORT` or `USER_SUPPRESSED` suppressions from the provided profiles. Learn more about [suppressed profiles](https://help.klaviyo.com/hc/en-us/articles/115005246108-Understanding-suppressed-email-profiles#what-is-a-suppressed-profile-1).

  Maximum number of profiles can be submitted for subscription: 100<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `lists:write`
  `profiles:write`
  `subscriptions:write`
  """
  @spec subscribe_profiles(SubscriptionCreateJobCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def subscribe_profiles(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :subscribe_profiles},
      url: "/api/profile-subscription-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {SubscriptionCreateJobCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Suppress Profiles

  Manually suppress one or more profiles. Such profiles will have `USER_SUPPRESSED` as their suppression reason. Manually suppressed profiles _will not_ receive email marketing. Learn more about [suppressed profiles](https://help.klaviyo.com/hc/en-us/articles/115005246108-Understanding-suppressed-email-profiles#what-is-a-suppressed-profile-1).
  Learn about [collecting consent and best practices](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api).

  Not supported for SMS marketing.

  Maximum number of profile can be submitted for suppression: 100<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:write`
  `subscriptions:write`
  """
  @spec suppress_profiles(SuppressionCreateJobCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def suppress_profiles(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :suppress_profiles},
      url: "/api/profile-suppression-bulk-create-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {SuppressionCreateJobCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Unsubscribe Profiles

  Unsubscribe one or more profiles to email marketing, SMS marketing, or both. Learn more about [consent in this guide](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api).

  To remove someone from a list without changing their subscription status, use [Remove Profile from List](https://developers.klaviyo.com/en/reference/delete_list_relationships).

  Maximum number of profile can be submitted for unsubscription: 100<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `lists:write`
  `profiles:write`
  `subscriptions:write`
  """
  @spec unsubscribe_profiles(SubscriptionDeleteJobCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def unsubscribe_profiles(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :unsubscribe_profiles},
      url: "/api/profile-subscription-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {SubscriptionDeleteJobCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Unsuppress Profiles

  Unsuppress one or more profiles, this will remove any Manual Suppressions (USER_SUPPRESSED) on these profiles. A profile may receive email marketing after a manual suppression is removed so long as they have not revoked [consent](https://developers.klaviyo.com/en/docs/collect_email_and_sms_consent_via_api), i.e. unsubscribed.

  Not supported for SMS marketing. Only manual suppressions (USER_SUPPRESSED) will be removed. `UNSUBSCRIBE` and `SPAM_REPORT` suppressions are removed whenever a [profile resubscribes](https://developers.klaviyo.com/en/reference/subscribe_profiles).
  `INVALID_EMAIL` and `HARD_BOUNCE` suppressions cannot be removed by the API.

  Maximum number of profile can be submitted for unsuppression: 100<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `subscriptions:write`
  """
  @spec unsuppress_profiles(SuppressionDeleteJobCreateQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def unsuppress_profiles(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Profiles, :unsuppress_profiles},
      url: "/api/profile-suppression-bulk-delete-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {SuppressionDeleteJobCreateQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end

  @doc """
  Update Profile

  Update the profile with the given profile ID.

  If you use a phone number as the profile identifier and SMS is not set up in the Klaviyo account,
  you'll need to include at least one other identifier attribute (`email` or `external_id`)
  in addition to the `phone_number` attribute for the API call to work.<br><br>*Rate limits*:<br>Burst: `75/s`<br>Steady: `700/m`

  **Scopes:**
  `profiles:write`
  """
  @spec update_profile(String.t(), ProfilePartialUpdateQuery.t(), keyword) ::
          {:ok, PatchProfileResponse.t()}
          | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def update_profile(id, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [id: id, body: body],
      call: {Profiles, :update_profile},
      url: "/api/profiles/#{id}/",
      body: body,
      method: :patch,
      request: [{"application/json", {ProfilePartialUpdateQuery, :t}}],
      response: [
        {200, {PatchProfileResponse, :t}},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
