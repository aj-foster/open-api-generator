defmodule GitHub.ProtectedBranch.PullRequestReviewDismissalRestrictions do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.PullRequestReviewDismissalRestrictions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHub.App.t() | nil] | nil,
          teams: [GitHub.Team.t()] | nil,
          teams_url: String.t() | nil,
          url: String.t() | nil,
          users: [GitHub.User.simple()] | nil,
          users_url: String.t() | nil
        }

  defstruct [:__info__, :apps, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHub.App, :t}, :null]],
      teams: [{GitHub.Team, :t}],
      teams_url: {:string, :generic},
      url: {:string, :generic},
      users: [{GitHub.User, :simple}],
      users_url: {:string, :generic}
    ]
  end
end
