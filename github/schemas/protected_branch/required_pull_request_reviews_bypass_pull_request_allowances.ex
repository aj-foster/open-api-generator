defmodule GitHub.ProtectedBranch.RequiredPullRequestReviewsBypassPullRequestAllowances do
  @moduledoc """
  Provides struct and type for a ProtectedBranch.RequiredPullRequestReviewsBypassPullRequestAllowances
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHub.App.t() | nil] | nil,
          teams: [GitHub.Team.t()],
          users: [GitHub.User.simple()]
        }

  defstruct [:__info__, :apps, :teams, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [union: [{GitHub.App, :t}, :null]],
      teams: [{GitHub.Team, :t}],
      users: [{GitHub.User, :simple}]
    ]
  end
end
