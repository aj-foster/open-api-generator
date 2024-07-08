defmodule DataPrivacy do
  @moduledoc """
  Provides API endpoint related to data privacy
  """

  @default_client Client

  @doc """
  Request Profile Deletion

  Request a deletion for the profiles corresponding to one of the following identifiers: `email`, `phone_number`, or `id`. If multiple identifiers are provided, we will return an error.

  All profiles that match the provided identifier will be deleted.

  The deletion occurs asynchronously; however, once it has completed, the deleted profile will appear on the [Deleted Profiles page](https://www.klaviyo.com/account/deleted).

  For more information on the deletion process, please refer to our [Help Center docs on how to handle GDPR and CCPA deletion requests](https://help.klaviyo.com/hc/en-us/articles/360004217631-How-to-Handle-GDPR-Requests#record-gdpr-and-ccpa%20%20-deletion-requests2).<br><br>*Rate limits*:<br>Burst: `3/s`<br>Steady: `60/m`

  **Scopes:**
  `data-privacy:write`
  """
  @spec request_profile_deletion(DataPrivacyCreateDeletionJobQuery.t(), keyword) ::
          :ok | {:error, ClientError.json_resp() | ServerError.json_resp()}
  def request_profile_deletion(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {DataPrivacy, :request_profile_deletion},
      url: "/api/data-privacy-deletion-jobs/",
      body: body,
      method: :post,
      request: [{"application/json", {DataPrivacyCreateDeletionJobQuery, :t}}],
      response: [
        {202, :null},
        {"4XX", {ClientError, :json_resp}},
        {"5XX", {ServerError, :json_resp}}
      ],
      opts: opts
    })
  end
end
