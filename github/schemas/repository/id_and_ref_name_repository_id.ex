defmodule GitHub.Repository.IdAndRefNameRepositoryId do
  @moduledoc """
  Provides struct and type for a Repository.IdAndRefNameRepositoryId
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, repository_ids: [integer] | nil}

  defstruct [:__info__, :repository_ids]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [repository_ids: [:integer]]
  end
end
