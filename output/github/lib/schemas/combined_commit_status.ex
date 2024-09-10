defmodule GitHub.CombinedCommitStatus do
  @moduledoc """
  Provides struct and type for a CombinedCommitStatus
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          commit_url: String.t(),
          repository: GitHub.Repository.minimal(),
          sha: String.t(),
          state: String.t(),
          statuses: [GitHub.Commit.Status.simple()],
          total_count: integer,
          url: String.t()
        }

  defstruct [:__info__, :commit_url, :repository, :sha, :state, :statuses, :total_count, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit_url: {:string, :uri},
      repository: {GitHub.Repository, :minimal},
      sha: {:string, :generic},
      state: {:string, :generic},
      statuses: [{GitHub.Commit.Status, :simple}],
      total_count: :integer,
      url: {:string, :uri}
    ]
  end
end
