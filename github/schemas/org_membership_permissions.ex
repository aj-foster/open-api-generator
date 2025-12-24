defmodule GitHub.OrgMembershipPermissions do
  @moduledoc """
  Provides struct and type for a OrgMembershipPermissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, can_create_repository: boolean}

  defstruct [:__info__, :can_create_repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [can_create_repository: :boolean]
  end
end
