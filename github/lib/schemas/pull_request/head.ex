defmodule GitHub.PullRequest.Head do
  @moduledoc """
  Provides struct and types for a PullRequest.Head
  """
  use GitHub.Encoder

  @type minimal :: %__MODULE__{
          __info__: map,
          ref: String.t(),
          repo: GitHub.PullRequest.HeadRepo.minimal(),
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
          repo: GitHub.PullRequest.HeadRepo.t() | nil,
          sha: String.t(),
          user: GitHub.PullRequest.HeadUser.t()
        }

  defstruct [:__info__, :label, :ref, :repo, :sha, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:minimal) do
    [
      ref: {:string, :generic},
      repo: {GitHub.PullRequest.HeadRepo, :minimal},
      sha: {:string, :generic}
    ]
  end

  def __fields__(:simple) do
    [
      label: {:string, :generic},
      ref: {:string, :generic},
      repo: {GitHub.Repository, :t},
      sha: {:string, :generic},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end

  def __fields__(:t) do
    [
      label: {:string, :generic},
      ref: {:string, :generic},
      repo: {:union, [{GitHub.PullRequest.HeadRepo, :t}, :null]},
      sha: {:string, :generic},
      user: {GitHub.PullRequest.HeadUser, :t}
    ]
  end
end
