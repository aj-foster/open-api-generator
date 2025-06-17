defmodule GitHub.Repository.NameAndRefName do
  @moduledoc """
  Provides struct and type for a Repository.NameAndRefName
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ref_name: map | nil,
          repository_name: GitHub.Repository.NameAndRefNameRepositoryName.t() | nil
        }

  defstruct [:__info__, :ref_name, :repository_name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ref_name: :map, repository_name: {GitHub.Repository.NameAndRefNameRepositoryName, :t}]
  end
end
