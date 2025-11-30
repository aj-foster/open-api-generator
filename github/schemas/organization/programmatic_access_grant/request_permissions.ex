defmodule GitHub.Organization.ProgrammaticAccessGrant.RequestPermissions do
  @moduledoc """
  Provides struct and type for a Organization.ProgrammaticAccessGrant.RequestPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          organization: map | nil,
          other: map | nil,
          repository: map | nil
        }

  defstruct [:__info__, :organization, :other, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organization: :map, other: :map, repository: :map]
  end
end
