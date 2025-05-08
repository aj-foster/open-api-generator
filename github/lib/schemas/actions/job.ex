defmodule GitHub.Actions.Job do
  @moduledoc """
  Provides struct and type for a Actions.Job
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          check_run_url: String.t(),
          completed_at: DateTime.t() | nil,
          conclusion: String.t() | nil,
          created_at: DateTime.t(),
          head_branch: String.t() | nil,
          head_sha: String.t(),
          html_url: String.t() | nil,
          id: integer,
          labels: [String.t()],
          name: String.t(),
          node_id: String.t(),
          run_attempt: integer | nil,
          run_id: integer,
          run_url: String.t(),
          runner_group_id: integer | nil,
          runner_group_name: String.t() | nil,
          runner_id: integer | nil,
          runner_name: String.t() | nil,
          started_at: DateTime.t(),
          status: String.t(),
          steps: [GitHub.Actions.Actions.JobSteps.t()] | nil,
          url: String.t(),
          workflow_name: String.t() | nil
        }

  defstruct [
    :__info__,
    :check_run_url,
    :completed_at,
    :conclusion,
    :created_at,
    :head_branch,
    :head_sha,
    :html_url,
    :id,
    :labels,
    :name,
    :node_id,
    :run_attempt,
    :run_id,
    :run_url,
    :runner_group_id,
    :runner_group_name,
    :runner_id,
    :runner_name,
    :started_at,
    :status,
    :steps,
    :url,
    :workflow_name
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      check_run_url: {:string, :generic},
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
      created_at: {:string, :date_time},
      head_branch: {:union, [{:string, :generic}, :null]},
      head_sha: {:string, :generic},
      html_url: {:union, [{:string, :generic}, :null]},
      id: :integer,
      labels: [string: :generic],
      name: {:string, :generic},
      node_id: {:string, :generic},
      run_attempt: :integer,
      run_id: :integer,
      run_url: {:string, :generic},
      runner_group_id: {:union, [:integer, :null]},
      runner_group_name: {:union, [{:string, :generic}, :null]},
      runner_id: {:union, [:integer, :null]},
      runner_name: {:union, [{:string, :generic}, :null]},
      started_at: {:string, :date_time},
      status: {:enum, ["queued", "in_progress", "completed", "waiting", "requested", "pending"]},
      steps: [{GitHub.Actions.Actions.JobSteps, :t}],
      url: {:string, :generic},
      workflow_name: {:union, [{:string, :generic}, :null]}
    ]
  end
end
