defmodule GitHub.EnvironmentProtectionRules do
  @moduledoc """
  Provides struct and types for a EnvironmentProtectionRules
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: integer,
          node_id: String.t(),
          prevent_self_review: boolean | nil,
          reviewers: [GitHub.EnvironmentProtectionRulesReviewers.t()] | nil,
          type: String.t(),
          wait_timer: integer | nil
        }

  defstruct [:__info__, :id, :node_id, :prevent_self_review, :reviewers, :type, :wait_timer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :integer,
      node_id: {:string, :generic},
      prevent_self_review: :boolean,
      reviewers: [{GitHub.EnvironmentProtectionRulesReviewers, :t}],
      type: {:string, :generic},
      wait_timer: :integer
    ]
  end
end
