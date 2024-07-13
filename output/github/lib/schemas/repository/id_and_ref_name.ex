defmodule GitHub.Repository.IdAndRefName do
  @moduledoc """
  Provides struct and type for a Repository.IdAndRefName
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ref_name: map | nil,
          repository_id: GitHub.Repository.IdAndRefNameRepositoryId.t() | nil
        }

  defstruct [:__info__, :ref_name, :repository_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map, repository_id: {GitHub.Repository.IdAndRefNameRepositoryId, :t}]
  end
end
