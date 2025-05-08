defmodule GitHub.Branch.RestrictionPolicy do
  @moduledoc """
  Provides struct and type for a Branch.RestrictionPolicy
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apps: [GitHub.Branch.RestrictionPolicyApps.t()],
          apps_url: String.t(),
          teams: [GitHub.Branch.RestrictionPolicyTeams.t()],
          teams_url: String.t(),
          url: String.t(),
          users: [GitHub.Branch.RestrictionPolicyUsers.t()],
          users_url: String.t()
        }

  defstruct [:__info__, :apps, :apps_url, :teams, :teams_url, :url, :users, :users_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apps: [{GitHub.Branch.RestrictionPolicyApps, :t}],
      apps_url: {:string, :uri},
      teams: [{GitHub.Branch.RestrictionPolicyTeams, :t}],
      teams_url: {:string, :uri},
      url: {:string, :uri},
      users: [{GitHub.Branch.RestrictionPolicyUsers, :t}],
      users_url: {:string, :uri}
    ]
  end
end
