defmodule GitHub.FileCommitCommitParents do
  @moduledoc """
  Provides struct and type for a FileCommitCommitParents
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html_url: String.t() | nil,
          sha: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :html_url, :sha, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html_url: {:string, :generic}, sha: {:string, :generic}, url: {:string, :generic}]
  end
end
