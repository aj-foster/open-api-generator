defmodule GitHub.ProtectedBranch.RequiredPullRequestReviewsDismissalRestrictions do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.RequiredPullRequestReviewsDismissalRestrictions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHub.App.t() | nil] | nil,
          teams: [GitHub.Team.t()],
          teams_url: String.t(),
          url: String.t(),
          users: [GitHub.User.simple()],
          users_url: String.t()
        }

  defstruct [:__info__, :apps, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHub.App, :t}, :null]],
      teams: [{GitHub.Team, :t}],
      teams_url: {:string, :uri},
      url: {:string, :uri},
      users: [{GitHub.User, :simple}],
      users_url: {:string, :uri}
    ]
  end
end
