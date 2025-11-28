defmodule GitHub.Pages.SourceHash do
  @moduledoc """
  Provides struct and type for a Pages.SourceHash
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, branch: String.t(), path: String.t()}

  defstruct [:__info__, :branch, :path]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [branch: {:string, :generic}, path: {:string, :generic}]
  end
end
