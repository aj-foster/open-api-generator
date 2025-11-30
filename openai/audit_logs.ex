defmodule OpenAI.AuditLogs do
  @moduledoc """
  Provides API endpoint related to audit logs
  """

  @default_client OpenAI.Client

  @doc """
  List user actions and configuration changes within this organization.

  ## Options

    * `effective_at`: Return only events whose `effective_at` (Unix seconds) is in this range.
    * `project_ids[]`: Return only events for these projects.
    * `event_types[]`: Return only events with a `type` in one of these values. For example, `project.created`. For all options, see the documentation for the [audit log object](/docs/api-reference/audit-logs/object).
    * `actor_ids[]`: Return only events performed by these actors. Can be a user ID, a service account ID, or an api key tracking ID.
    * `actor_emails[]`: Return only events performed by users with these emails.
    * `resource_ids[]`: Return only events performed on these targets. For example, a project ID updated.
    * `limit`: A limit on the number of objects to be returned. Limit can range between 1 and 100, and the default is 20.
      
    * `after`: A cursor for use in pagination. `after` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, ending with obj_foo, your subsequent call can include after=obj_foo in order to fetch the next page of the list.
      
    * `before`: A cursor for use in pagination. `before` is an object ID that defines your place in the list. For instance, if you make a list request and receive 100 objects, starting with obj_foo, your subsequent call can include before=obj_foo in order to fetch the previous page of the list.
      

  """
  @spec list_audit_logs(opts :: keyword) :: {:ok, OpenAI.ListAuditLogsResponse.t()} | :error
  def list_audit_logs(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :"actor_emails[]",
        :"actor_ids[]",
        :after,
        :before,
        :effective_at,
        :"event_types[]",
        :limit,
        :"project_ids[]",
        :"resource_ids[]"
      ])

    client.request(%{
      args: [],
      call: {OpenAI.AuditLogs, :list_audit_logs},
      url: "/organization/audit_logs",
      method: :get,
      query: query,
      response: [{200, {OpenAI.ListAuditLogsResponse, :t}}],
      opts: opts
    })
  end
end
