defmodule GitHub.PullRequest.Base do
  @moduledoc """
  Provides struct and types for a PullRequest.Base
  """
  use GitHub.Encoder

  @type minimal :: %__MODULE__{
          __info__: map,
          ref: String.t(),
          repo: GitHub.PullRequest.BaseRepo.minimal(),
          sha: String.t()
        }

  @type simple :: %__MODULE__{
          __info__: map,
          label: String.t(),
          ref: String.t(),
          repo: GitHub.Repository.t(),
          sha: String.t(),
          user: GitHub.User.simple() | nil
        }

  @type t :: %__MODULE__{
          __info__: map,
          label: String.t(),
          ref: String.t(),
          repo: GitHub.PullRequest.BaseRepo.t(),
          sha: String.t(),
          user: GitHub.PullRequest.BaseUser.t()
        }

  defstruct [:__info__, :label, :ref, :repo, :sha, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:minimal) do
    [ref: :string, repo: {GitHub.PullRequest.BaseRepo, :minimal}, sha: :string]
  end

  def __fields__(:simple) do
    [
      label: :string,
      ref: :string,
      repo: {GitHub.Repository, :t},
      sha: :string,
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end

  def __fields__(:t) do
    [
      label: :string,
      ref: :string,
      repo: {GitHub.PullRequest.BaseRepo, :t},
      sha: :string,
      user: {GitHub.PullRequest.BaseUser, :t}
    ]
  end
end
