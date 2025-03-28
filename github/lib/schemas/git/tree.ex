defmodule GitHub.Git.Tree do
  @moduledoc """
  Provides struct and types for a Git.Tree
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          sha: String.t(),
          tree: [GitHub.Git.TreeTree.t()],
          truncated: boolean,
          url: String.t()
        }

  defstruct [:__info__, :sha, :tree, :truncated, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      sha: {:string, :generic},
      tree: [{GitHub.Git.TreeTree, :t}],
      truncated: :boolean,
      url: {:string, :uri}
    ]
  end
end
