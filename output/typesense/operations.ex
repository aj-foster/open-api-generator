defmodule Operations do
  @moduledoc """
  Provides API endpoints related to operations
  """

  @default_client Client

  @doc """
  Creates a point-in-time snapshot of a Typesense node's state and data in the specified directory.

  Creates a point-in-time snapshot of a Typesense node's state and data in the specified directory. You can then backup the snapshot directory that gets created and later restore it as a data directory, as needed.

  ## Options

    * `snapshot_path`: The directory on the server where the snapshot should be saved.

  """
  @spec take_snapshot(keyword) :: {:ok, SuccessStatus.t()} | :error
  def take_snapshot(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:snapshot_path])

    client.request(%{
      args: [],
      call: {Operations, :take_snapshot},
      url: "/operations/snapshot",
      method: :post,
      query: query,
      response: [{201, {SuccessStatus, :t}}],
      opts: opts
    })
  end

  @doc """
  Triggers a follower node to initiate the raft voting process, which triggers leader re-election.

  Triggers a follower node to initiate the raft voting process, which triggers leader re-election. The follower node that you run this operation against will become the new leader, once this command succeeds.
  """
  @spec vote(keyword) :: {:ok, SuccessStatus.t()} | :error
  def vote(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {Operations, :vote},
      url: "/operations/vote",
      method: :post,
      response: [{200, {SuccessStatus, :t}}],
      opts: opts
    })
  end
end
