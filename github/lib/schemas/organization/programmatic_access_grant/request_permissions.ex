defmodule GitHub.Organization.ProgrammaticAccessGrant.RequestPermissions do
  @moduledoc """
  Provides struct and type for a Organization.ProgrammaticAccessGrant.RequestPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          organization:
            GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsOrganization.t() | nil,
          other: GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsOther.t() | nil,
          repository:
            GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsRepository.t() | nil
        }

  defstruct [:__info__, :organization, :other, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      organization:
        {GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsOrganization, :t},
      other: {GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsOther, :t},
      repository: {GitHub.Organization.ProgrammaticAccessGrant.RequestPermissionsRepository, :t}
    ]
  end
end
