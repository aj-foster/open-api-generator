defmodule GitHub.Git.TreeTree do
  @moduledoc """
  Provides struct and type for a Git.TreeTree
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          mode: String.t() | nil,
          path: String.t() | nil,
          sha: String.t() | nil,
          size: integer | nil,
          type: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :mode, :path, :sha, :size, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [mode: :string, path: :string, sha: :string, size: :integer, type: :string, url: :string]
  end
end
