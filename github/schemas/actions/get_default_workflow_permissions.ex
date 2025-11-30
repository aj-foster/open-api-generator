defmodule GitHub.Actions.GetDefaultWorkflowPermissions do
  @moduledoc """
  Provides struct and type for a Actions.GetDefaultWorkflowPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          can_approve_pull_request_reviews: boolean,
          default_workflow_permissions: String.t()
        }

  defstruct [:__info__, :can_approve_pull_request_reviews, :default_workflow_permissions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_approve_pull_request_reviews: :boolean,
      default_workflow_permissions: {:enum, ["read", "write"]}
    ]
  end
end
