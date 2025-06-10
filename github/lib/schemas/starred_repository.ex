defmodule GitHub.StarredRepository do
  @moduledoc """
  Provides struct and type for a StarredRepository
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, repo: GitHub.Repository.t(), starred_at: DateTime.t()}

  defstruct [:__info__, :repo, :starred_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repo: {GitHub.Repository, :t}, starred_at: {:string, :date_time}]
  end
end
