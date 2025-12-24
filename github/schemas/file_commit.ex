defmodule GitHub.FileCommit do
  @moduledoc """
  Provides struct and type for a FileCommit
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          commit: GitHub.FileCommitCommit.t(),
          content: GitHub.FileCommitContent.t() | nil
        }

  defstruct [:__info__, :commit, :content]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {GitHub.FileCommitCommit, :t},
      content: {:union, [{GitHub.FileCommitContent, :t}, :null]}
    ]
  end
end
