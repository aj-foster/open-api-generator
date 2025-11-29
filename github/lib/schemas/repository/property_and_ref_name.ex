defmodule GitHub.Repository.PropertyAndRefName do
  @moduledoc """
  Provides struct and type for a Repository.PropertyAndRefName
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ref_name: map | nil,
          repository_property: GitHub.Repository.PropertyAndRefNameRepositoryProperty.t() | nil
        }

  defstruct [:__info__, :ref_name, :repository_property]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ref_name: :map,
      repository_property: {GitHub.Repository.PropertyAndRefNameRepositoryProperty, :t}
    ]
  end
end
