defmodule Sentry.Teams do
  @moduledoc """
  Provides API endpoints related to teams
  """

  @default_client Sentry.Client

  @doc """
  delete `/api/0/teams/{organization_id_or_slug}/{team_id_or_slug}/`

  Schedules a team for deletion.

  Note: Deletion happens asynchronously and therefore is not immediate. However once deletion has begun the state of a project changes and will be hidden from most public views.
  """
  @spec delete_a_team(organization_id_or_slug :: String.t(), team_id_or_slug :: String.t()) ::
          :ok | :error
  @spec delete_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t(),
          opts :: keyword
        ) :: :ok | :error
  def delete_a_team(organization_id_or_slug, team_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, team_id_or_slug: team_id_or_slug],
      call: {Sentry.Teams, :delete_a_team},
      url: "/api/0/teams/#{organization_id_or_slug}/#{team_id_or_slug}/",
      method: :delete,
      response: [{204, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  get `/api/0/teams/{organization_id_or_slug}/{team_id_or_slug}/`

  Return details on an individual team.
  """
  @spec retrieve_a_team(organization_id_or_slug :: String.t(), team_id_or_slug :: String.t()) ::
          {:ok, Sentry.TeamWithOrganization.t()} | :error
  @spec retrieve_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t(),
          opts :: keyword
        ) :: {:ok, Sentry.TeamWithOrganization.t()} | :error
  def retrieve_a_team(organization_id_or_slug, team_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, team_id_or_slug: team_id_or_slug],
      call: {Sentry.Teams, :retrieve_a_team},
      url: "/api/0/teams/#{organization_id_or_slug}/#{team_id_or_slug}/",
      method: :get,
      response: [{200, {Sentry.TeamWithOrganization, :t}}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Caution: this endpoint may change in the future without notice.

  Return a set of points representing a normalized timestamp and the number of events seen in the period.

  Query ranges are limited to Sentry’s configured time-series resolutions.

  ## Options

    * `stat`: The name of the stat to query `("received", "rejected")`.
    * `since`: A timestamp to set the start of the query in seconds since UNIX epoch.
    * `until`: A timestamp to set the end of the query in seconds since UNIX epoch.
    * `resolution`: An explicit resolution to search for (one of `10s`, `1h`, and `1d`).

  """
  @spec retrieve_event_counts_for_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t()
        ) :: {:ok, [[integer]]} | :error
  @spec retrieve_event_counts_for_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t(),
          opts :: keyword
        ) :: {:ok, [[integer]]} | :error
  def retrieve_event_counts_for_a_team(organization_id_or_slug, team_id_or_slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:resolution, :since, :stat, :until])

    client.request(%{
      args: [organization_id_or_slug: organization_id_or_slug, team_id_or_slug: team_id_or_slug],
      call: {Sentry.Teams, :retrieve_event_counts_for_a_team},
      url: "/api/0/teams/#{organization_id_or_slug}/#{team_id_or_slug}/stats/",
      method: :get,
      query: query,
      response: [{200, [[:integer]]}, {403, :null}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  put `/api/0/teams/{organization_id_or_slug}/{team_id_or_slug}/`

  Update various attributes settings for the given team.

  ## Request Body

  **Content Types**: `application/json`
  """
  @spec update_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t(),
          body :: map
        ) :: {:ok, Sentry.Team.t()} | :error
  @spec update_a_team(
          organization_id_or_slug :: String.t(),
          team_id_or_slug :: String.t(),
          body :: map,
          opts :: keyword
        ) :: {:ok, Sentry.Team.t()} | :error
  def update_a_team(organization_id_or_slug, team_id_or_slug, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [
        organization_id_or_slug: organization_id_or_slug,
        team_id_or_slug: team_id_or_slug,
        body: body
      ],
      call: {Sentry.Teams, :update_a_team},
      url: "/api/0/teams/#{organization_id_or_slug}/#{team_id_or_slug}/",
      body: body,
      method: :put,
      request: [{"application/json", :map}],
      response: [{200, {Sentry.Team, :t}}, {400, :null}, {403, :null}, {404, :null}],
      opts: opts
    })
  end
end
