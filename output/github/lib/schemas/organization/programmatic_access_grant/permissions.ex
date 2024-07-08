defmodule GitHub.Organization.ProgrammaticAccessGrant.Permissions do
  @moduledoc """
  Provides struct and type for a Organization.ProgrammaticAccessGrant.Permissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          organization:
            GitHub.Organization.ProgrammaticAccessGrant.PermissionsOrganization.t() | nil,
          other: GitHub.Organization.ProgrammaticAccessGrant.PermissionsOther.t() | nil,
          repository: GitHub.Organization.ProgrammaticAccessGrant.PermissionsRepository.t() | nil
        }

  defstruct [:__info__, :organization, :other, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      organization: {GitHub.Organization.ProgrammaticAccessGrant.PermissionsOrganization, :t},
      other: {GitHub.Organization.ProgrammaticAccessGrant.PermissionsOther, :t},
      repository: {GitHub.Organization.ProgrammaticAccessGrant.PermissionsRepository, :t}
    ]
  end
end
