defmodule Discord.ResolvedObjectsResponse do
  @moduledoc """
  Provides struct and type for a ResolvedObjectsResponse
  """

  @type t :: %__MODULE__{channels: map, members: map, roles: map, users: map}

  defstruct [:channels, :members, :roles, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channels: :map, members: :map, roles: :map, users: :map]
  end
end
