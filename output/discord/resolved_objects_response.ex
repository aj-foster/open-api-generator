defmodule ResolvedObjectsResponse do
  @moduledoc """
  Provides struct and type for a ResolvedObjectsResponse
  """

  @type t :: %__MODULE__{
          channels: ResolvedObjectsResponseChannels.t(),
          members: ResolvedObjectsResponseMembers.t(),
          roles: ResolvedObjectsResponseRoles.t(),
          users: ResolvedObjectsResponseUsers.t()
        }

  defstruct [:channels, :members, :roles, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      channels: {ResolvedObjectsResponseChannels, :t},
      members: {ResolvedObjectsResponseMembers, :t},
      roles: {ResolvedObjectsResponseRoles, :t},
      users: {ResolvedObjectsResponseUsers, :t}
    ]
  end
end
