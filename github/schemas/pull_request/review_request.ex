defmodule GitHub.PullRequest.ReviewRequest do
  @moduledoc """
  Provides struct and type for a PullRequest.ReviewRequest
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, teams: [GitHub.Team.t()], users: [GitHub.User.simple()]}

  defstruct [:__info__, :teams, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [teams: [{GitHub.Team, :t}], users: [{GitHub.User, :simple}]]
  end
end
