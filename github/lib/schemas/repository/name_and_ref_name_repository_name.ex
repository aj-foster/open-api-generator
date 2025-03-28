defmodule GitHub.Repository.NameAndRefNameRepositoryName do
  @moduledoc """
  Provides struct and type for a Repository.NameAndRefNameRepositoryName
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          exclude: [String.t()] | nil,
          include: [String.t()] | nil,
          protected: boolean | nil
        }

  defstruct [:__info__, :exclude, :include, :protected]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [exclude: [string: :generic], include: [string: :generic], protected: :boolean]
  end
end
