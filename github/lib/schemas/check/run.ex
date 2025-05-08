defmodule GitHub.Check.Run do
  @moduledoc """
  Provides struct and type for a Check.Run
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          app: GitHub.App.t() | nil,
          check_suite: GitHub.Check.RunCheckSuite.t() | nil,
          completed_at: DateTime.t() | nil,
          conclusion: String.t() | nil,
          deployment: GitHub.Deployment.simple() | nil,
          details_url: String.t() | nil,
          external_id: String.t() | nil,
          head_sha: String.t(),
          html_url: String.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          output: GitHub.Check.RunOutput.t(),
          pull_requests: [GitHub.PullRequest.minimal()],
          started_at: DateTime.t() | nil,
          status: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :app,
    :check_suite,
    :completed_at,
    :conclusion,
    :deployment,
    :details_url,
    :external_id,
    :head_sha,
    :html_url,
    :id,
    :name,
    :node_id,
    :output,
    :pull_requests,
    :started_at,
    :status,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {:union, [{GitHub.App, :t}, :null]},
      check_suite: {:union, [{GitHub.Check.RunCheckSuite, :t}, :null]},
      completed_at: {:union, [{:string, :date_time}, :null]},
      conclusion:
        {:enum,
         [
           "success",
           "failure",
           "neutral",
           "cancelled",
           "skipped",
           "timed_out",
           "action_required",
           nil
         ]},
      deployment: {GitHub.Deployment, :simple},
      details_url: {:union, [{:string, :generic}, :null]},
      external_id: {:union, [{:string, :generic}, :null]},
      head_sha: {:string, :generic},
      html_url: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      output: {GitHub.Check.RunOutput, :t},
      pull_requests: [{GitHub.PullRequest, :minimal}],
      started_at: {:union, [{:string, :date_time}, :null]},
      status: {:enum, ["queued", "in_progress", "completed", "waiting", "requested", "pending"]},
      url: {:string, :generic}
    ]
  end
end
