defmodule GitHub.PendingDeployment do
  @moduledoc """
  Provides struct and type for a PendingDeployment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          current_user_can_approve: boolean,
          environment: GitHub.PendingDeploymentEnvironment.t(),
          reviewers: [GitHub.PendingDeploymentReviewers.t()],
          wait_timer: integer,
          wait_timer_started_at: DateTime.t() | nil
        }

  defstruct [
    :__info__,
    :current_user_can_approve,
    :environment,
    :reviewers,
    :wait_timer,
    :wait_timer_started_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_user_can_approve: :boolean,
      environment: {GitHub.PendingDeploymentEnvironment, :t},
      reviewers: [{GitHub.PendingDeploymentReviewers, :t}],
      wait_timer: :integer,
      wait_timer_started_at: {:union, [{:string, :date_time}, :null]}
    ]
  end
end
